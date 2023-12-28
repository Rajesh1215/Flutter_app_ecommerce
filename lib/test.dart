import 'package:flutter/material.dart';

enum OrderStatus {
  pending,
  completed,
}

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  OrderStatus filter = OrderStatus.pending;
  String searchQuery = '';
  DateTime? fromDate;
  DateTime? toDate;

  Widget buildSearchBar() {
    return TextField(
      onChanged: (value) {
        setState(() {
          searchQuery = value;
        });
      },
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget buildDateRangePicker() {
    return TextFormField(
      onTap: () async {
        final initialDateRange = DateTimeRange(
          start: fromDate ?? DateTime.now(),
          end: toDate ?? DateTime.now(),
        );
        final pickedDateRange = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2022),
          lastDate: DateTime.now(),
          initialDateRange: initialDateRange,
        );
        if (pickedDateRange != null) {
          setState(() {
            fromDate = pickedDateRange.start;
            toDate = pickedDateRange.end;
          });
        }
      },
      decoration: InputDecoration(
        labelText: 'Select Date Range',
        prefixIcon: Icon(Icons.date_range),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      readOnly: true,
      initialValue: fromDate != null && toDate != null
          ? '${fromDate!.toString().split(' ')[0]} - ${toDate!.toString().split(' ')[0]}'
          : null,
    );
  }

  Widget buildTab(OrderStatus status) {
    String statusText = '';
    Color textColor = Colors.black;

    switch (status) {
      case OrderStatus.pending:
        statusText = 'Pending';
        break;
      case OrderStatus.completed:
        statusText = 'Completed';
        break;
      default:
        statusText = 'Unknown';
    }

    if (status == filter) {
      textColor = Colors.blue;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          filter = status;
        });
      },
      child: Text(
        statusText,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }

  List<RequestContainer> getFilteredOrders() {
    List<RequestContainer> allOrders = [
      RequestContainer(
        orderId: '123456',
        orderType: 'Type A',
        quantity: 5,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '123456',
        orderType: 'Type A',
        quantity: 5,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '123456',
        orderType: 'Type A',
        quantity: 5,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '123456',
        orderType: 'Type A',
        quantity: 5,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '123456',
        orderType: 'Type A',
        quantity: 5,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '123456',
        orderType: 'Type A',
        quantity: 5,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '123456',
        orderType: 'Type A',
        quantity: 5,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '123456',
        orderType: 'Type A',
        quantity: 5,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '123456',
        orderType: 'Type A',
        quantity: 5,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '789012',
        orderType: 'Type B',
        quantity: 3,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '345678',
        orderType: 'Type C',
        quantity: 2,
        status: OrderStatus.pending,
      ),
      RequestContainer(
        orderId: '987656',
        orderType: 'Type C',
        quantity: 2,
        status: OrderStatus.completed,
      ),
      RequestContainer(
        orderId: '325531',
        orderType: 'Type C',
        quantity: 2,
        status: OrderStatus.completed,
      ),
    ];

    if (searchQuery.isNotEmpty) {
      allOrders = allOrders
          .where((order) =>
          order.orderId.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    if (fromDate != null && toDate != null) {
      allOrders = allOrders.where((order) {
        final orderDate = DateTime.parse(order.orderId.substring(0, 6));
        return orderDate.isAfter(fromDate!) && orderDate.isBefore(toDate!);
      }).toList();
    }

    if (filter != null) {
      allOrders = allOrders.where((order) => order.status == filter).toList();
    }

    return allOrders;
  }

  @override
  Widget build(BuildContext context) {
    final filteredOrders = getFilteredOrders();

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    buildSearchBar(),
                    SizedBox(height: 16.0),
                    buildDateRangePicker(),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTab(OrderStatus.pending),
                  buildTab(OrderStatus.completed),
                ],
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredOrders.length,
                  itemBuilder: (context, index) {

                    final order = filteredOrders[index];
                    return ListTile(
                      title: Text(order.orderId),
                      subtitle: Text('Order Type: ${order.orderType}'),
                      trailing: Text('Qty: ${order.quantity.toString()}'),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsPage(
                          orderId: order.orderId,
                          image: 'https://example.com/image.jpg',
                          text: 'Example text',
                          productSize: 'Large',
                          deadline: '2023-05-31',
                        ),));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestContainer {
  final String orderId;
  final String orderType;
  final int quantity;
  final OrderStatus status;

  RequestContainer({
    required this.orderId,
    required this.orderType,
    required this.quantity,
    required this.status,
  });
}


class OrderDetailsPage extends StatelessWidget {
  final String orderId;
  final String image;
  final String text;
  final String productSize;
  final String deadline;

  OrderDetailsPage({
    required this.orderId,
    required this.image,
    required this.text,
    required this.productSize,
    required this.deadline,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order ID: $orderId',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 0), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                    image,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Text: $text',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Product Size: $productSize',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Deadline: $deadline',
                  style: TextStyle(fontSize: 16.0),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Implement accept button logic here
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        child: Text('Progress'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement deny button logic here
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}




void main() {
  runApp(MaterialApp(
    home: RequestPage(),
  ));
}
