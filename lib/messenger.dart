// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MessenGer extends StatefulWidget {
  const MessenGer({super.key, this.args});
  final ScreenArgument? args;

  @override
  State<MessenGer> createState() => _MessenGerState();
}


class _MessenGerState extends State<MessenGer> {
  
  final List<UserHorizontal> listHorizontal = [
    UserHorizontal(avatar: "assets/images/picture-a.jpg", name: "Quang 1"),
    UserHorizontal(avatar: "assets/images/picture-b.jpg", name: "Quang 2"),
    UserHorizontal(avatar: "assets/images/picture-c.jpg", name: "Quang 3"),
    UserHorizontal(avatar: "assets/images/picture-d.jpg", name: "Quang 4"),
    UserHorizontal(avatar: "assets/images/picture-e.jpg", name: "Quang 5"),
    UserHorizontal(avatar: "assets/images/picture-f.jpg", name: "Quang 6"),
    UserHorizontal(avatar: "assets/images/picture-g.jpg", name: "Quang 7"),
    UserHorizontal(avatar: "assets/images/picture-h.jpg", name: "Quang 8"),
    UserHorizontal(avatar: "assets/images/picture-i.jpg", name: "Quang 9"),
    UserHorizontal(avatar: "assets/images/picture-j.jpg", name: "Quang 10"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Chào mừng",
                   style: TextStyle(
                    fontFamily: 'SVN-Avo',
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                   )
                  ),
                  const SizedBox(width: 4),
                  Text(widget.args?.Username ?? "null",
                    style: const TextStyle(
                    fontFamily: 'SVN-Avo',
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                   )
                  )
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listHorizontal.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.orange
                                ),
                              borderRadius: BorderRadius.circular(50)),
                              padding: const EdgeInsets.all(5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(listHorizontal[index].avatar, fit: BoxFit.cover,), 
                              ),
                          ),
                        const SizedBox(width: 10),
                         Text(listHorizontal[index].name,
                         style: const TextStyle(
                           fontFamily: 'SVN-Avo', 
                           fontSize: 14,
                          )
                         ),
                        ],
                      ),
                    );
                  }
                ),
              ),
              Expanded(
                child: ListView.builder(
                shrinkWrap: true,
                itemCount: listHorizontal.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                    child: Row(
                      children: [
                        SizedBox(           
                          height: 72,
                          width: 72,
                          child: ClipRRect(               
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              listHorizontal[index].avatar,
                                fit: BoxFit.cover,),
                          ),
                       ),
                       const SizedBox(width: 20),
                       Text(listHorizontal[index].name,
                       style: const TextStyle(
                         fontFamily: 'SVN-Avo', 
                         fontSize: 18,
                         fontWeight: FontWeight.w700)
                       ),
                      ],  
                    ),
                  );
                 },
                ),
              ),
            ]
          )
        )
      )
    );
  }
}

class ScreenArgument {
  final String Username;
  final String Password;

  ScreenArgument({required this.Username, required this.Password});
  
}

class UserHorizontal{
  final String name;
  final String avatar;

  UserHorizontal({required this.avatar, required this.name});
}