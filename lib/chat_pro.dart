import 'package:flutter/foundation.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/model/conversation_model.dart';
import 'package:job_finder/core/model/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class ChatProvider with ChangeNotifier {
  List<Message> _messages = [];
  List<Message> get messages => _messages;

  List<Conversation> _conversations = [];
  List<Conversation> get conversations => _conversations;

  ChatProvider() {
    initSocket();
    // _initializeSocket();
    // fetchConversations(userId!);
  }
  late IO.Socket _socket;
  void initstate() {
//  _initializeSocket();
    // fetchConversations(userId!);
  }

  initSocket() {
    _socket = IO.io("ws://${APIRoute.socketRoot}:3000", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    _socket.connect();
    _socket.onConnect((_) {
      _socket.emit('join all conversations', userId);
      print("Connection established");
    });
    _socket.onDisconnect((_) => print("connection Disconnection"));
    _socket.onConnectError((err) => print("tehe errrr is ${err}"));
    _socket.onError((err) => print("tehe errrr is ${err}"));
    _socket.on('connection', (_) {
      print('connected to websocket');
    });

    _socket.on('chat message', (data) {
      print("Received chat message: $data");
      messages.add(Message.fromJson(data));
      print('fetchConversations is true');
      // fetchConversations(userId!);
      _socket.on('message sent', (_) {
        fetchConversations(userId!);
      });

      notifyListeners();
    });

    _socket.on('conversations', (data) {
      print("Received conversations: $data");
      _conversations = [];
      for (var element in data) {
        conversations.add(Conversation.fromJson(element));
      }
      // _conversations = (data as List).map((e) {
      //   print(e["senderNeme"]);
      //   return ;
      // }).toList();
      notifyListeners();
    });
    _socket.on('fetch messages', (data) {
      print("Received fetch messages: $data");
      print(data);
      _messages = (data as List).map((e) => Message.fromJson(e)).toList();
      notifyListeners();
    });

    _socket.on('disconnect', (_) {
      print('disconnected from websocket');
    });
  }

  void sendMessage({
    required String message,
    required String? conversationId,
    required String? sender,
    required String? recipient,
  }) async {
    _socket.emit('chat message', {
      "conversationId": conversationId,
      "sender": sender,
      "recipient": recipient,
      "text": message
    });
    // fetchConversations(userId!);
  }

  void joinConversation({
    required String? conversationId,
    required String? sender,
    required String? recipient,
  }) {
    _socket.emit('join conversation', {
      "conversationId": conversationId,
      "sender": sender,
      "recipient": recipient,
    });
  }

  void fetchConversations(String userId) {
    _socket.emit('conversations', userId);
  }

  void fetchMessages(
      {String? conversationId,
      required String senderId,
      required String recipientId}) {
    _socket.emit('fetch messages', {
      "conversationId": conversationId,
      "senderId": senderId,
      "recipientId": recipientId
    });
  }

  update() {
    notifyListeners();
  }
}
