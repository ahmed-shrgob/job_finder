import 'package:flutter/material.dart';
import 'package:job_finder/chat_pro.dart';
import 'package:job_finder/constants/cons_colors.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/view/screens/chat_screen.dart';
import 'package:job_finder/helper/intl.dart';
import 'package:provider/provider.dart';

class ConversationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ChatProvider>(context, listen: false)..initSocket()
      ..fetchConversations(userId!);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        elevation: 0,
        centerTitle: true,
        title: Text('المحادثات'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                return ListView.builder(
                  itemCount: chatProvider.conversations.length,
                  itemBuilder: (context, index) {
                    var conversation = chatProvider.conversations[index];
                    final DateTime createdAt = DateTime.parse(conversation.lastMessage!['createdAt']);
                    // final String formattedTime = DateFormat('hh:mm a').format(createdAt);
                    // final int unreadMessages = conversation.unreadMessagesCount;

                    return ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                name: conversation.lastMessage!["recipientName"],
                                id: "${conversation.otherParticipantID}",
                                conversationId: conversation.id),
                          )),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.blueGrey,
                      ),
                      title: Text("${conversation.lastMessage!["recipientName"]}"),
                       subtitle: Text(
                        conversation.lastMessage!['text'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(convertTimeforConversation(createdAt), style: TextStyle(fontSize: 12, color: Colors.grey)),
                          // if (unreadMessages > 0)
                          //   Container(
                          //     padding: EdgeInsets.all(6),
                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       color: Colors.green,
                          //     ),
                          //     child: Text(
                          //       '$unreadMessages',
                          //       style: TextStyle(color: Colors.white, fontSize: 12),
                          //     ),
                            // ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
