import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image_location: 'assets/images/cats/tshirt.png',
            image_caption: 'shirt',
          ),

          Category(
            image_location: 'assets/images/cats/accessories.png',
            image_caption: 'accesories',
          ),

          Category(
            image_location: 'assets/images/cats/dress.png',
            image_caption: 'dress',
          ),
          
          Category(
            image_location: 'assets/images/cats/formal.png',
            image_caption: 'formal',
          ),

          Category(
            image_location: 'assets/images/cats/informal.png',
            image_caption: 'informal',
          ),

          Category(
            image_location: 'assets/images/cats/jeans.png',
            image_caption: 'jeans',
          ),

          Category(
            image_location: 'assets/images/cats/shoe.png',
            image_caption: 'shoe',
          ),

          
          
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location, width: 80.0, height: 60.0,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption),
            ),
          ),
        ),
      ),
    );
  }
}