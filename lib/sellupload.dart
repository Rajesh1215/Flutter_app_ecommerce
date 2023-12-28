import 'package:flutter/material.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  List<UploadItem> uploads = [
    UploadItem(
      price: 50,
      image: 'assets/images/item_1.png',
    ),
    UploadItem(
      price: 75,
      image: 'assets/images/item_2.png',
    ),
    UploadItem(
      price: 100,
      image: 'assets/images/item_3.png',
    ),
    UploadItem(
      price: 120,
      image: 'assets/images/item_4.png',
    ),
    UploadItem(
      price: 90,
      image: 'assets/images/item_5.png',
    ),
    UploadItem(
      price: 60,
      image: 'assets/images/item_6.png',
    ),
  ];

  Widget buildUploadButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle upload button press
      },
      child: Text('Upload'),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      itemCount: uploads.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final item = uploads[index];
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(item.image),
                    SizedBox(height: 8.0),
                    Text('Price: \$${item.price.toString()}'),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle change option button press
                      },
                      child: Text('Change Option'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Page'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sell Here',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            buildUploadButton(),
            SizedBox(height: 16.0),
            Expanded(child: buildGridView()),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle sold items button press
              },
              child: Text('Sold Items'),
            ),
          ],
        ),
      ),
    );
  }
}

class UploadItem {
  final double price;
  final String image;

  UploadItem({
    required this.price,
    required this.image,
  });
}


