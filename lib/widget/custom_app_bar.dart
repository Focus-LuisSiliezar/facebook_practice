import 'package:flutter/material.dart';
import 'package:flutter_fb_practice/config/palette.dart';
import 'package:flutter_fb_practice/models/user_model.dart';
import 'package:flutter_fb_practice/widget/circle_button.dart';
import 'package:flutter_fb_practice/widget/custom_tab_bar.dart';
import 'package:flutter_fb_practice/widget/user_card.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final Function(int) onTap;
  final int selectedIndex;

  const CustomAppBar({
    super.key,
    required this.currentUser,
    required this.icons,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'facebook',
                style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              width: 600.0,
              child: CustomTabBar(
                onTap: onTap,
                icons: icons,
                selectedIndex: selectedIndex,
                isBottomIndicator: true,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UserCard(user: currentUser),
                  const SizedBox(width: 12.0),
                  CircleButton(
                    icon: Icons.search,
                    iconSize: 30.0,
                    onPressed: () => print("search"),
                  ),
                  CircleButton(
                    icon: Icons.message_outlined,
                    iconSize: 30.0,
                    onPressed: () => print("messenger"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
