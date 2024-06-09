import 'package:intl/intl.dart';

String convertTimeforMessage(DateTime timestamp) {
  Duration diff = DateTime.now().difference(timestamp);
return DateFormat('hh:mm a').format(timestamp.add(Duration(hours: 2)));
  // if (diff.inSeconds < 60) {
  //   return 'قبل ${diff.inSeconds} ثواني';
  // } else if (diff.inMinutes < 60) {
  //   return 'قبل ${diff.inMinutes} دقائق';
  // } else if (diff.inHours < 24) {
  //   return 'قبل ${diff.inHours} ساعات';
  // } else if (diff.inDays < 7) {
  //   return 'قبل ${diff.inDays} أيام';
  // } else {
  //   return DateFormat('yyyy/MM/dd').format(timestamp);
  // }
}
String convertTimeforConversation(DateTime timestamp) {
  Duration diff = DateTime.now().difference(timestamp);

  if (diff.inSeconds < 60) {
    return "الآن";
  } else if (diff.inMinutes < 60) {
    return 'قبل ${diff.inMinutes} دقائق';
  } else if (diff.inHours < 24) {
    return DateFormat('hh:mm a').format(timestamp);
  } else if (diff.inDays <1) {
    return 'امس';
  } else {
    return DateFormat('yy/MM/dd').format(timestamp);
  }
}
