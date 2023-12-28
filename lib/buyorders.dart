import 'package:flutter/material.dart';

enum OrderStatus {
  all,
  pending,
  completed,
  cancelled,
  unknown,
}

class BuyOrdersPage extends StatefulWidget {
  @override
  _BuyOrdersPageState createState() => _BuyOrdersPageState();
}

class _BuyOrdersPageState extends State<BuyOrdersPage> {
  OrderStatus filter = OrderStatus.all;
  String searchQuery = '';
  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildTab(OrderStatus.all),
                  buildTab(OrderStatus.pending),
                  buildTab(OrderStatus.completed),
                  buildTab(OrderStatus.cancelled),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: buildSearchBar(),
                  ),
                  SizedBox(width: 16.0),
                  buildDateRangePicker(),
                ],
              ),
            ),
            Expanded(
              child: OrderList(
                orders: getFilteredOrders(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTab(OrderStatus status) {
    String statusText = '';
    Color textColor = Colors.black;

    switch (status) {
      case OrderStatus.all:
        statusText = 'All';
        break;
      case OrderStatus.pending:
        statusText = 'Pending';
        break;
      case OrderStatus.completed:
        statusText = 'Completed';
        break;
      case OrderStatus.cancelled:
        statusText = 'Cancelled';
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
    return GestureDetector(
      onTap: () {
        showDateRangePicker(
          context: context,
          firstDate: DateTime(2022),
          lastDate: DateTime.now(),
        ).then((dateRange) {
          if (dateRange != null) {
            setState(() {
              fromDate = dateRange.start;
              toDate = dateRange.end;
            });
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.date_range, color: Colors.blue),
            SizedBox(width: 4.0),
            Text(
              'Select Date Range',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  List<Order> getFilteredOrders() {
    List<Order> allOrders = [
      Order('Order 1', OrderStatus.pending, DateTime(2023, 5, 15)),
      Order('Order 2', OrderStatus.completed, DateTime(2023, 5, 20)),
      Order('Order 3', OrderStatus.pending, DateTime(2023, 5, 25)),
      Order('Order 44', OrderStatus.completed, DateTime(2023, 5, 28)),
      Order('Order 5', OrderStatus.cancelled, DateTime(2023, 5, 18)),
    ];

    List<Order> filteredOrders = allOrders;

    // Apply search query filter
    if (searchQuery.isNotEmpty) {
      filteredOrders = filteredOrders
          .where((order) =>
          order.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    // Apply date range filter
    if (fromDate != null && toDate != null) {
      filteredOrders = filteredOrders
          .where((order) =>
      order.date.isAfter(fromDate!) && order.date.isBefore(toDate!))
          .toList();
    }

    // Apply status filter
    if (filter != OrderStatus.all) {
      filteredOrders =
          filteredOrders.where((order) => order.status == filter).toList();
    }

    return filteredOrders;
  }
}

class Order {
  final String name;
  final OrderStatus status;
  final DateTime date;

  Order(this.name, this.status, this.date);
}

class OrderList extends StatelessWidget {
  final List<Order> orders;

  OrderList({required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(orders[index].name),
          subtitle: Text(orders[index].status.toString()),
          trailing: Text(orders[index].date.toString().substring(0, 10)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyOrderDetailsPage(orderId: orders[index].name,)));
          },
        );
      },
    );
  }
}


class BuyOrderDetailsPage extends StatefulWidget {
  final String orderId;

  BuyOrderDetailsPage({required this.orderId});

  BuyOrderDetailsPagestate createState()=> BuyOrderDetailsPagestate();
}

class BuyOrderDetailsPagestate extends State<BuyOrderDetailsPage>{

  late String orderid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    orderid=widget.orderId;
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
              Text(
                'Order ID:$orderid',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Status: Processing',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Product Name: Example Product',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
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
                  child: Image.network('https://example.com/product-image.jpg')
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                    ),
                    child: Text('Cancel the order')
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Quantity: 2',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Ordered Date: May 28, 2023',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),

              Text(
                'Shipping Date: June 1, 2023',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'Address: 123 Main St, City, Country',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
