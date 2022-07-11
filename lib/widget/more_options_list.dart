import 'package:flutter/material.dart';
import 'package:flutter_fb_practice/config/palette.dart';
import 'package:flutter_fb_practice/models/user_model.dart';
import 'package:flutter_fb_practice/widget/user_card.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [Icons.shield_outlined, Colors.deepPurple, "COVID-19 Info Center"],
    [Icons.supervisor_account, Colors.cyan, "Friends"],
    [Icons.message, Palette.facebookBlue, "Messenger"],
    [Icons.flag, Colors.orange, "Pages"],
    [Icons.store, Palette.facebookBlue, "Marketplace"],
    [Icons.ondemand_video, Palette.facebookBlue, "Watch"],
    [Icons.calendar_month_outlined, Colors.orange, "Events"],
  ];
  final User currentUser;

  const MoreOptionsList({super.key, required this.currentUser});
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        itemCount: 1 + _moreOptionsList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(
                user: currentUser,
              ),
            );
          }
          final List option = _moreOptionsList[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _Option(icon: option[0], color: option[1], label: option[2]),
          );
        },
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const _Option(
      {super.key,
      required this.icon,
      required this.color,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(label),
      child: Row(
        children: [
          Icon(
            icon,
            size: 38.0,
            color: color,
          ),
          const SizedBox(width: 6.0),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
