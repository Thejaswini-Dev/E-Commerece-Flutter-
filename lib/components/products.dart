
import 'package:fashionapp/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "oldPrice": 120,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "oldPrice": 100,
      "price": 50,
    },
    {
      "name": "Blazer",
      "picture": "images/products/hills1.jpeg",
      "oldPrice": 120,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/skt1.jpeg",
      "oldPrice": 100,
      "price": 50,
    },
    {
      "name": "Blazer",
      "picture": "images/products/skt2.jpeg",
      "oldPrice": 120,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress2.jpeg",
      "oldPrice": 100,
      "price": 50,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Padding(padding: EdgeInsets.all(4.0),
       child: SingleProduct(
          prodName: productList[index]['name'],
          prodPricture: productList[index]['picture'],
          prodOldPrice: productList[index]['oldPrice'],
          prodPrice: productList[index]['price'],
        ), );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final prodName;
  final prodPricture;
  final prodOldPrice;
  final prodPrice;

  const SingleProduct(
      {Key key,
      this.prodName,
      this.prodPricture,
      this.prodOldPrice,
      this.prodPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          // tag: prodName,
          tag:Text("dress"),
          child: Material(
              child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  //here we are passing the values of the product to the prodct details pages
                  productDetailName: prodName,
                  productDetailNewPrice: prodPrice,
                  productDetailOldPrice: prodOldPrice,
                  productDetailPicture: prodPricture,
                ),
              ),
            ),
            child: GridTile(
              footer: Container(
                  color: Colors.white70,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Text(prodName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0)),
                    ),
                    Text("\$$prodPrice",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ))
                  ])
                  //   child: ListTile(
                  //     leading: Text(
                  //       prodName,
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     title: Text(
                  //       "\$$prodPrice",
                  //       style: TextStyle(
                  //         color: Colors.red,
                  //         fontWeight: FontWeight.w800,
                  //       ),
                  //     ),
                  //     subtitle: Text(
                  //       "\$$prodOldPrice",
                  //       style: TextStyle(
                  //           color: Colors.black54,
                  //           fontWeight: FontWeight.w800,
                  //           decoration: TextDecoration.lineThrough),
                  //     ),
                  //   ),
                  ),
              child: Image.asset(prodPricture, fit: BoxFit.cover),
            ),
          ))),
    );
  }
}
