import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/util/calendar_sf.dart';
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
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black, size: 30),
        title: Text(
          'Detalles de la notificación',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: Hero(
        tag: 'animation${message.data}',
        child: SingleChildScrollView(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            notification.title.toString(),
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey.shade500,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              Text(
                                message.sentTime!.day.toString(),
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const Text(
                                " de ",
                              ),
                              Text(message.sentTime!.month.toString()),
                              const Text(" del "),
                              Text(message.sentTime!.year.toString()),
                              const Text(", a las "),
                              Text(
                                message.sentTime!.hour.toString(),
                              ),
                              const Text(":"),
                              Text(message.sentTime!.minute.toString()),
                              const Text(" hs."),
                            ],
                          ),
                        ),
                        viewData(
                          "",
                          notification.body.toString(),
                        ),
                        img(notification.android!.imageUrl),
                      ],
                    ),
                  ),
                ]
              ],
            ),
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
          style: GoogleFonts.roboto(
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
    padding: const EdgeInsets.all(5),
    child: InteractiveViewer(
      child: Card(
        elevation: 1,
        child: Center(
          child: Image.network(
            value ??
                "https://upload.wikimedia.org/wikipedia/commons/8/89/HD_transparent_picture.png",
            height: 200,
            width: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );
}

Widget appbar(String? value) {
  return Text(
    value ?? "N/A",
    style: GoogleFonts.roboto(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
  );
}
