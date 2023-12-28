import 'package:flutter/material.dart';
import 'third.dart';
import 'swipe_semore.dart';
import 'makerpage.dart';
class Viewmorefromsecond extends StatefulWidget {
  @override
  Viewmorefromsecondstate createState() => Viewmorefromsecondstate();
}

class Viewmorefromsecondstate extends State<Viewmorefromsecond> {
  List<String> items=['1','2','3'];
  int currentindex=0;
  List<int> itemcount=[5,8,4];
  late List<Widget>fs;
  final List<String> gridimages = [
    'assets/images/something.png',
    'assets/images/something.png',
    'assets/images/something.png',
    'assets/images/something.png',
    'assets/images/something.png',
  ];

  Widget first(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Type',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        noncont(context, items, itemcount),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'See more',
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'inter',
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns
              crossAxisSpacing: 5, // Spacing between columns
              mainAxisSpacing: 5, // Spacing between rows
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: gridimages.length, // Total number of grid items
            itemBuilder: (BuildContext context, int index) {
              // Builder function to build each grid item
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 30),

                            child: ImagePopupViewer(
                              images: gridimages,
                              initialIndex: index,
                            ),
                          );
                        },
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                          child:Image(
                            image:AssetImage(gridimages[index]),)

                      )
                    ),
                    ),
                  ),
              );
            },
          ),
        )


        // Add additional content here
      ],
    );
  }
  Widget seco(BuildContext context){
    return ListView.builder(
      itemCount: 10, // Total number of list items
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        // Builder function to build each list item
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MakerPage()));
          },
          child: Container(
            height: 80,
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/avatar.png'), // Replace with your own image path
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Username $index',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        'Skills',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'rating',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'badges',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    )
    ;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fs=[first(context),seco(context)];

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Type',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentindex=0;
                        });// Add your button 1 onPressed logic here
                      },
                      child: const Text('Button 1'),
                    ),
                    const SizedBox(width: 16), // Adjust the spacing between the buttons
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentindex=1;
                        });
                        // Add your button 2 onPressed logic here
                      },
                      child: const Text('Button 2'),
                    ),
                  ],
                ),
              ),
              fs[currentindex],

            ],),
        ),
      ),
    );
  }


  Widget noncont(BuildContext context,a,b){
    return ListView.builder(
        itemCount: a.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          return MYcontains(context, b[index],a[index]);
        }
    );
  }

  Widget MYcontains(BuildContext context,n,head) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            '$head',
            style: const TextStyle(
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
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => OrderingScreen()));
                },
                child: Container(
                  width: 120,
                  height: 100,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Container ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
