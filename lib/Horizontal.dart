import 'package:flutter/material.dart';


class Horizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images/images.jpg',
            image_caption: 'Toys',
          ),
          Category(
            image_location: 'assets/images/pro1.jpg',
            image_caption: 'Toys',
          ),
          Category(
            image_location: 'assets/images/pro1.jpg',
            image_caption: 'gift',
          ),
          Category(
            image_location: 'assets/images/images.jpg',
            image_caption: 'Toys',
          ),
          Category(
            image_location: 'assets/images/images.jpg',
            image_caption: 'Toys',
          ),
          Category(
            image_location: 'assets/images/images.jpg',
            image_caption: 'Toys',
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
    return Padding
      (
      padding: EdgeInsets.all(2.0),
      child: InkWell(
          onTap: (){},
          child: Container(
            width: 100.0,
            child:ListTile(
              title:Image.asset(image_location,width: 100.0,height: 90.0,),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(image_caption),
              ),
            ),
          )
      ),
    );
  }
}