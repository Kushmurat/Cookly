import 'package:flutter/material.dart';

import '../../../services/api_chatGPT.dart';

class AiChatScreen extends StatefulWidget {
  @override
  _AiChatScreenState createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> chatHistory = [
    {'role': 'system', 'content': 'You are a helpful assistant.'},
  ];
  bool _isLoading = false;

  void _sendMessage(String message) async {
    setState(() {
      _isLoading = true;
      chatHistory.add({'role': 'user', 'content': message});
    });

    // final response = await ApiService.sendMessageWithHistory(chatHistory);

    setState(() {
      // chatHistory.add({'role': 'assistant', 'content': response});
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                final message = chatHistory[index];
                final isUser = message['role'] == 'user';

                return ListTile(
                  title: Text(
                    message['content']!,
                    textAlign: isUser ? TextAlign.end : TextAlign.start,
                    style: TextStyle(
                      color: isUser ? Colors.blue : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading) CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: "Введите сообщение"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
