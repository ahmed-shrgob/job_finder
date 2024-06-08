class Conversation {
  final String id;
  final List participants;
  final Map? lastMessage;
  final String? senderNeme;
  final String? senderImage;
  final String? otherParticipantID;

  Conversation({
    required this.id,
    required this.participants,
    required this.lastMessage,
    this.senderNeme,
    this.senderImage,
    this.otherParticipantID,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['_id'],
      participants: json['participants'],
      lastMessage: json['lastMessage'],
      senderNeme: json['senderNeme'],
      senderImage: json['senderImage'],
      otherParticipantID: json['otherParticipantID'],
    );
  }
}
