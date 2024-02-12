import 'package:flutter/material.dart';
import 'package:flutter_live_audio_room_zego_cloud/live_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final roomIdController = TextEditingController();
  bool isHost = false;

  @override
  void dispose() {
    usernameController.dispose();
    roomIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Join Live Audio Room',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/live.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  'Podcast With Friends',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: roomIdController,
                decoration: const InputDecoration(labelText: 'RoomID'),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Text('Host ?'),
                  const SizedBox(
                    width: 4,
                  ),
                  Switch(
                      value: isHost,
                      onChanged: (val) {
                        setState(() {
                          isHost = val;
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LivePage(
                        roomID: roomIdController.text,
                        isHost: isHost,
                        userName: usernameController.text,
                        userId:
                            usernameController.text.replaceAll(' ', '').trim());
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade300,
                  foregroundColor: Colors.green.shade300,
                  fixedSize: const Size(400, 50),
                ),
                child: const Text(
                  'Join Room',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
