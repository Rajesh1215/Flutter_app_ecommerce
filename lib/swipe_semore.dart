import 'package:flutter/material.dart';
import 'package:goal/makerpage.dart';
import 'third.dart';

class ImagePopupViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  ImagePopupViewer({required this.images, required this.initialIndex});

  @override
  _ImagePopupViewerState createState() => _ImagePopupViewerState();
}

class _ImagePopupViewerState extends State<ImagePopupViewer> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 125,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.height * 0.4,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ImagePopup(
                      imageUrl: widget.images[index],
                      currentIndex: _currentIndex,
                    );
                  },
                ),
              ),
            ),
            Positioned(
                left: 20,
                top: 20,
                child:Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  height: 80,
                  width: 200,
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MakerPage()));
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/images/avatar.png'), // Replace with your own image path
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Username ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Skills',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'rating',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Handle close button press
                },
                child: Icon(Icons.close),
              ),
            ),
            Positioned(
                bottom: 15,
                right: 10,
                child: ElevatedButton(
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderingScreen()));
                  },
                  style:ElevatedButton.styleFrom(
                    elevation: 3,
                  ),
                  child: Text('Buy',style: TextStyle(fontFamily: 'inter'),),
                )
            ),

          ],
        ),
      ),
    );
  }
}

class ImagePopup extends StatelessWidget {
  final String imageUrl;
  final int currentIndex;

  ImagePopup({required this.imageUrl, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Image(
        image:AssetImage(imageUrl),)

    );
  }
}

