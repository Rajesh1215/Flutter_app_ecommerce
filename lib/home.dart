import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'notify.dart';
import 'search.dart';
import 'second.dart';
import 'main.dart';
import 'buyorders.dart';
class HomeScreen extends StatefulWidget {

  @override
  _Hs    createState() => _Hs();

}
class _Hs extends State<HomeScreen>{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> highlights_names=['Highlights in Arts','Highlights in Fashion','Highlights in handmades','Highlights in Editing','Highlights in Gifts'];
  List<String> hl_arts=['https://www.skillshare.com/blog/wp-content/uploads/2021/02/Screenshot2021-01-21at16.31.10.png','https://cdn.siasat.com/wp-content/uploads/2020/12/New-Project-55-780x470.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1135px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg',
    'https://www.shutterstock.com/image-illustration/windy-day-drawing-coal-digital-600w-2205502859.jpg','https://m.media-amazon.com/images/I/71ObDecaY6L._SX569_.jpg'];
  List<String> hl_fash=['https://www.otis.edu/sites/default/files/Student%20Work%20-%20Sr%20Illustrations_0.jpg'];
  List<String> hl_hm=['https://www.vikhrolicucina.com/uploads/stories/1614351997_fruitpickle2.jpg'];
  List<String> hl_edit=['https://res.cloudinary.com/ninety-seconds/image/upload/v1594006437/-knowledge/-article-images/cover-what-is-video-editor.jpg'];
  List<String> hl_gift=['https://res.cloudinary.com/ninety-seconds/image/upload/v1594006437/-knowledge/-article-images/cover-what-is-video-editor.jpg'];

  List<int> hl_counts=[];
  List imges=[];



