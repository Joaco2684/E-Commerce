import 'package:e_commerce/pages/home.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  const ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
          child: Text('ShopApp'),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          //Header of the screen, where we show the price and the photos
          buildPhotos(),

          //Buttons to customize the order
          Row(
            children: [
              buttonsBuild("Size"),
              buttonsBuild("Color"),
              buttonsBuild("Qty"),
            ],
          ),
          
          //Buttons to buy now / add cart
          buildPrincipalButtons(),

          Divider(),

          ListTile(
            title: Text('Product details',),
            subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"),
          ),

          Divider(),

          buildRow("Product name", widget.product_detail_name),
          buildRow("Product brand", "Armani"),
          buildRow("Product condition", "New"),

          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("SImilar products", style: TextStyle(fontSize: 18.0),),
          ),

          Container(
            height: 400.0,
            child: Similar_products(),
          )
          
        ],
      ),
    );
  }

  Padding buildPhotos() {
    return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: 250.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.product_detail_name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "\$${widget.product_detail_old_price}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.product_detail_new_price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }

  Padding buildPrincipalButtons() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Buy now"),
                ),
              ),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
              ),
            ],
          ),
        );
  }

  Row buildRow(String title, String content) {
    return Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: Text(title, style: TextStyle(color: Colors.grey),),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(content),
            )
          ],
        );
  }

  Expanded buttonsBuild(String text) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                title: Text(text),
                content: Text('Choose the $text'),
                actions: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close', style: TextStyle(color: Colors.red),),
                  )
                ],
              );
            },
          );
        },
        color: Colors.white,
        textColor: Colors.grey,
        elevation: 0.2,
        child: Row(
          children: [
            Expanded(
              child: Text(text),
            ),
            Expanded(
              child: Icon(Icons.arrow_drop_down),
            ),
          ],
        ),
      ),
    );
  }

}

class Similar_products extends StatefulWidget {
  
  @override
   _Similar_productsState createState() => _Similar_productsState();
}
  
class _Similar_productsState extends State<Similar_products> {

    var product_list = [
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
        return Similar_single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  const Similar_single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: prod_name,
        child: card(context),
      ),
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



