import 'package:e_commerce/components/cart_products.dart';
import 'package:e_commerce/pages/checkout.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: buildAppBar(),
       body: Cart_products(),
       bottomNavigationBar: buildBottomNav(),
    );
  }

  Container buildBottomNav() {
    return Container(
       color: Colors.white,
       child: Row(
         children: [
           Expanded(
            child: ListTile(
              title: Text("Total:"),
              subtitle: Text("\$215"),
            )
           ),

           Expanded(
             child: MaterialButton(
               child: Text("Check out", style: TextStyle(color: Colors.white),),
               color: Colors.red,
               onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutPage()));
               },
            ),
          ),

         ],
       ),
     );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.red,
      title: Text('Cart'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}