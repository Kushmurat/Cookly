import 'package:flutter/material.dart';

class HomeController extends BaseController implements HomeNavigationHandler {
  final AuthHolder _authHolder;
  final HomeNavigator _homeNavigator;

  /// The key for the Stack widget containing the screens controlled by this controller.
  final GlobalKey<AppLazyIndexedStackState> _stackKey;

  /// List of keys for Navigators that manage navigation within each tab.
  final Map<HomeNavigationItemId, GlobalKey<NavigatorState>> navigatorKeysMap =
  homeNavigationItems.asMap().map((index, navigationItem) =>
      MapEntry(navigationItem.id, GlobalKey<NavigatorState>()));

  /// A mapping from [HomeNavigationItemId] to corresponding keys used to access
  /// [HomeNavigationTabState] for each tab if it is defined.
  final Map<HomeNavigationItemId, GlobalKey<HomeNavigationTabState>>
  tabKeysMap = homeNavigationItems.asMap().map(
          (_, item) => MapEntry(item.id, GlobalKey<HomeNavigationTabState>()));

  /// List of route observers for each tab, used to proxy route change events from
  /// the root route observer down.
  final Map<HomeNavigationItemId, AppTabRouteObserver> tabRouteObserversMap =
  homeNavigationItems
      .asMap()
      .map((_, item) => MapEntry(item.id, AppTabRouteObserver()));

  HomeNavigationItemId get currentNavItemId => _currentNavItemIdModel.val;
  late ValueModel<HomeNavigationItemId> _currentNavItemIdModel;

  /// The temporary navigation item ID used to switch tabs.
  /// This is used to navigate after authentication.
  late final ValueModel<HomeNavigationItemId?> _tempNavItemIdModel = ValueModel(
    controller: this,
  );

  int get currentTabIndex =>
      navigationItems.indexWhere((it) => it.id == currentNavItemId);

  List<HomeNavigationItemConfig> get navigationItems =>
      _navigationItemsModel.val;
  late ValueModel<List<HomeNavigationItemConfig>> _navigationItemsModel;

  HomeController({
    required AuthHolder authHolder,
    required HomeNavigator homeNavigator,
    required GlobalKey<AppLazyIndexedStackState> stackKey,
  })  : _authHolder = authHolder,
        _homeNavigator = homeNavigator,
        _stackKey = stackKey {
    homeNavigator.setNavigationHandler(this);

    _currentNavItemIdModel =
        ValueModel(controller: this, initialVal: HomeNavigationItemId.main);
    _navigationItemsModel = ValueModel(controller: this, initialVal: []);

    _resetNavigation();
  }

  void _resetNavigation() {
    // Filter the navigation items by permission.
    final newNavigationItems = homeNavigationItems;

    if (navigationItems.indexWhere((it) => it.id == currentNavItemId) < 0) {
      _currentNavItemIdModel.val = newNavigationItems.first.id;
    }

    _stackKey.currentState?.resetChildren();

    // It is necessary to assign this after resetting children to avoid
    // the duplicate GlobalKey exception.
    _navigationItemsModel.val = newNavigationItems;
  }

  @override
  void dispose() {
    _homeNavigator.setNavigationHandler(null);
    super.dispose();
  }

  /// The NavigatorState for the current tab.
  NavigatorState? get currentNavigatorState =>
      navigatorKeysMap[currentNavItemId]?.currentState;

  @override
  void setCurrentTab(HomeNavigationItemId itemId) {
    final index = navigationItems.indexWhere((item) => item.id == itemId);
    if (index >= 0) {
      AppRouter.popUntil((route) => route.settings.name == RouteNames.home);
      if (currentNavItemId == itemId) {
        _popToRoot();
      } else {
        // Execute lifecycle callbacks.
        final currentTabRouteObserver = tabRouteObserversMap[currentNavItemId];
        currentTabRouteObserver?.onTabDeselected();

        _currentNavItemIdModel.val = itemId;

        final newTabRouteObserver = tabRouteObserversMap[itemId];
        newTabRouteObserver?.onTabSelected();
      }
    }
  }

  @override
  void pushTabScreen(
      HomeNavigationItemId itemId,
      void Function(BuildContext context) screenOpenFunction,
      ) {
    final state = tabKeysMap[itemId]?.currentState;
    if (state != null) {
      state.pushScreen(screenOpenFunction);
    }
  }

  void _popToRoot() async {
    bool isHandled = false;
    final navigatorState = currentNavigatorState;
    Route? route = navigatorState?.currentRoute;
    while (!route!.isFirst && !isHandled) {
      await navigatorState?.maybePop();
      final newRoute = navigatorState?.currentRoute;
      isHandled = newRoute == route;
      route = newRoute;
    }
  }

  Future<bool> onWillPop() async {
    final navigatorState = currentNavigatorState;
    if (navigatorState!.canPop()) {
      navigatorState.maybePop();
      return false;
    } else {
      final tabState = tabKeysMap[currentNavItemId]!.currentState;
      final isPopAllowed =
          tabState == null || await tabState.handleBackAction();
      if (isPopAllowed) {
        return AppDialog.confirm(title: 'Закрыть приложение?');
      } else {
        return false;
      }
    }
  }

  void setTempNavItemId(HomeNavigationItemId itemId) {
    _tempNavItemIdModel.val = itemId;
  }

  @override
  void onAuthenticated() {
    final tempNavItemId = _tempNavItemIdModel.valOrNull;
    if (tempNavItemId != null) {
      setCurrentTab(tempNavItemId);
      _tempNavItemIdModel.val = null;
    }
  }
}
