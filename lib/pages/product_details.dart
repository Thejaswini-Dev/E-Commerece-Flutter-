
import 'package:fashionapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailNewPrice;
  final productDetailOldPrice;
  final productDetailPicture;

  const ProductDetails(
      {Key key,
      this.productDetailName,
      this.productDetailNewPrice,
      this.productDetailOldPrice,
      this.productDetailPicture})
      : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Text('FashApp'),
        ),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            color: Colors.black,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  widget.productDetailPicture,
                ),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.productDetailName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("\$${widget.productDetailOldPrice}",
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough)),
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.productDetailNewPrice}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// First Button
          Row(children: <Widget>[
            // ==== the size button ====
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Size"),
                          content: Text("Choose the size"),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Size"),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
            ), // ==== the Color button ====
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Color"),
                          content: Text("Choose the color"),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("close"),
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Color"),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
            ),
            // ==== the Qty button ====
            Expanded(
              child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Qty"),
                            content: Text("Choose the Qty"),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("close"),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Qty"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  )),
            )
          ]),

          /// Second Button
          Row(
            children: <Widget>[
              // ==== the size button ====
              Expanded(
                child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Buy now")),
              ),
              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.red,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {},
              )
            ],
          ),
          Divider(),
          ListTile(
              title: Text("Product details "),
              subtitle: Text(
                  "The red dress effect is a putative phenomenon in which people wearing red clothing, such as a red dress, are perceived to be more sexually appealing than they are when wearing other colours. In primates, a visual indicator of female fertility occurs by way of swelling during the follicular phase and is correlated with increased estrogen levels")),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.productDetailName),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product brand",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              //TODO REMBEMBER TO CREATE PRODUCT BRAND
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Brand X"),
              )
            ],
          ),
//  ADD THE PRODUCT CONDITION
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product condition",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("New"),
              )
            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Similar products"),
          ),
          // SIMILAR PRODUCTS SECTION
          Container(
            height: 360.0,
            // AT LAST LET IT  CHANGE TO PRODUCTS CLASS
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SimilarSingleProduct(
          prodName: productList[index]['name'],
          prodPricture: productList[index]['picture'],
          prodOldPrice: productList[index]['oldPrice'],
          prodPrice: productList[index]['price'],
        );
      },
    );
  }
}

class SimilarSingleProduct extends StatelessWidget {
  final prodName;
  final prodPricture;
  final prodOldPrice;
  final prodPrice;

  const SimilarSingleProduct(
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
          tag: Text("dress"),
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
