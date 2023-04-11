import 'package:flutter/material.dart';
import 'package:one_note_clone/constants.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          radius: 22.0,
                          child: Text(
                            'VC',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Emerald Onyeka'),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              'EmeraldOnyeka@gmail.com',
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  MyListTile(listIcon: Icons.add, label: 'Add account'),
                  Divider(
                    color: Colors.white54,
                  ),
                  MyListTile(
                    listIcon: Icons.settings,
                    label: 'Settings',
                  ),
                  MyListTile(
                    listIcon: Icons.help,
                    label: 'Help and support',
                  ),
                  MyListTile(
                    listIcon: Icons.feedback,
                    label: 'Send feedback to Microsoft',
                  ),
                  Divider(
                    color: Colors.white54,
                  ),
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Color(0xffafa0c9),
                ),
                title: Text(
                  'Sign out of OneNote',
                  style: kPurpleTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  IconData listIcon;
  String label;

  MyListTile({required this.listIcon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(listIcon),
      title: Text(label),
    );
  }
}
