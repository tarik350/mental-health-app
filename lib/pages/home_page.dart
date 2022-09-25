import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/emotion_faces.dart';
import 'package:mentalhealthapp/utils/exercise_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _widthAnimation;
  late Animation<Size> sizeAnimtion;
  Color badly = Colors.blue.shade600;
  Color fine = Colors.blue.shade600;
  Color well = Colors.blue.shade600;
  Color excellent = Colors.blue.shade600;

  late Animation<Color> colorAnimation =
      TweenSequence<Color>(<TweenSequenceItem<Color>>[
    TweenSequenceItem<Color>(
        tween: Tween<Color>(begin: Colors.red, end: Colors.yellow), weight: 50),
    TweenSequenceItem<Color>(
        tween: Tween<Color>(begin: Colors.red, end: Colors.yellow), weight: 50)
  ]).animate(_controller);
  String emoji = '😀';
  double elevation = 0;
  BorderSide _borderSide = BorderSide(color: Colors.black, width: 0);
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    // colorAnimation = TweenSequence<Color>(<TweenSequenceItem<Color>>[
    //   TweenSequenceItem<Color>(
    //       tween: Tween<Color>(begin: Colors.red, end: Colors.yellow.shade100),
    //       weight: 50),
    //   TweenSequenceItem<Color>(
    //       tween: Tween<Color>(begin: Colors.red, end: Colors.yellow.shade100),
    //       weight: 50)
    // ]).animate(_controller);
    sizeAnimtion = Tween<Size>(begin: Size(0, 0), end: Size(250, 250))
        .animate(_controller);
    _widthAnimation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    _controller.forward();
  }

  GestureDetector widgetMaker() {
    return GestureDetector(
      onTap: (() {
        setState(() {
          elevation = 20;
        });
      }),
      child: Card(
        margin: EdgeInsets.all(8),
        borderOnForeground: false,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            side: _borderSide, borderRadius: BorderRadius.circular(20)),
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.orange.shade500,
                  borderRadius: BorderRadius.circular(30)),
              child: Icon(
                Icons.heart_broken,
                color: Colors.white,
              ),
            )
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            iconSize: 30,
            elevation: 10,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: 'message'),
            ]),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(children: [
            Padding(
                //padding to the entire app
                padding: const EdgeInsets.all(25),
                //the line at the top of the app which include a text and a notification icon
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //text that say hi, jared

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hi, Tarik',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text('23 jan 2023',
                                style: TextStyle(color: Colors.blue[200])),
                          ],
                        ),

                        //the notification icon
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[600],
                              borderRadius: BorderRadius.circular(20)),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //the search bar

                    Form(
                      key: formkey,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'Search',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.blue.shade600,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'can\'t search empty field';
                          } else
                            return null;
                        },
                        onFieldSubmitted: ((value) {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                          }
                        }),
                        onSaved: (newValue) {
                          print(newValue);
                        },
                      ),
                    ),

                    // Container(
                    //   height: 70,
                    //   decoration: BoxDecoration(
                    //       color: Colors.blue.shade600,
                    //       borderRadius: BorderRadius.circular(20)),
                    //   child: Padding(
                    //       padding: const EdgeInsets.all(12),
                    //       child: Row(children: const <Widget>[
                    //         Icon(
                    //           Icons.search,
                    //           size: 40,
                    //           color: Colors.white,
                    //         ),
                    //         SizedBox(
                    //           width: 5,
                    //         ),
                    //         Text('Search',
                    //             style: TextStyle(
                    //                 color: Colors.white, fontSize: 20))
                    //       ])),
                    // ),
                    //the text just bellow the search bar
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('How do you feel?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20)),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  badly = Colors.red.shade600;
                                  fine = Colors.blue.shade600;
                                  well = Colors.blue.shade600;
                                  excellent = Colors.blue.shade600;
                                });
                              },
                              child: Emotion(
                                emotion: '😔',
                                containerColor: badly,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'badly',
                              style: textStyle,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    badly = Colors.blue.shade600;
                                    fine = Colors.red.shade600;
                                    well = Colors.blue.shade600;
                                    excellent = Colors.blue.shade600;
                                  });
                                },
                                child: Emotion(
                                  emotion: '😊',
                                  containerColor: fine,
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Fine',
                              style: textStyle,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  badly = Colors.blue.shade600;
                                  fine = Colors.blue.shade600;
                                  well = Colors.red.shade600;
                                  excellent = Colors.blue.shade600;
                                });
                              },
                              child: Emotion(
                                emotion: '😀',
                                containerColor: well,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text('Well', style: textStyle)
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  badly = Colors.blue.shade600;
                                  fine = Colors.blue.shade600;
                                  well = Colors.blue.shade600;
                                  excellent = Colors.red.shade600;
                                });
                              },
                              child: Emotion(
                                emotion: '😁',
                                containerColor: excellent,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text('Excellent', style: textStyle)
                          ],
                        ),
                      ],
                    )
                  ],
                )),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                child: Container(
                    color: Colors.grey.shade200,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),

                        Center(
                            child: Container(
                          height: 10,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(20)),
                        )),

                        //the exercise row

                        Padding(
                          padding: EdgeInsets.all(25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Exersises',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.more_horiz,
                                size: 35,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //list view of exercises
                        Expanded(
                          child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                ExerciseTile(
                                  title: 'Speaking skill',
                                  subtitle: '16 Exercise',
                                  leadingIcon: Icons.favorite,
                                  iconColor: Colors.orange,
                                ),
                                ExerciseTile(
                                  title: 'Reading spead',
                                  subtitle: '13 Exercise',
                                  leadingIcon: Icons.person,
                                  iconColor: Colors.blue,
                                ),
                                ExerciseTile(
                                  title: 'Writing skill',
                                  subtitle: '14 Exercise',
                                  leadingIcon: Icons.person,
                                  iconColor: Colors.red.shade700,
                                )
                              ]),
                        ),
                      ],
                    )),
              ),
            ),
          ])),
    );
  }
}
