import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/Posts.dart';

class GetRequest extends StatefulWidget {
  const GetRequest({super.key});

  @override
  State<GetRequest> createState() => _GetRequestState();
}

class _GetRequestState extends State<GetRequest> {
  Future<List<Posts>> getApiData() async {
    List<Posts> postsList = [];

    Response response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    // var data = response.body;

    if (response.statusCode == 200) {
      postsList.clear();
      var data = jsonDecode(response.body);
      print(data.runtimeType);

      // for( var element in data){
      //   Posts post = Posts.fromJson(element);
      //   print(post);
      //
      //
      // }

      // or

      for (var element in data) {
        Posts post = Posts.fromJson(element);
        print(post);
        postsList.add(post);
      }

      print(postsList);
      return postsList;
    } else {
      return postsList;
    }
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      body: Column(
        children: [
          // Expanded(
          //   child: FutureBuilder(future: getApiData(), builder: (context,snapshot){
          //     if(snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.none){
          //       return Center(child: CircularProgressIndicator(),);
          //     }
          //     if(!snapshot.hasData){
          //       return Center(child: CircularProgressIndicator(),);
          //     }
          //     if(snapshot.hasData){
          //       List<Posts> postList = snapshot.data!;
          //       return ListView.builder(itemCount: postList.length,itemBuilder: (context,index){
          //         Posts post = postList[index];
          //         return Container(
          //           child: Column(
          //             children: [
          //               Text(post.id.toString()),
          //               Text(post.userId.toString()),Text(post.title.toString()),Text(post.body.toString()),
          //             ],
          //           ),
          //         );
          //       });
          //     }
          //     return Container();
          //   }),
          // )

          //Using the streamBuilder:
          Expanded(
            child: StreamBuilder(
                stream: postsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    List<Posts> postList = snapshot.data!;
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          Posts post = postList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              elevation: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2)),
                                child: ListTile(
                                  title: Text(post.title.toString(),style: TextStyle(fontWeight: FontWeight.w700),),
                                  subtitle: Text(post.body.toString()),
                                )
                              ),
                            ),
                          );
                        });
                  }
                  return Container();
                }),
          )
        ],
      ),
    );
  }
}

Stream<List<Posts>> postsStream() async* {
  while (true) {
    List<Posts> postsList = [];

    try {
      Response response = await get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var element in data) {
          postsList.add(Posts.fromJson(element));
        }
        yield postsList;
      } else {
        // Handle non-200 status code
        print("Failed to fetch posts: ${response.statusCode}");
      }
    } catch (e) {
      // Handle network errors or JSON parsing errors
      print("Error fetching posts: $e");
    }

    // Wait for some time before fetching again
    await Future.delayed(Duration(seconds: 30));
  }
}

