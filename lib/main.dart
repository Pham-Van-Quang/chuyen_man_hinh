import 'package:chuyen_man_hinh/details.dart';
import 'package:flutter/material.dart';

import 'messenger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case "/":
           return MaterialPageRoute(
            builder: (context) => const LogIn(
              title: "On Generated Route",
            ),
            settings: settings,
          );
          case "/messenger":
           return MaterialPageRoute(
            builder: (context) => MessenGer(
              args: settings.arguments as ScreenArgument?,
            ),
            settings: settings,
          );
          case "/details":
          return MaterialPageRoute(
            builder: (context) => const Details(),
            settings: settings,
          );
        }
        return null;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key, required String title});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 315, 50,0),
        child: Column(
          children: [
            SizedBox(
              child: TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: const TextStyle(fontFamily: 'SVN-Avo', fontSize: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    )
                  ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 1.0,
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: TextField(
                controller: passWordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(fontFamily: 'SVN-Avo', fontSize: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    )
                  ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    // ignore: prefer_const_constructors
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1.0,
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(8),
                 ),
               ),
                onPressed: () {
                  if (userNameController.text == "Quang" &&
                     passWordController.text == "quangdeptrai") {
                      Navigator.pushNamed(
                    context, 
                    "/messenger",
                    arguments: ScreenArgument(
                      Username: userNameController.text,
                      Password: passWordController.text,
                    )
                  );
                 } else {
                  showDialog(
                   context: context,
                     builder: (context) => AlertDialog(
                       title: const Text("Lỗi"),
                       content: const Text("Tên người dùng hoặc mật khẩu không đúng."),
                         actions: [
                          TextButton(
                          onPressed: () {
                        Navigator.pop(context);
              },
              child: const Text("Đóng"),
            ),
          ],
        ),
      );
    }
                }, 
                child: const Text(
                  "Đăng nhập",
                  style: TextStyle(fontFamily: 'SVN-Avo', fontSize: 16, fontWeight: FontWeight.w700),
                  ),       
              ),
            )
          ],
        ),
      ),
    );
  }
}

