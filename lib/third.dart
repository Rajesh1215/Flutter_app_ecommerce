import 'package:flutter/material.dart';
import 'fourth.dart';

class OrderingScreen extends StatefulWidget {
  @override
  _OrderingScreenState createState() => _OrderingScreenState();
}

class _OrderingScreenState extends State<OrderingScreen> {
  int quantity = 1;
  int numoftab=6;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Product Name',
                  style: TextStyle(fontFamily: 'inter',fontWeight: FontWeight.bold,fontSize: 24),

                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 360,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Price: \$10    ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height:35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: numoftab,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Tab(
                          text: 'Tab $index',
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 70 ,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7,vertical: 9),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                MYcontains(context, 10),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('View artists'),
                ),
                SizedBox(height: 8,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>buyingpage()));// Place order logic
                  },
                  child: Text('Place Order'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget MYcontains(BuildContext context,n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'samples',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'inter',
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: n,
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                height: 150,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Container ${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


class Tab extends StatelessWidget {
  final String text;

  const Tab({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          elevation: 6, // Adjust the elevation value as per your requirement
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}