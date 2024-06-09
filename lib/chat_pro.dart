import 'package:flutter/foundation.dart';
import 'package:job_finder/constants/cons_API.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/core/model/conversation_model.dart';
import 'package:job_finder/core/model/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'dart:async';

class ChatProvider with ChangeNotifier {
  final _messageController = StreamController<List<Message>>.broadcast();
  final _conversationController = StreamController<List<Conversation>>.broadcast();

  Stream<List<Message>> get messageStream => _messageController.stream;
  Stream<List<Conversation>> get conversationStream => _conversationController.stream;

  List<Message> _messages = [];
  List<Conversation> _conversations = [];

  ChatProvider() {
    initSocket();
    joinConversation();
  }

  late IO.Socket _socket;

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
    _socket.onDisconnect((_) => print("Connection disconnected"));
    _socket.onConnectError((err) => print("Connection error: $err"));
    _socket.onError((err) => print("Error: $err"));

    _socket.on('chat message', (data) {
      print("Received chat message: $data");
      _messages.add(Message.fromJson(data));
      _messageController.add(_messages);
        fetchConversations(userId!);      
      _socket.on('message sent', (_) {
      });
      notifyListeners();
    });

    _socket.on('conversations', (data) {
      print("Received conversations: $data");
      _conversations = (data as List).map((e) => Conversation.fromJson(e)).toList();
      _conversationController.add(_conversations);
      notifyListeners();
    });

    _socket.on('fetch messages', (data) {
      print("Received fetch messages: $data");
      _messages=[];
      _messages = (data as List).map((e) => Message.fromJson(e)).toList();
      _messageController.add(_messages);
    });

    _socket.on('disconnect', (_) {
      print('Disconnected from websocket');
    });
  }

  void sendMessage({
    required String message,
    required String? conversationId,
    required String? sender,
    required String? recipient,
  }) {
    _socket.emit('chat message', {
      "conversationId": conversationId,
      "sender": sender,
      "recipient": recipient,
      "text": message
    });
  }

  void joinConversation() {
    _socket.emit('join all conversations', userId);
  }

  void fetchConversations(String userId) {
    _socket.emit('conversations', userId);
  }

  void fetchMessages({
    String? conversationId,
    required String senderId,
    required String recipientId,
  }) {
    _socket.emit('fetch messages', {
      "conversationId": conversationId,
      "senderId": senderId,
      "recipientId": recipientId
    });
  }

  void dispose() {
    _messageController.close();
    // _conversationController.close();
    _socket.dispose();
    super.dispose();
  }
}
