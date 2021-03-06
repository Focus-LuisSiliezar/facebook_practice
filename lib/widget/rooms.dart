import 'package:flutter/material.dart';
import 'package:flutter_fb_practice/config/palette.dart';
import 'package:flutter_fb_practice/models/user_model.dart';
import 'package:flutter_fb_practice/widget/profile_avatar.dart';
import 'package:flutter_fb_practice/widget/responsive.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUser;
  const Rooms({Key? key, required this.onlineUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: Container(
        height: 60.0,
        color: isDesktop ? Colors.transparent : Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUser.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUser[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print("Create\nRoom"),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Colors.blueAccent),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          // Icon(
          //   Icons.video_call,
          //   color: Colors.purple,
          //   size: 35.0,
          // ),
          const Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              'Create\nRoom',
              style: TextStyle(color: Palette.facebookBlue),
            ),
          )
        ],
      ),
      // style: Bor,
    );
  }
}
