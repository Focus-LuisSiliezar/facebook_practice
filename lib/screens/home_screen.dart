import 'package:flutter/material.dart';
import 'package:flutter_fb_practice/config/palette.dart';
import 'package:flutter_fb_practice/data/data.dart';
import 'package:flutter_fb_practice/widget/circle_button.dart';
import 'package:flutter_fb_practice/widget/create_post_container.dart';
import 'package:flutter_fb_practice/widget/rooms.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                  iconSize: 30,
                  icon: Icons.search,
                  onPressed: () => print("Search"),
                  key: key),
              CircleButton(
                  iconSize: 24,
                  icon: Icons.message,
                  onPressed: () {},
                  key: key),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUser: onlineUsers),
            ),
          )
        ],
      ),
    );
  }
}
