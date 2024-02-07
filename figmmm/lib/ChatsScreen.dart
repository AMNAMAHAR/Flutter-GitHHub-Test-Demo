// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   TextEditingController _messageController = TextEditingController();
//   List<ChatBubble> _messages = [];
//   final String _selectedContact = "Client"; // Initially selected contact
//   final String _recipient = "Participant 1"; // Recipient for two-way chat
//   final bool _isGroupChat = true; // Indicates whether it's a group chat or not
//
//   @override
//   void dispose() {
//     _messageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Chat with $_recipient',
//           style: TextStyle(fontSize: 16, color: Colors.blue[700]),
//         ),
//       ),
//       backgroundColor: Colors.grey[400],
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) => _messages[index],
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       hintText: 'Type a message...',
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     _sendMessage(_messageController.text);
//                     _messageController.clear();
//                   },
//                   child: Text('Send'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _sendMessage(String message) {
//     if (message.isNotEmpty) {
//       setState(() {
//         _messages.add(ChatBubble(
//           message: message,
//           isMe: true,
//           time: _getCurrentTime(),
//           onReply: _replyToMessage,
//         ));
//       });
//
//       // Simulate receiving a reply from the recipient after a short delay
//       _simulateReply(message, isGroupMessage: _isGroupChat);
//     }
//   }
//
//   String _getCurrentTime() {
//     DateTime now = DateTime.now();
//     return '${now.hour}:${now.minute}';
//   }
//
//   // Callback function to handle replies made in the chat screen
//   void _replyToMessage(String message) {
//     _launchWhatsApp(message);
//   }
//
//   void _launchWhatsApp(String message) async {
//     String url = "whatsapp://send?text=$message";
//     await canLaunch(url)
//         ? await launch(url)
//         : ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Could not launch WhatsApp'),
//       ),
//     );
//   }
//
//   void _simulateReply(String message, {required bool isGroupMessage}) {
//     Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         if (isGroupMessage) {
//           if (message.toLowerCase().contains("hello")) {
//             _messages.add(ChatBubble(
//               message: "Hi, there!",
//               isMe: false,
//               time: _getCurrentTime(),
//               onReply: _replyToMessage,
//             ));
//           } else {
//             _messages.add(ChatBubble(
//               message: "Received in the group: $message",
//               isMe: false,
//               time: _getCurrentTime(),
//               onReply: _replyToMessage,
//             ));
//           }
//         } else {
//           if (message.toLowerCase() == "aslamoalikum") {
//             _messages.add(ChatBubble(
//               message: "Walikum Salam",
//               isMe: false,
//               time: _getCurrentTime(),
//               onReply: _replyToMessage,
//             ));
//           } else if (message.toLowerCase() == "me") {
//             _messages.add(ChatBubble(
//               message: "Participant",
//               isMe: false,
//               time: _getCurrentTime(),
//               onReply: _replyToMessage,
//             ));
//             _messages.add(ChatBubble(
//               message: "images/img_22.png", // Add participant's image
//               isMe: false,
//               time: _getCurrentTime(),
//               onReply: _replyToMessage,
//             ));
//           } else if (message.toLowerCase() == "participant") {
//             _messages.add(ChatBubble(
//               message: "Me",
//               isMe: false,
//               time: _getCurrentTime(),
//               onReply: _replyToMessage,
//             ));
//             _messages.add(ChatBubble(
//               message: "images/img_23.png", // Add participant's image
//               isMe: false,
//               time: _getCurrentTime(),
//               onReply: _replyToMessage,
//             ));
//           } else {
//             _messages.add(ChatBubble(
//               message: "Response to: $message",
//               isMe: false,
//               time: _getCurrentTime(),
//               onReply: _replyToMessage,
//             ));
//           }
//         }
//       });
//     });
//   }
// }
//
// class ChatBubble extends StatelessWidget {
//   final dynamic message;
//   final bool isMe;
//   final String time;
//   final Function(String) onReply; // Callback function
//
//   const ChatBubble({
//     Key? key,
//     required this.message,
//     required this.isMe,
//     required this.time,
//     required this.onReply, // Add callback function parameter
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment:
//       isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//       children: [
//         Text(
//           "${isMe ? 'Me' : 'Participant'}:",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(vertical: 5),
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: isMe ? Colors.blue[200] : Colors.grey[200],
//             borderRadius: isMe
//                 ? BorderRadius.only(
//               topLeft: Radius.circular(15.0),
//               topRight: Radius.circular(15.0),
//               bottomLeft: Radius.circular(15.0),
//             )
//                 : BorderRadius.only(
//               topLeft: Radius.circular(15.0),
//               topRight: Radius.circular(15.0),
//               bottomRight: Radius.circular(15.0),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment:
//             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//             children: [
//               if (message is String && message.startsWith("http"))
//                 Image.network(
//                   message,
//                   width: 200,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               if (message is String && !message.startsWith("http"))
//                 Text(
//                   message,
//                   style: TextStyle(fontSize: 16),
//                 ),
//               if (message is File)
//                 Image.file(
//                   message,
//                   width: 200,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               if (message is String &&
//                   (message == "img_22.png" || message == "img_23.png"))
//                 Image.asset(
//                   message, // Assuming the images are in the assets folder
//                   width: 200,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 ),
//               SizedBox(height: 5),
//               Text(
//                 time,
//                 style: TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//               SizedBox(height: 5),
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       onReply(message.toString());
//                     },
//                     child: Text('Reply'),
//                   ),
//                   SizedBox(width: 10),
//                   IconButton(
//                     onPressed: () {
//                       _launchWhatsApp(context, message.toString());
//                     },
//                     icon: Icon(Icons.reply),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   void _launchWhatsApp(BuildContext context, String message) async {
//     String url = "whatsapp://send?text=$message";
//     await canLaunch(url)
//         ? await launch(url)
//         : ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Could not launch WhatsApp'),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: ChatScreen(),
//   ));
// }
