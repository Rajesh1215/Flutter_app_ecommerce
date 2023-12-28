import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'work.dart';
import 'contest.dart';
import 'about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  int? currentIndex;
  MyHomePage({this.currentIndex});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _currentIndex  ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.currentIndex?? 0 ;
  }

  final List<Widget> _pages = [
    HomeScreen(),
    Workscreen(),
    Contesto(),
    AboutScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: _pages[_currentIndex]),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.lightBlue,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.briefcase),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rocket),
            label: 'Contest',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'About',
          ),
        ],
      ),


    );
  }
}


//
// Text(
// 'Quantity',
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// ),
// ),
// Row(
// children: [
// IconButton(
// icon: Icon(Icons.remove),
// onPressed: () {
// setState(() {
// if (quantity > 1) {
// quantity--;
// }
// });
// },
// ),
// Text(
// quantity.toString(),
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// ),
// ),
// IconButton(
// icon: Icon(Icons.add),
// onPressed: () {
// setState(() {
// quantity++;
// });
// },
// ),
// ],
// ),