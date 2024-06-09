import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_finder/chat_pro.dart';
import 'package:job_finder/constants/cons_user_data.dart';
import 'package:job_finder/constants/cons_size.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:job_finder/core/view%20model/LikeVm.dart';
import 'package:job_finder/core/view%20model/blogsVm.dart';
import 'package:job_finder/core/view%20model/filterVM.dart';
import 'package:job_finder/core/view%20model/followVM.dart';
import 'package:job_finder/core/view%20model/jobVM.dart';
import 'package:job_finder/core/view%20model/request_VM.dart';
import 'package:job_finder/core/view%20model/userVM.dart';
import 'package:job_finder/core/view/screens/loginScreen.dart';
import 'package:job_finder/core/view/screens/main_screen.dart';
import 'package:job_finder/helper/company_dropdown_providr.dart';
import 'package:job_finder/helper/imege_provid.dart';
import 'package:job_finder/helper/job_dropdown_providr.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'core/view model/cv_VM.dart';

void main() async {
  await GetStorage.init();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeAppSize(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider<ImageProv>(create: (_) => ImageProv()),
        ChangeNotifierProvider<BlogVm>(create: (_) => BlogVm()),
        ChangeNotifierProvider<LikeVm>(create: (_) => LikeVm()),
        ChangeNotifierProvider<CVVM>(
          create: (_) => CVVM(),
        ),
        ChangeNotifierProvider<UserVM>(
          create: (_) => UserVM(),
        ),
        ChangeNotifierProvider<FilterVM>(
          create: (_) => FilterVM(),
        ),
        ChangeNotifierProvider<JobVM>(
          create: (_) => JobVM(),
        ),
        ChangeNotifierProvider<RequstVM>(
          create: (_) => RequstVM(),
        ),
        ChangeNotifierProvider<FollowVM>(
          create: (_) => FollowVM(),
        ),
        ChangeNotifierProvider<CompanyDropdownValueProvider>(
          create: (_) => CompanyDropdownValueProvider(),
        ),
        ChangeNotifierProvider<JobDropdownValueProvider>(
          create: (_) => JobDropdownValueProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: MainScreen(),
        // home: ChatScreen(),
        home: userId == null ? LoginScreen() : MainScreen(),
        supportedLocales: [
          const Locale('en'),
          const Locale('ar'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('ar'),
      ),
    );
  }
}

// class ChatScreen extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final chatProviderr = Provider.of<ChatProvider>(context);

//     // Fetch conversations when the screen loads
//     // chatProviderr.fetchConversations("6622f88892539510d5395b57");
//     print(chatProviderr.conversations);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Consumer<ChatProvider>(
//               builder: (context, chatProvider, child) {
//                 // chatProviderr.fetchConversations("");
//                 // print(chatProvider.conversations);
//                 return Column(
//                   children: [
//                      ListView.builder(
//                        shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//               itemCount: chatProvider.conversations.length,
//               itemBuilder: (context, index) {
//                 // final conversation = chatProvider.conversations[index];
//                 return ListTile(
//                   title: Text("conversation['recipientName'][1]"),
//                   subtitle: Text(chatProvider.conversations[index]['text']),
//                   // leading: CircleAvatar(
//                   //   backgroundImage: NetworkImage(conversation['recipientImageUrl']),
//                   // ),
//                 );
//               },
//             ),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: chatProvider.messages.length,
//                       itemBuilder: (context, index) {
//                         final message = chatProvider.messages[index];
//                         return ListTile(
//                           title: Text(message['text']!),
//                           subtitle: Text(message['sender']!),
//                         );
//                       },
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your message',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     if (_controller.text.isNotEmpty) {
//                       Provider.of<ChatProvider>(context, listen: false)
//                           .sendMessage(_controller.text);
//                       // Provider.of<ChatProvider>(context, listen: false)
//                       //     .fetchConversations(_controller.text);
//                           chatProviderr.fetchConversations("6622f88892539510d5395b57");
//                       _controller.clear();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }