import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  Widget buildAvatarAndName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg'),
        ),
        SizedBox(width: 10),
        Text(
          'Tên người dùng',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildIconColumn(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: Colors.blue),
        Text(text, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Column(
        children: [
          buildAvatarAndName(),
          GridView.count(
            crossAxisCount: 3,
            children: [
              buildIconColumn(Icons.book, 'Book a Trip'),
              buildIconColumn(Icons.group, 'My Trips'),
              buildIconColumn(Icons.favorite, 'Love'),
              buildIconColumn(Icons.settings, 'Setting'),
              buildIconColumn(Icons.receipt, 'Bills'),
              buildIconColumn(Icons.share, 'Share'),
            ],
          ),
        ],
      ),
    );
  }
}



