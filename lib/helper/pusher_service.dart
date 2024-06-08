// // import 'package:pusher_client/pusher_client.dart';

// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

// class PusherService {
//   // late PusherClient pusher;
//   // late Channel channel;

//   // PusherService() {
//   //   PusherOptions options = PusherOptions(
//   //     cluster: "eu",
//   //     encrypted: true,
//   //   );

//   //   pusher = PusherClient(
//   //     "7200f059fc4173f84f3c",
//   //     options,
//   //     autoConnect: true,
//   //   );

//   //   pusher.connect();
//   // }

//   // void subscribeToChannel(String conversationId, Function(dynamic) onMessage) {
//   //   channel = pusher.subscribe('conversation-$conversationId');

//   //   channel.bind('new-message', (PusherEvent? event) {
//   //     if (event!.data != null) {
//   //       onMessage(event.data);
//   //     }
//   //   });
//   // }

//   // void unsubscribeFromChannel(String conversationId) {
//   //   pusher.unsubscribe('conversation-$conversationId');
//   // }
//   PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
//   fff() async {
//     try {
//       await pusher.init(
//         apiKey: "7200f059fc4173f84f3c",
//         cluster: "eu",
//         // onConnectionStateChange: onConnectionStateChange,
//         // onError: onError,
//         // onSubscriptionSucceeded: onSubscriptionSucceeded,
//         // onEvent: onEvent,
//         // onSubscriptionError: onSubscriptionError,
//         // onDecryptionFailure: onDecryptionFailure,
//         // onMemberAdded: onMemberAdded,
//         // onMemberRemoved: onMemberRemoved,
//         // authEndpoint: "<Your Authendpoint>",
//         // onAuthorizer: onAuthorizer
//       );
//       await pusher.subscribe(channelName: "my-channel");
//       await pusher.connect();
//     } catch (e) {
//       print("ERROR: $e");
//     }
//   }

//   void onEvent(PusherEvent event) {
//     print("onEvent: $event");
//   }
// }
