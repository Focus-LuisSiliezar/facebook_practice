import 'package:flutter/material.dart';
import 'package:flutter_fb_practice/models/user_model.dart';
import 'package:flutter_fb_practice/widget/user_card.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;
  const ContactsList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Contacts",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 8.0),
              Icon(
                Icons.more_horiz,
                color: Colors.grey.shade600,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 15),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(user: users[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
