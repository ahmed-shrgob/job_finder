// import 'package:dio/dio.dart';

// class ChatService {
//   final Dio _dio = Dio();

//   Future<List<dynamic>> getMessages() async {
//     try {
//       final response = await _dio.get('http://192.168.40.106:8000/pusherChatRoute/messages/111');
//       return response.data;
//     } catch (e) {
//       throw Exception('Failed to load messages');
//     }
//   }

//   Future<void> sendMessage(String text, String sender, String conversationId) async {
//     try {
//       await _dio.post('http://192.168.40.106:8000/pusherChatRoute/messages', data: {
//         'text': text,
//         'sender': sender,
//         'conversation_id': conversationId,
//       });
//     } catch (e) {
//       throw Exception('Failed to send message');
//     }
//   }
// }
