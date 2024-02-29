import 'package:flutter/material.dart';

// refer flutter documentation: Place a floating app bar above a list

class SliversBasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView.
        body: CustomScrollView(slivers: [
      // Add the app bar to the CustomScrollView.
      SliverAppBar(
        // Provide a standard title.
        title: Center(
            child: Text("Floating App Bar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700))),
        floating: true,
        expandedHeight: 120,
        backgroundColor: Colors.lightGreenAccent,
        // Display a placeholder widget to visualize the shrinking size.
        flexibleSpace: FlexibleSpaceBar(
            background: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.bottomCenter,
              //   end: Alignment.center,
              //   colors: <Color>[
              //     Colors.greenAccent!,
              //     Colors.transparent,
              //   ],
              // ),
              ),
          child: Image.network(
            "https://images.pexels.com/photos/2888333/pexels-photo-2888333.jpeg?auto=compress&cs=tinysrgb&w=600",
            fit: BoxFit.cover,
          ),
        )),
      ),
      // flexibleSpace: FlexibleSpaceBar(
      //   //title: Text("Floating Area"),
      //   background: Image.network(
      //       "https://images.pexels.com/photos/534164/pexels-photo-534164.jpeg?auto=compress&cs=tinysrgb&w=600"),
      //   // fit: BoxFit.cover,
      // )),
      SliverList(
        // Use a delegate to build items as they're scrolled on screen.
        delegate: SliverChildBuilderDelegate(
          // The builder function returns a ListTile with a title that
          // displays the index of the current item.
          (context, index) => ListTile(title: Text('Item #$index')),
          // Builds 1000 ListTiles
          childCount: 1000,
        ),
      ),
    ]));
    // Next, create a SliverList
  }
}
