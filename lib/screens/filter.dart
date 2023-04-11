import 'package:flutter/material.dart';
import 'package:one_note_clone/constants.dart';

class FilterModalView extends StatefulWidget {
  @override
  State<FilterModalView> createState() => _FilterModalViewState();
}

class _FilterModalViewState extends State<FilterModalView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff000000),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Color(0xff949494),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'sort & filter',
                    style: TextStyle(
                      color: Color(0xffeeeeee),
                    ),
                  ),
                  Text(
                    'clear',
                    style: kPurpleTextStyle,
                  ),
                ],
              ),
              Divider(),
              Text(
                'Filter By',
                style: kNormalTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'NOTE-TYPE',
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  buildContainer('All'),
                  buildContainer('OneNote Pages'),
                  buildContainer('Sticky notes'),
                ],
              ),
              Divider(),
              Text(
                'Sort By',
                style: kNormalTextStyle,
              ),
              ListTile(
                title: Text(
                  'Modified Date',
                  style: kPurpleTextStyle,
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff443168),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_downward,
                    ),
                  ),
                ),
              ),
              Divider(),
              Text(
                'Created Date',
                style: kNormalTextStyle,
              ),
              Divider(),
              Text(
                'Alphabetical',
                style: kNormalTextStyle,
              ),
              Divider(
                height: 25.0,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide(color: Color(0xffafa0c9), width: 1),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Color(0xffafa0c9),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(cardLabel) {
    return Container(
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: Color(0xff303030),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          cardLabel,
          style: kNormalTextStyle,
        ),
      ),
    );
  }
}
