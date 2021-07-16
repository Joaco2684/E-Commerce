import 'package:e_commerce/pages/cart.dart';
import 'package:e_commerce/widgets/horizontal_list.dart';
import 'package:e_commerce/components/products.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: _drawer(),
      body: body(),
    );
  }


  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.red,
      title: Text('ShopApp'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
          },
        ),
      ],
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        children: [
          //Header
          UserAccountsDrawerHeader(
            accountName: Text('Santos Enoque'),
            accountEmail: Text('joaquindilo@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white,),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.red
            ),  
          ),
          
          //Body
          listMenu(Icons.home, "Home Page", Colors.red, (context) => HomePage()),
          listMenu(Icons.person, "My account", Colors.red, (context) => Cart()),
          listMenu(Icons.shopping_basket, "My Orders", Colors.red, (context) => Cart()),
          listMenu(Icons.shopping_cart, "Shopping cart", Colors.red, (context) => Cart()),
          listMenu(Icons.favorite, "Favourites", Colors.red, (context) => Cart()),
          Divider(),
          listMenu(Icons.settings, "Settings", Colors.grey, (context) => Cart()),
          listMenu(Icons.help, "About", Colors.blue, (context) => Cart()),
        ],
      ),
    );
  }

  InkWell listMenu(IconData icon,String text, Color color, Widget Function(BuildContext) build) {
    return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: build));
          },
          child: ListTile(
            title: Text(text),
            leading: Icon(icon, color: color),
          ),
        );
  }

  ListView body() {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        //Image carousel begins here
        imageCarousel(),

        //Padding widget
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Categories", 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),

        //Horizontal list view begins here
        HorizontalList(),

        //Padding widget
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            "Recent products", 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
        ),
        
        //Grid view
        Container(
          height: 500.0,
          child: Products(),
        )

      ],
    );
  }

  Widget imageCarousel() {
    return Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/c1.jpg'),
          AssetImage('assets/images/m1.jpeg'),
          AssetImage('assets/images/w3.jpeg'),
          AssetImage('assets/images/m2.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 8.0,
        dotBgColor: Colors.transparent,
      ),
    );
  }

}