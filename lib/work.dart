import 'package:flutter/material.dart';
import 'requestpage.dart';
import 'takeorders.dart';
import 'paymentpage.dart';
import 'sellupload.dart';
class Workscreen extends StatefulWidget{

  @override
  workstate createState()=> workstate();
}
class workstate extends State<Workscreen>{

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        color: Color.fromRGBO(240, 250, 255, 0.7),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(

                    radius:16,
                    backgroundColor: Colors.blue,
                  ),
                  SizedBox(width: 5,),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('John',style: TextStyle(fontFamily: 'inter',fontWeight: FontWeight.bold,fontSize: 14),),

                        Text('john@gmail.com',style: TextStyle(fontFamily: 'inter',fontSize: 12),),
                      ],

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'Catogaries',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            cato(),
          ],
        ),
      ),
    );
  }
}

class cato extends StatefulWidget{


  @override
  catostate createState()=> catostate();
}

class catostate extends State<cato>{
  List<String> catogiries=['face art','photo editing','video editing','micron art'];
  int glob=0;

  Widget build(BuildContext context){

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:EdgeInsets.symmetric(horizontal: 30),
          height:50,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: catogiries.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            glob=index;
                          });// Add your button's onPressed logic here
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          backgroundColor:glob==index ? Colors.blue :Colors.white ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.black,width: 0.2),
                          ),
                          shadowColor: Colors.black.withOpacity(0.3),
                          elevation: 6,
                        ),
                        child: Text(
                          catogiries[index],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    );

                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),

        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(2, 2), // Adjust the offset values as desired
                ),
              ],
            ),
            height: 150,
            child:Stack(
              children: [
                Positioned(
                  top: 5,
                  left: 10,
                  child: Text(
                    catogiries[glob],
                    style: TextStyle(
                      fontFamily: 'inter',
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 10,
                  child: Container(
                    height: 35,
                    width: 300,
                    child: Text(
                      "        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec lectus non lectus commodo aliquam nec a nisi. Mauris lobortis elementum cursus. Sed cursus pharetra ex, vel blandit erat ultrices non. Vestibulum venenatis pulvinar elit, sed dignissim nisl congue vel. Quisque malesuada risus ac consectetur sagittis.",
                      style: TextStyle(
                        fontFamily: 'inter',
                        color: Colors.black,
                        fontSize: 10,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 10,
                  child: Text(
                    "Total Orders",
                    style: TextStyle(fontFamily: 'inter',fontSize: 12,),
                  ),
                ),
                Positioned(
                  top: 95,
                  left: 10,
                  child: Text(
                    "Payment",
                    style: TextStyle(fontFamily: 'inter',fontSize: 12,),
                  ),
                ),
                Positioned(
                  top: 115,
                  left: 10,
                  child: Text(
                    "Rating",
                    style: TextStyle(fontFamily: 'inter',fontSize: 12,),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 30,
                  child: Text(
                    "Rating",
                    style: TextStyle(fontFamily: 'inter',fontSize: 12,),
                  ),
                ),
              ],
            )
        ),
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    buildBox(context, Icons.request_page, "Requests", RequestPage()),
                    buildBox(context, Icons.assignment, "Orders", Takeorder()),
                  ]),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    buildBox(context, Icons.payment, "Payments", PaymentPage()),
                    buildBox(context, Icons.upload, "SELL", SellPage()),
                  ]),


            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'Your Highlights',
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
                width: 130,
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


// Define separate pages for each container
class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Center(
        child: Text('Orders Page'),
      ),
    );
  }
}

class RequestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
      ),
      body: Center(
        child: Text('Requests Page'),
      ),
    );
  }
}



class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}

