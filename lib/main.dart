import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nigaaa/kontakti.dart';
import 'package:nigaaa/user_block.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool flagVideo = false;
  bool flagMic = false;

  List<Widget> list = const [
    Expanded(
      child: UserBlock(
        color: Colors.green,
        userName:
        'Я asidas dasjn adsjkn nadskjn dnj adskjn dasjnd askjnj ndsakjnd akjnasdnjasd knjknajsdj knsadnjk das',
        avatarUrl:
        'https://sun6-20.userapi.com/s/v1/ig2/kKS4r2JPN3nBCngI8-6OS3Z-1qsAkamSYb7qya1X0n8Nlf03hQIO9DrA8T2Vvfg4jHWvmajsqCpNHHv1NkwvDCo-.jpg?size=400x400&quality=95&crop=0,1,718,718&ava=1',
      ),
    ),
    SizedBox(
      height: 10,
    ),
    Expanded(
      child: UserBlock(
        color: Colors.brown,
        userName: 'Чачлык',
        avatarUrl:
        'https://sun6-20.userapi.com/s/v1/if2/TUYMwx9oU5w_3XPNLL4k69KxOLwCc_tMOBkVKxPhzL_JV6MFM5pW6xBrQWv987Z9tT6nMgldzvgEyIqJoXK0Vq43.jpg?size=211x211&quality=96&crop=1028,287,211,211&ava=1',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => launchUrl(Uri.parse('sms:')),
              child: const Icon(
                Icons.sms_outlined,
                size: 35,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const Kontakti(),
                  ),
                );
              },
              child: const Icon(
                Icons.people_alt_outlined,
                size: 35,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  list = list.reversed.toList();
                });
              },
              child: const Icon(
                Icons.grid_view_outlined,
                size: 35,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: Column(
                children: list,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // height: 75,
                    // width: 75,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: flagVideo ? Colors.white : Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(
                        flagVideo ? Icons.videocam_off : Icons.videocam,
                        color: flagVideo ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          flagVideo = !flagVideo;
                        });
                      },
                    ),
                  ),
                  Container(
                    // height: 75,
                    // width: 75,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: flagMic ? Colors.white : Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(
                        flagMic ? Icons.mic_off : Icons.mic,
                        color: flagMic ? Colors.black : Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          flagMic = !flagMic;
                        });
                      },
                    ),
                  ),
                  Container(
                    // height: 75,
                    // width: 75,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(
                        Icons.waving_hand,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // Return an AlertDialog widget
                            return AlertDialog(
                              title: Text('Alert'),
                              content: Text('Привет'),
                              actions: <Widget>[
                                // Add a FlatButton widget to dismiss the dialog
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    // height: 75,
                    // width: 75,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      iconSize: 30,
                      icon: Icon(
                        Icons.phone_disabled_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
