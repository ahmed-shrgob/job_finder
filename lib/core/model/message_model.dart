
class Message {
  final String? id;
  final String? conversationId;
  final String? text;
  final String? createdAt;
  final String? sender;
  final String? recipient;

  Message( 
      { this.id,
       this.text,
       this.createdAt,
       this.sender,
       this.recipient,
      this.conversationId,
      });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'],
      conversationId: json['conversationId'],
      text: json['text'],
      createdAt: json['createdAt'],
      sender: json['sender'],
      recipient: json['recipient'],
    );
  }
}
