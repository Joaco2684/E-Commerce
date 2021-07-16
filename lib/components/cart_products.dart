import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Red dress",
      "picture": "assets/images/products/dress1.jpeg",
      "price": 50,
      "size": "M",
      "color": "Red",
      "quantity": 1
    },
    {
      "name": "Pants",
      "picture": "assets/images/products/pants1.jpg",
      "price": 60,
      "size": "L",
      "color": "Grey",
      "quantity": 2
    },
    {
      "name": "skirt",
      "picture": "assets/images/products/skt2.jpeg",
      "price": 45,
      "size": "M",
      "color": "Pink",
      "quantity": 1
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index) {
        return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_size: Products_on_the_cart[index]["size"],
            cart_prod_color: Products_on_the_cart[index]["color"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"]);
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  const Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_price,
      this.cart_prod_size,
      this.cart_prod_color,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_prod_picture, width: 80.0, height: 80.0,),
        title: Text(cart_prod_name),
        subtitle: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Row(
                        children: [
                          Text("Size: "),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              cart_prod_size,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Text("Color: "),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              cart_prod_color,
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      )),
                   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Text("Quantity: "),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              cart_prod_qty.toString(),
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),

            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$$cart_prod_price",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
