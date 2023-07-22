import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/models/products_model.dart';
import 'package:ecommerce_ui/models/user_model.dart';
import 'package:ecommerce_ui/views/authentication/login.dart';
import 'package:ecommerce_ui/widgets/appbar.dart';
import 'package:ecommerce_ui/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/cart_items_controller.dart';

class ProfileView extends ConsumerWidget {
  ProfileView({super.key});

  final GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel user = UserModel.fromJson(storage.read('user'));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(title: 'Profile'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: kPrimaryColor,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQueries.getHeight(context) * 0.05,
                  ),
                  const CircleAvatar(
                    radius: 65.0,
                    backgroundImage:
                        AssetImage('assets/general/profile-image.png'),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: Card(
                  margin: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                  child: SizedBox(
                    width: 300,
                    height: MediaQueries.getHeight(context) * 0.35,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.settings_outlined,
                                color: kSecondaryColor,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Settings",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.circle_notifications_outlined,
                                color: kSecondaryColor,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Notifications",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.history,
                                color: kSecondaryColor,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "History",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.logout_outlined,
                                color: kSecondaryColor,
                                size: 35,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                onPressed: () async {
                                  GetStorage().remove('token');
                                  GetStorage().remove('userId');
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginView(),
                                      ),
                                      (route) => false);
                                },
                                child: const Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
