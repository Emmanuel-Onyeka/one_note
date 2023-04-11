import 'package:flutter/material.dart';
import 'package:one_note_clone/screens/grid.dart';
import 'package:one_note_clone/screens/user_info.dart';
import '../widgets/text_card.dart';
import '../widgets/containerView.dart';
import 'notebook_view.dart';
import 'filter.dart';
import './search.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(initialPage: 0);

  // Navigates to the home or Notebook page based on its value
  bool isHome = true;

  bool isList = true;

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color bookControllerColor = Theme
        .of(context)
        .primaryColor;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'OneNote',
        ),
        leading: Container(
          margin: EdgeInsets.only(
            left: 10.0,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserInfo()));
            },
            child: CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.blue,
              child: Text(
                'AE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ),
        leadingWidth: 45.0,
        actions: [
          IconButton(
            padding: EdgeInsets.only(
              right: 10.0,
            ),
            onPressed: () {
              //Todo: Navigate to search screen
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
            },
            icon: Icon(
              Icons.search,
              size: 35.0,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Color(0xff1e1e1d),
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff000000),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    margin: EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isHome = true;
                              controller.animateToPage(
                                0,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeOut,
                              );
                            });
                          },
                          child: BuildText(
                            label: 'Home',
                            colour: isHome ? bookControllerColor : Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isHome = false;
                              controller.animateToPage(
                                1,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                          child: BuildText(
                            label: 'Notebooks',
                            colour:
                            !isHome ? bookControllerColor : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => FilterModalView());
                        },
                        icon: Icon(
                          Icons.tune,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isList = !isList;
                          });
                        },
                        icon: Icon(
                          Icons.dashboard,
                        ),
                      ),
                      //Todo: remove sized box
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: PageView(
              //TODO: set the logic for the scroll behaviour(Try using a more complex if statement)
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  if (index == 0) {
                    isHome = true;
                  } else {
                    isHome = false;
                  }
                });
              },
              children: [
                //container for Home

                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),

                  //Using ternary to switch between ListView and GridView

                  child: isList
                      ? ListView(
                    children: [
                      ContainerView(),
                      ContainerView(),
                      ContainerView(),
                      ContainerView(),
                    ],
                  )
                      : MyGridBuilder(),
                ),
                //Container for the Notebook page

                Container(
                  child: ListView(
                    children: [
                      NoteBook(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(
                      15.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text('Page'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.brush,
                          ),
                          Icon(Icons.photo_camera),
                          Icon(Icons.mic),
                          Icon(Icons.more_vert),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
