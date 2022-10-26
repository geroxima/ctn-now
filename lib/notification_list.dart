import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:test/screens/notificationClear/clear_notification.dart';
import 'notification_details.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

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
      return Column(children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            child: Text(
              "Aquí puedes ver los últimos avisos",
              style: GoogleFonts.roboto(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
              height: 350,
              width: 350,
              child: Lottie.asset(
                "lib/anim/99955-empty-notifications.json",
              )),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Container(
              height: 40,
              child: Text(
                '¡Shh! nada que ver por aquí',
                style: GoogleFonts.roboto(
                  fontSize: 25,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )
      ]);
    }
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _messages.length,
          itemBuilder: (context, index) {
            RemoteMessage message = _messages[index];
            return Hero(
              tag: 'animation${message.data}',
              child: Card(
                color: Colors.grey.shade200,
                child: ListTile(
                  title: Text(
                    message.notification?.title ?? "N/D",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(5),
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 8.5),
                    child:
                        Icon(CupertinoIcons.bell_fill, color: Colors.black87),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 8.5),
                    child: Icon(CupertinoIcons.arrow_right,
                        size: 25, color: Colors.grey.shade600),
                  ),
                  onTap: () => Navigator.pushNamed(context, "/message",
                      arguments: MessageArguments(message, false)),
                ),
              ),
            );
          }),
    );
  }
}
