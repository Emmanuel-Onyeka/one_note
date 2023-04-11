import 'package:flutter/material.dart';
import 'package:one_note_clone/constants.dart';

class ContainerView extends StatefulWidget {
  const ContainerView({Key? key}) : super(key: key);

  @override
  State<ContainerView> createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'my Notes',
                  style: kSmallTextStyle,
                ),
                SizedBox(width: 3.0),
                Icon(
                  Icons.keyboard_double_arrow_right,
                  size: 9.0,
                ),
                SizedBox(width: 3.0),
                Text(
                  'category',
                  style: kSmallTextStyle,
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Text('title'),
            SizedBox(height: 5.0),
            Text('body'),
            SizedBox(height: 7.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 20.0,
                      width: 15.0,
                      color: Color(0xffbfaae3),
                      child: Icon(
                        Icons.subject,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        size: 12.0,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Notebook page',
                      style: kSmallTextStyle,
                    ),
                  ],
                ),
                Text('02:26'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
