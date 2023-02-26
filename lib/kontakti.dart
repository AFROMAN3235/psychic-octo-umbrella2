import 'package:flutter/material.dart';

class Kontakti extends StatelessWidget {
  const Kontakti({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Контакты'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        itemCount: 30,
        itemBuilder: (context, index) {
          final url = 'https://picsum.photos/id/$index/100/100';
          return ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(url),
            ),
            title: Text('Horse'),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 15,
          );
        },
      ),
    );
  }
}