
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fashionapp/components/horizontal.dart';
import 'package:fashionapp/components/products.dart';
import 'package:fashionapp/pages/cart.dart';
import 'package:fashionapp/pages/login.dart';
import 'package:fashionapp/provider.dart/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);
    Widget image_carousel = Container(
        height: 200,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('images/c1.jpg'),
            AssetImage('images/m1.jpeg'),
            AssetImage('images/w1.jpeg'),
            AssetImage('images/w3.jpeg'),
            AssetImage('images/m2.jpg'),
          ],
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 4.0,
          indicatorBgPadding: 2.0,
          dotColor: Colors.transparent,
        ));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text('FashApp'),
        backgroundColor: Colors.red,

        
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(children: <Widget>[
        //header
        UserAccountsDrawerHeader(
          accountName: Text('Thejaswini'),
          accountEmail: Text('thejaswini.s89@gmail.com'),
          currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white))),
          decoration: BoxDecoration(color: Colors.red),
        ),
        //body
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Home Page'),
            leading: Icon(Icons.home),
          ),
        ),

        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('My account'),
            leading: Icon(
              Icons.person,
              color: Colors.red,
            ),
          ),
        ),

        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('My Orders'),
            leading: Icon(
              Icons.shopping_basket,
              color: Colors.red,
            ),
          ),
        ),

        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(),
              ),
            );
          },
          child: ListTile(
            title: Text('Shopping cart'),
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.red,
            ),
          ),
        ),

        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Favourites'),
            leading: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ),

        Divider(),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Settings'),
            leading: Icon(
              Icons.settings,
            ),
          ),
        ),

        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('About'),
            leading: Icon(
              Icons.help,
            ),
          ),
        ),

         InkWell(
          onTap: () {
           user.signOut();
          },
          child: ListTile(
            title: Text('Logout'),
            leading: Icon(
              Icons.help,
            ),
          ),
        )
      ])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //image carousel begins here
          image_carousel,
          //padding Widget
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Categories"),
          ),

          //Horizontal list view begins here
          HorizontalList(),

          //Recent product
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text("Recent products"),
          ),

          //grid view
          Flexible(child: Products())
        ],
      ),
    );
  }
}
