import 'package:ecommerce_ui/constants/colors.dart';
import 'package:ecommerce_ui/views/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> userStoredData = storage.read("user");

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: deepBlue,
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/general/profile-image.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    userStoredData["name"].toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
            endIndent: 20,
            indent: 20,
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              GetStorage box = GetStorage();
              box.remove('token');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginView(),
                ),
              );
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
            endIndent: 20,
            indent: 20,
          ),
          // TODO: Add more items to the drawer
        ],
      ),
    );
  }
}
