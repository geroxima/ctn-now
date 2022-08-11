import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:test/util/models.dart';

class MessageArguments {
  final RemoteMessage message;
  final bool openedApplication;
  MessageArguments(this.message, this.openedApplication);
}

class MessageView extends StatelessWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MessageArguments args =
        ModalRoute.of(context)!.settings.arguments! as MessageArguments;
    RemoteMessage message = args.message;
    RemoteNotification? notification = message.notification;

    return Scaffold(
      appBar: AppBar(
        title: appbar(message.data.toString()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              if (notification != null) ...[
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      img(notification.android!.imageUrl),
                      const Text("Notification Inf",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      viewData(
                        "Title",
                        notification.title,
                      ),
                      viewData(
                        "Body",
                        notification.body,
                      ),
                      viewData(
                        "Sent Time",
                        message.sentTime?.toString(),
                      ),
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

Widget viewData(String title, String? value) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(value ?? "N/A"),
        ),
      ],
    ),
  );
}

Widget img(String? value) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: Card(
      elevation: 4.0,
      child: Center(
        child: Image.network(
          value ??
              "https://cdn3.locable.com/uploads/resource/file/573989/Cats-at-Work.png",
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}

Widget appbar(String? value) {
  return Text(
    value ?? "N/A",
    style: const TextStyle(
      fontSize: 16,
    ),
  );
}
