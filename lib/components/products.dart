import 'package:e_commerce/pages/product_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "assets/images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "assets/images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Pants",
      "picture": "assets/images/products/pants1.jpg",
      "old_price": 80,
      "price": 60,
    },
    {
      "name": "shoe",
      "picture": "assets/images/products/shoe1.jpg",
      "old_price": 90,
      "price": 45,
    },
    {
      "name": "Pants",
      "picture": "assets/images/products/pants1.jpg",
      "old_price": 80,
      "price": 60,
    },
    {
      "name": "shoe",
      "picture": "assets/images/products/shoe1.jpg",
      "old_price": 90,
      "price": 45,
    },
    {
      "name": "shoe",
      "picture": "assets/images/products/shoe1.jpg",
      "old_price": 90,
      "price": 45,
    },
    {
      "name": "shoe",
      "picture": "assets/images/products/hills1.jpeg",
      "old_price": 90,
      "price": 45,
    },
    {
      "name": "shoe",
      "picture": "assets/images/products/skt1.jpeg",
      "old_price": 90,
      "price": 45,
    },
    {
      "name": "shoe",
      "picture": "assets/images/products/skt2.jpeg",
      "old_price": 90,
      "price": 45,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: product_list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  const Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: card(context),
    );
  }

  Material card(BuildContext context) {
    return Material(
        child: InkWell(
          onTap: () => 
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ProductDetails(
              product_detail_name: prod_name,
              product_detail_new_price: prod_price,
              product_detail_old_price: prod_old_price,
              product_detail_picture: prod_picture,
            ))),

          child: Container(
            margin: EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: GridTile(
                child: Image.asset(
                  prod_picture,
                  fit: BoxFit.cover,
                ),
                footer: Container(
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                        ),
                        Text("\$$prod_price", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  )
                ),
              ),
            ),
          ),
        ),
      );
  }
}
