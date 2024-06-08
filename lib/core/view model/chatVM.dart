// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class ChatProvider with ChangeNotifier {
//   late IO.Socket _socket;

//   ChatProvider() {
//     _socket = IO.io('http://192.168.0.7:8000', <String, dynamic>{
//       'transports': ['websocket'],
//     });
// // 
//     _socket.on('connect', (_) {
//       print('connected to chat server');
//     });

//     _socket.on('disconnect', (_) {
//       print('disconnected from chat server');
//     });

//     _socket.on('chat message', (data) {
//       print('new message: $data');
//       // Handle new messages
//     });

//     _socket.on('conversations', (data) {
//       print('conversations: $data');
//       // Handle conversations
//     });

//     _socket.on('messages', (data) {
//       print('messages: $data');
//       // Handle messages
//     });
//   }

//   IO.Socket get socket => _socket;
// }