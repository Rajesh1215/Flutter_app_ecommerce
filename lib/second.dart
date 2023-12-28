import 'package:flutter/material.dart';
import 'third.dart';
import 'thirdone.dart';
class SecondStep extends StatefulWidget {
  @override
  _SecondStepState createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  List<String> catogiries=['Pencil art','painting','calligraphy','micron art'];
  int glob=0;
  List<String> penar=['face drawing','Famous personalities','Devotional','popular'];
  List<String> painting=['face painting','Famous personalities','Devotional','popular'];
  List<String> micro=['name grain','key chain','Devotional','popular'];
  List<String> calli=['hand writing','Famous personalities','Devotional','popular'];

  List length = [];

  @override
  void initState() {
    super.initState();
    length = [penar,painting,micro,calli];
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body:  SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Arts',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'inter',
                  ),
                ),
              ),
              const SizedBox(height:16),

              SingleChildScrollView(
                child: Container(
                  padding:const EdgeInsets.symmetric(horizontal: 15),
                  height:50,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: catogiries.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    glob=index;
                                  });// Add your button's onPressed logic here
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  backgroundColor:glob==index ? Colors.blue :Colors.white ,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: const BorderSide(color: Colors.black,width: 0.2),
                                  ),
                                  shadowColor: Colors.black.withOpacity(0.3),
                                  elevation: 6,
                                ),
                                child: Text(
                                  catogiries[index],
                                  style: const TextStyle(
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
              ),
              noncont(context,length[glob], [10,2,4,6]),
              Container(
                height: 100,
              )
            ],
          ),
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
        const SizedBox(height:16),

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
          height: 150,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: n,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>OrderingScreen()));
                },
                child: Container(
                  width: 180,
                  height: 150,
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
        Container(
          width: 200, // Adjust the percentage as per your requirement
          height: 40,
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Viewmorefromsecond() ));
// Add your button click functionality here
            },

              child: const Text('View more',style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              ),


            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: Colors.black,width: 0.1),

              ),
              backgroundColor: Colors.white,
              elevation: 3,
            ),
          ),
        ),
      ],
    );
  }
}

