import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'listofcontest.dart';
class Contesto extends StatefulWidget {
  @override
  _ContestoState createState() => _ContestoState();
}

class _ContestoState extends State<Contesto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.purple],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contesto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Participate in the ultimate contest and showcase your skills! Win exciting prizes and gain recognition in the contest community.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
          child: Text(
            'Categories',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'inter',
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedAvatar(
                icon: Icons.people,
                text: 'Arts',
              ),
              ElevatedAvatar(
                icon: Icons.star,
                text: 'Editing',
              ),
              ElevatedAvatar(
                icon: Icons.help,
                text: 'Fashion',
              ),
              ElevatedAvatar(
                icon: Icons.sell,
                text: 'Others',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
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
                    buildBox(context, Icons.people, "Participations", partipations()),
                    buildBox(context, Icons.star, "Rewards", Rewards()),
                  ]),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'Present participations',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'inter',
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [

            ],
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10, // Replace 'n' with the desired number of containers
            itemBuilder: (context, index) {
              return Container(

                height: 60,
                width: 150,
                margin: EdgeInsets.all(10),
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
                // Add your content for each container widget
                child: Center(
                  child: Text(
                    'Widget $index',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'Popular Contests',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'inter',
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [

            ],
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10, // Replace 'n' with the desired number of containers
            itemBuilder: (context, index) {
              return Container(

                height: 60,
                width: 150,
                margin: EdgeInsets.all(10),
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
                // Add your content for each container widget
                child: Center(
                  child: Text(
                    'Widget $index',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            },
          ),
        )

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

class partipations extends StatelessWidget {
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

class Rewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rew'),
      ),
      body: Center(
        child: Text('rew Page'),
      ),
    );
  }
}

class ElevatedAvatar extends StatelessWidget {
  final IconData icon;
  final String text;

  const ElevatedAvatar({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ContestPagelist()));
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow:[ BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 2,
                offset: Offset(0,0),
              )],
            ),
            child: CircleAvatar(
              child: Icon(icon),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              radius:30,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: 'inter'
          ),
        ),
      ],
    );



  }
}
