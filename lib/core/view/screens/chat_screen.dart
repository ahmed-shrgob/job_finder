import 'package:flutter/material.dart';
import 'package:job_finder/chat_pro.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/helper/intl.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final String? conversationId;
  final String id;
  final String name;
  ChatScreen(
      {super.key, required this.name, required this.id, this.conversationId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

final TextEditingController _controller = TextEditingController();
class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    print("${widget.conversationId} and ${widget.id} and ${widget.name}");
    final chatProvider = Provider.of<ChatProvider>(context, listen: false)
      ..fetchMessages(
          senderId: userId!, recipientId: widget.id, conversationId: widget.conversationId)
      ..joinConversation(
          sender: userId!, recipient: widget.id, conversationId: widget.conversationId);

    return Scaffold(
      appBar: AppBar(
    backgroundColor: AppColor.mainColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Row(
      children: [
        CircleAvatar(
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
          backgroundColor: Colors.blueGrey,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  widget.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    actions: [
      PopupMenuButton<String>(
        onSelected: (String value) {
          // تنفيذ عملية الخيار المحدد هنا
        },
        itemBuilder: (BuildContext context) {
          return {'الإعدادات', 'معلومات '}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    ],
  ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                return ListView.builder(
                  reverse: true,
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messages[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Align(
                        alignment: message.sender == userId
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: message.sender == userId
                                    ? AppColor.mainColor
                                    : Colors.grey[200],
                              ),
                              child: Text(
                                "${message.text}",
                                style: TextStyle(
                                  color: message.sender == userId
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "${convertTimeforMessage(DateTime.parse(message.createdAt!))}",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10.0),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: 'اكتب رسالة...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.mainColor,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        chatProvider.sendMessage(
                          message: _controller.text,
                          conversationId: widget.conversationId,
                          sender: userId,
                          recipient: widget.id,
                        );
                        _controller.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
