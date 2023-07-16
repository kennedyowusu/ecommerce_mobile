import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/providers/bottom_nav_index.dart';
import 'package:ecommerce_ui/views/favorite.dart';
import 'package:ecommerce_ui/views/home.dart';
import 'package:ecommerce_ui/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectLayout extends ConsumerWidget {
  ProjectLayout({super.key});

  final List<ConsumerWidget> screens = [
    const HomeView(),
    const FavoriteView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentIndex = ref.watch(currentIndexProvider);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => ref.read(currentIndexProvider.notifier).update(
                (state) => value,
              ),
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kSecondaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
              activeIcon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: '',
              activeIcon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
              activeIcon: Icon(Icons.person),
            ),
          ],
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
