import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "Color": "Black",
      "quantity": 1,
    },
    {
      "name": "Blazer",
      "picture": "images/products/hills1.jpeg",
      "price": 50,
      "size": "7",
      "Color": "Red",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsOnTheCart.length,
        itemBuilder: (context, index) {
          return SingleCartProducts(
            cartProdName: productsOnTheCart[index]["name"],
            cartProdColor: productsOnTheCart[index]["Color"],
            cartProdQty: productsOnTheCart[index]["quantity"],
            cartProdSize: productsOnTheCart[index]["size"],
            cartProdPrice: productsOnTheCart[index]["price"],
            cartProdPricture: productsOnTheCart[index]["picture"],
          );
        });
  }
}

class SingleCartProducts extends StatelessWidget {
  final cartProdName;
  final cartProdPricture;
  final cartProdColor;
  final cartProdPrice;
  final cartProdSize;
  final cartProdQty;

  const SingleCartProducts(
      {Key key,
      this.cartProdName,
      this.cartProdPricture,
      this.cartProdColor,
      this.cartProdPrice,
      this.cartProdSize,
      this.cartProdQty})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        /// LEADING SECTION
        leading: Image.asset(
          cartProdPricture,
          width: 100.0,
          height: 80.0,
        ),

        // TITLE SECTION
        title: Text(cartProdName),

        subtitle: Column(children: <Widget>[
          //row inside column
          Row(
            children: <Widget>[
              Text("Size:"),
              
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  cartProdSize,
                  style: TextStyle(color: Colors.red),
                ),
              ),

              /// This section for the product color
              Padding(
                padding:  EdgeInsets.all(4.0),
                child: Text("color"),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  cartProdColor,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),

          // This section is for the PRODUCT PRICE
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "\$${cartProdPrice}",
              style: TextStyle(
                // fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ]),
        // trailing: Column(children: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.arrow_drop_up),
        //     onPressed: null,
        //   ),
        // //  Text("$cartProdQty"),
        //   // IconButton(
        //   //   icon: Icon(Icons.arrow_drop_down),
        //   //   onPressed: null,
        //   // )
        // ]),
      ),
    );
  }
}
