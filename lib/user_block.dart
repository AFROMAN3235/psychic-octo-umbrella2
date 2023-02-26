import 'package:flutter/material.dart';

class UserBlock extends StatelessWidget {
  final Color color;
  final String userName;
  final String avatarUrl;
  const UserBlock({
    Key? key,
    required this.color,
    required this.userName,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: MediaQuery.of(context).size.height * 0.07,
            foregroundImage: NetworkImage(avatarUrl),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  userName,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.mic_off,
                color: Colors.white,
                size: 16,
              )
            ],
          ),
        ],
      ),
    );
  }
}