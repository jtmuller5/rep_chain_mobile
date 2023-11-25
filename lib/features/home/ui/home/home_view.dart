import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rep_chain_mobile/app/router.dart';
import 'package:rep_chain_mobile/app/services.dart';
import 'package:rep_chain_mobile/features/feeds/ui/feeds/feeds_view.dart';
import 'package:rep_chain_mobile/features/home/ui/badge_list/badge_list_view.dart';
import 'package:rep_chain_mobile/features/home/ui/home/widgets/drawer.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    if (!(sharedPrefs.getBool('onboarded') ?? false)) {
      router.replace(const OnboardingRoute());
    }
    super.initState();
  }

  int index = 0;

  void setIndex(int val) {
    setState(() => index = val);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              router.push(const SettingsRoute());
            },
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      body: IndexedStack(
        index: index,
        children: const [
          BadgeListView(),
          FeedsView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          setIndex(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.badge_outlined), label: 'Badges'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Feeds'),
        ],
      ),
    );
  }
}
