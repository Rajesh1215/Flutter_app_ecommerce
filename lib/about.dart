import 'package:flutter/material.dart';


class AboutScreen extends StatefulWidget {
  Aboutstate createState()=> Aboutstate();
}
class Aboutstate extends State<AboutScreen>{
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],

          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 17,

                child: CircleAvatar(
                  radius: 25,
                  child: Icon(
                    Icons.person,
                    size: 35,
                  ),
                ),
              ),
              Positioned(
                left: 60,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily:'inter'
                      ),
                    ),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(fontSize: 13,fontFamily:'inter'),
                    ),
                    Text(
                      '+1 123-456-7890',
                      style: TextStyle(fontSize: 13,fontFamily:'inter'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(

          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],

          ),
          child:  Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.edit,
                  size: 24,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Info',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                        fontFamily:'inter'
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: John',
                          style: TextStyle(fontSize: 13,fontFamily:'inter'),
                        ),
                        Text(
                          'Email: john@example.com',
                          style: TextStyle(fontSize: 13,fontFamily:'inter'),
                        ),
                        Text(
                          'Phone: 123-456-7890',
                          style: TextStyle(fontSize: 13,fontFamily:'inter'),
                        ),
                        Text(
                          'Default Address: 123 Main St',
                          style: TextStyle(fontSize: 13,fontFamily:'inter'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(

          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    buildBox(context, Icons.people, "Orders", Orders()),
                    buildBox(context, Icons.star, "Help", Help()),
                  ]),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),

        Container(

          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],

          ),
          child:  Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.edit,
                  size: 24,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Work Info',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily:'inter'
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ph:123456789',
                          style: TextStyle(fontSize: 13,fontFamily:'inter'),
                        ),
                        Text(
                          'Email: john@example.com',
                          style: TextStyle(fontSize: 13,fontFamily:'inter'),
                        ),
                        Text(
                          'upi:1234567890',
                          style: TextStyle(fontSize: 13,fontFamily:'inter'),
                        ),
                        Text(
                          'pick up Default Address: 123 Main St',
                          style: TextStyle(fontSize: 13,fontFamily:'inter'),
                        ),
                        Text(
                          'Skills:....',
                          style: TextStyle(fontSize: 13,fontFamily:'inter'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    Container(
      width: MediaQuery.of(context).size.width,

    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 5,
    offset: Offset(0, 2),
    ),
    ],

    ),
    child:Text('Log out')
    ),
        Container(
            width: MediaQuery.of(context).size.width,

            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],

            ),
            child:Text('Rate us')
        ),
    ],
    );
  }
  Widget buildBox(BuildContext context, IconData iconData, String text, Widget nextPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
      },
      child: Container(
        margin: EdgeInsets.all(7),
        height: 70,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData,),
            // SizedBox(height: 10),
            Text(
              text,
              // style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('par'),
      ),
      body: Center(
        child: Text('par Page'),
      ),
    );
  }
}
class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('par'),
      ),
      body: Center(
        child: Text('par Page'),
      ),
    );
  }
}