  @override
  void initState() {
    super.initState();
    imges = [hl_arts,hl_fash, hl_hm,hl_edit,hl_gift];
    hl_counts=[hl_arts.length,hl_fash.length,hl_hm.length,hl_edit.length,hl_gift.length];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        drawer:Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(currentIndex: 3,)));
                      },
                      child: const CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                        radius: 25,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Orders'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BuyOrdersPage()));
                  // Handle Earn tab tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.monetization_on),
                title: const Text('Earn'),
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(currentIndex: 1,)));
                  // Handle Earn tab tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.emoji_events),
                title: const Text('Contests'),
                onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(currentIndex: 2,)));
             },
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Helpline'),
                onTap: () {
                  // Handle Helpline tab tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About Us'),
                onTap: () {
                  // Handle About Us tab tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Rate Us'),
                onTap: () {
                  // Handle Rate Us tab tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Handle Settings tab tap
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  // Handle Logout tab tap
                },
              ),
            ],
          ),),
      body: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 3),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(240, 250, 255, 0.7),

          // gradient: LinearGradient(
          //   colors: [Colors.blue.withOpacity(0.7), Colors.white], // Set the desired gradient colors
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //
          // ),
        ),
        width:MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: (){
                        _scaffoldKey.currentState?.openDrawer();

                      },
                      iconSize: 25,
                    ),
                    const Expanded(
                      child: SizedBox(

                      ),
                    )
                    ,
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));// Handle search icon tap
                      },
                      iconSize: 25,
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationApp()));// Handle notification icon tap
                      },
                      iconSize: 25,
                    ),
                  ],
                ),
              ),
              Container(

                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Row(
                  children: [
                    Container(
                      
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(currentIndex: 3,)));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0),
                          backgroundImage:const AssetImage('assets/images/person.png'),
                          radius: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Good morning,',style:TextStyle(fontSize: 12,fontFamily: 'inter',fontWeight: FontWeight.bold,),),

                        const Text('John',style:TextStyle(fontSize: 15,fontFamily: 'inter',fontWeight: FontWeight.bold,),),
                      ],
                    )
                    ,

                  ],
                ),

              ),

              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                width: MediaQuery.of(context).size.width,
                color: Colors.white.withOpacity(0.05),
                child: MyCarouselSlider(),
                ),
              const SizedBox(
                height: 5,
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: const Text('What are you looking at?',
                    style:TextStyle(fontSize: 15,fontFamily: 'inter',fontWeight: FontWeight.bold,),
                  ),
              ),

              const SizedBox(
                height: 10,

              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondStep()));
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white.withOpacity(0),
                                backgroundImage:const AssetImage('assets/images/paint-palette.png'),
                            ),
                            const Text('Arts',style:TextStyle(fontSize: 12,fontFamily: 'inter',),)
                          ],
                        ),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondStep()));
                        },
                        child: Column(
                          children: [
                            CircleAvatar(

                              radius: 24,
                              backgroundColor: Colors.white.withOpacity(0),
                              backgroundImage:const AssetImage('assets/images/polo-shirt.png'),
                            ),
                            const Text('Fashion',style:TextStyle(fontSize: 12,fontFamily: 'inter',),)
                          ],
                        ),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondStep()));
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white.withOpacity(0),
                              backgroundImage:const AssetImage('assets/images/handmade.png'),
                            ),
                            const Text('Handmade',style:TextStyle(fontSize: 12,fontFamily: 'inter',),)
                          ],
                        ),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondStep()));
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white.withOpacity(0),
                              backgroundImage:const AssetImage('assets/images/multimedia.png'),
                            ),
                            const Text('Editing',style:TextStyle(fontSize: 12,fontFamily: 'inter',),)
                          ],
                        ),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondStep()));
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white.withOpacity(0),
                              backgroundImage:const AssetImage('assets/images/multimedia.png'),
                            ),
                            const Text('Gifts',style:TextStyle(fontSize: 12,fontFamily: 'inter',),)
                          ],
                        ),
                      ))

                ],
              ),
              const SizedBox(height: 20,),

                ListView.builder(
                  itemCount: highlights_names.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context,int index){
                   return Container(
                     margin: const EdgeInsets.all(3),


                     padding: const EdgeInsets.fromLTRB(3,5,3,3),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         // Divider(
                         //   color: Colors.black.withOpacity(0.3),
                         //   thickness: 1.0,
                         // ),
                         Container(
                             padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                             child: Text(highlights_names[index],
                               style: const TextStyle(fontSize: 15,fontFamily: 'inter',fontWeight: FontWeight.bold),)
                         ),
                         const SizedBox(height: 7,),
                         SingleChildScrollView(
                           child: Container(
                             padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                             decoration:BoxDecoration(

                               borderRadius: BorderRadius.circular(10),

                             ),

                             height: 150,
                             child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Number of items per row
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: hl_counts[index], // Total number of items
            itemBuilder: (BuildContext context, int bindex) {
              return Container(
                margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 0), // changes the position of the shadow
                  ),
                ],
                ),

                child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: Image.network(imges[index][bindex],
                fit:BoxFit.cover
                ),

                )

                ); // Set the desired width for each grid item;
            },
          ),
                           ),
                         ),
                       ],
                     ),
                   );
                  }
                ),

      ],
      ),
        ),
      ),
    );


  }
}











class MyCarouselSlider extends StatefulWidget {
  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();

}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int _currentIndex = 0;
  final List<String> imageList = [
    'https://images.freeimages.com/images/large-previews/a3e/wild-horse-1334844.jpg',
    'https://images.freeimages.com/images/large-previews/bb0/cat-in-window-1218032.jpg',
    'https://images.freeimages.com/images/large-previews/4b2/walking-on-the-mountain-1-1566594.jpg',
    'https://images.freeimages.com/images/large-previews/31a/traverse-1234278.jpg',
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imageList.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 8), // changes the position of the shadow
                  ),
                ],
              ),

              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Stack(
                children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    width:MediaQuery.of(context).size.width,
                    imageList[index],
                    fit: BoxFit.cover,

                  ),
                ),
                  Align(
                    alignment:Alignment.bottomCenter,
                    child: DotsIndicator(
                      dotsCount: imageList.length,
                      position: _currentIndex.toDouble(),
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.black,
                        size: const Size.square(8.0),
                        activeSize: const Size(20.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            );
          },
          options: CarouselOptions(

            height: 100,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            onPageChanged: (int page,CarouselPageChangedReason reason) {
              setState(() {
                _currentIndex = page;
              });
            },

            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(height: 10),

      ],
    );
  }
}
