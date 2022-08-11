//ignore_for_file: require_trailing_commas

import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'notification_details.dart';

class MessageList extends StatefulWidget {
  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<RemoteMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _messages = [..._messages, message];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_messages.isEmpty) {
      return const Text("No messages received");
    }
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          RemoteMessage message = _messages[index];
          return ListTile(
            title: Text(
              message.notification?.title ?? "N/D",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              Icons.notifications_active,
              color: Colors.red,
            ),
            onTap: () => Navigator.pushNamed(context, "/message",
                arguments: MessageArguments(message, false)),
          );
        });
  }
}
