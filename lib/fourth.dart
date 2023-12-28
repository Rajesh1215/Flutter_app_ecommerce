import 'package:flutter/material.dart';

class buyingpage extends StatefulWidget {
  @override
  buyingpagestate createState() => buyingpagestate();
}

class buyingpagestate extends State<buyingpage> {
  int quantity = 1;

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'You are on the way',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'inter'
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6.0,vertical: 10),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                      height: 24,
                    ),
                    Text(
                      'Name: Product Name',
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Artist: John Doe',
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(height: 8),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Size: Medium',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: decreaseQuantity,
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: increaseQuantity,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '123 Main Street, City, State', // Current address
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        // Change address logic
                      },
                      child: Text(
                        'Change', // Change option
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Payment Options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Radio(
                  value: 'UPI',
                  groupValue: 'paymentOption', // Currently selected payment option
                  onChanged: (value) {
                    // Handle radio button selection
                  },
                ),
                title: Text('UPI'),
              ),
              ListTile(
                leading: Radio(
                  value: 'Cash',
                  groupValue: 'paymentOption', // Currently selected payment option
                  onChanged: (value) {
                    // Handle radio button selection
                  },
                ),
                title: Text('Cash'),
              ),
              ListTile(
                leading: Radio(
                  value: 'Delivery',
                  groupValue: 'paymentOption', // Currently selected payment option
                  onChanged: (value) {
                    // Handle radio button selection
                  },
                ),
                title: Text('Delivery'),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Buy button logic
                },
                child: Text('Buy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
