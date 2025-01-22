import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: <Color>[
                        Color.fromARGB(255, 79, 126, 255),
                        Color.fromARGB(255, 146, 192, 252)
                      ])),
                      child: Center(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/image1.jpg'),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "mustafa zaareer",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(width: 5,),
                              IconButton(onPressed: (){}, icon: Icon(Icons.search),),
                              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none_outlined),),
                              IconButton(onPressed: (){}, icon: Icon(Icons.settings),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  MenuItem(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Color.fromARGB(255, 255, 140, 0),
                      ),
                      title: "Today",
                      onClick: () {
                        selectItem(context, 0);
                      }),
                  MenuItem(
                      icon: Icon(
                        Icons.inbox,
                        color: Color.fromARGB(255, 255, 140, 0),
                      ),
                      title: "Inbox",
                      onClick: () {
                        selectItem(context, 0);
                      }),
                  MenuItem(
                      icon: Icon(
                        Icons.waving_hand_rounded,
                        color: Color.fromARGB(255, 211, 167, 86),
                      ),
                      title: "Welcome",
                      onClick: () {
                        selectItem(context, 0);
                      }),
                  MenuItem(
                      icon: Icon(Icons.business_center_rounded,
                          color: Color.fromARGB(255, 245, 98, 0)),
                      title: "Work",
                      onClick: () {
                        selectItem(context, 0);
                      }),
                  MenuItem(
                      icon: Icon(Icons.cottage_rounded,
                          color: Color.fromARGB(255, 245, 98, 0)),
                      title: "Personal",
                      onClick: () {
                        selectItem(context, 0);
                      }),
                  MenuItem(
                      icon: Icon(Icons.add_shopping_cart_sharp,
                          color: Color.fromARGB(255, 245, 98, 0)),
                      title: "Shopping",
                      onClick: () {
                        selectItem(context, 0);
                      }),
                  MenuItem(
                      icon: Icon(Icons.favorite,
                          color: Color.fromARGB(255, 245, 98, 0)),
                      title: "Wish List",
                      onClick: () {
                        selectItem(context, 0);
                      }),
                  MenuItem(
                      icon: Icon(Icons.cake_rounded,
                          color: Color.fromARGB(255, 245, 98, 0)),
                      title: "Birthday",
                      onClick: () {
                        selectItem(context, 0);
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          iconSize: 30,
                          onPressed: () {},
                          icon: Icon(Icons.add)),
                      Text(
                        "Add List",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Icon(
                    Icons.list_alt_sharp,
                    color: Color.fromARGB(255, 176, 176, 176),
                  )
                ],
              )
            ]));
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final Function onClick;
  final Icon icon;
  int? trailing;

  MenuItem(
      {super.key,
      required this.title,
      required this.onClick,
      required this.icon,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text("${this.title}",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
      onTap: () {
        onClick();
      },
      trailing: Text('${trailing}'),
    );
  }
}

selectItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
      break;
    case 1:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
      break;
    case 2:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
  }
}
