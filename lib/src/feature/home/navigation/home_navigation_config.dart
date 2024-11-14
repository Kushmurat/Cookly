import 'package:flutter/material.dart';

import '../../ai_chat/ai_chat.dart';
import '../../favorite/favorite.dart';
import '../../menu/main_menu.dart';
import 'package:flutter/cupertino.dart';

import '../../profile/profile.dart';
import '../../shop/shop.dart';
import 'home.controller.dart';

enum HomeNavigationItemId {
  home,
  favorite,
  ai_cook,
  shop,
  profile,
}

typedef HomeTabScreenBuilder = Widget Function(BuildContext context, Key key);

class HomeNavigationItemConfig {
  final HomeNavigationItemId id;
  final String iconName;
  final String title;
  final HomeTabScreenBuilder screenBuilder;
  final Widget Function(HomeController ctrl)? badgeBuilder;


  HomeNavigationItemConfig({
    required this.id,
    required this.iconName,
    required this.title,
    required this.screenBuilder,
    this.badgeBuilder,


  });
}

final homeNavigationItems = <HomeNavigationItemConfig>[
  HomeNavigationItemConfig(
    id: HomeNavigationItemId.home,
    iconName: 'ic_home',
    title: 'Главная',
    screenBuilder: (_, key) => MainMenu(key: key),
  ),
  HomeNavigationItemConfig(
    id: HomeNavigationItemId.favorite,
    iconName: 'ic_star',
    title: 'Избранное',
    screenBuilder: (_, key) => FavoritePage(key: key,
    ),
  ),
  HomeNavigationItemConfig(
    id: HomeNavigationItemId.ai_cook,
    iconName: 'ic_ai_cook',
    title: 'Ассистент',
    screenBuilder: (_, key) => AiChatScreen(key: key,
    ),
  ),HomeNavigationItemConfig(
    id: HomeNavigationItemId.shop,
    iconName: 'ic_basket',
    title: 'Магазин',
    screenBuilder: (_, key) => ShopScreen(key: key,
    ),
  ),
  HomeNavigationItemConfig(
    id: HomeNavigationItemId.profile,
    iconName: 'ic_profile',
    title: 'Профиль',
    screenBuilder: (_, key) => ProfileScreen(key: key,
    ),
  ),
];
