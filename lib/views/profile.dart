import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/itembag_controller.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemBag = ref.watch(itemBagProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60.0),
        child: CustomAppBar(itemBag: itemBag, title: 'Profile'),
      ),
      drawer: const Drawer(),
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
                  const Text(
                    'Kennedy Owusu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Mobile & Frontend Developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
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
                                onPressed: () async {},
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
