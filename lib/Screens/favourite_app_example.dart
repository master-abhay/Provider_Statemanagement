import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Providers/favourite_app_provider.dart';

class FavouriteApp extends StatefulWidget {
  const FavouriteApp({super.key});

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  // List<int> indexList = [];
  @override
  Widget build(BuildContext context) {
    // final listProvider = Provider.of<FavouriteAppProvider>(context);

    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          color: Colors.yellow,
                          child: Consumer<FavouriteAppProvider>(
                              builder: (context, value, Widget? child) =>
                                  ListTile(
                                    onTap: () {
                                      value.listOfFavouriteIndexes
                                              .contains(index)
                                          ? value.removeFavourite(index)
                                          : value.addFavourite(index);
                                      print(
                                          "favourite item list: ${value.listOfFavouriteIndexes}");
                                    },
                                    trailing: value.listOfFavouriteIndexes
                                            .contains(index)
                                        ? Icon(Icons.favorite)
                                        : Icon(Icons.favorite_outline),
                                    style: ListTileStyle.list,
                                    title: Text("Tile"),
                                  )),
                        ),
                      );
                    }),
              ),
             const  SizedBox(
                height: 100,
              ),
               Container(
                height: 300,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (builder, context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 3,
                          color: Colors.green,
                          child: ListTile(
                            style: ListTileStyle.list,
                            title: Text("Tile"),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
