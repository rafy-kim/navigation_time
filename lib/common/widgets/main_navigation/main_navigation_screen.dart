import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/features/activity/views/activity_screen.dart';
import 'package:thread_clone/features/posts/views/post_timeline_screen.dart';
import 'package:thread_clone/features/posts/views/widgets/new_post.dart';
import 'package:thread_clone/features/search/views/search_screen.dart';
import 'package:thread_clone/features/users/views/profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";
  final String tab;
  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "",
    "search",
    "post",
    "activity",
    "profile",
  ];

  late int _selectedIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) async {
    if (index == 2) {
      await showModalBottomSheet(
        context: context,
        // showDragHandle: true,
        isScrollControlled: true,
        // barrierColor: Colors.red,
        // backgroundColor: Colors.transparent,
        builder: (context) => const NewPost(),
      );
    } else {
      context.go("/${_tabs[index]}");
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final isDark = isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor:
      //     _selectedIndex == 0 || isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            // child: const VideoTimelineScreen(),
            child: const PostTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            // child: const DiscoverScreen(),
            child: const SearchScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            // child: const InboxScreen(),
            child: const ActivityScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const ProfileScreen(
              username: "Rafy",
              tab: "",
            ),
            // child: const UserProfileScreen(
            //   username: "라피",
            //   tab: "",
            // ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade400,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "Home",
            // backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            label: "Search",
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.penToSquare),
            label: "Post",
            // backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart),
            label: "Like",
            // backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: "User",
            // backgroundColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
