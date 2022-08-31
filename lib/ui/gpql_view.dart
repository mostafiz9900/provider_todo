import 'package:flutter/material.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

class GpqlView extends StatefulWidget {
  const GpqlView({Key? key}) : super(key: key);

  @override
  State<GpqlView> createState() => _GpqlViewState();
}

class _GpqlViewState extends State<GpqlView> {
  bool _isLoading = false;
  List<dynamic> user = [];

  @override
  void initState() {
    super.initState();
    fatchData();
  }

  void fatchData() async {
    setState(() {
      _isLoading = true;
    });
    HttpLink link = HttpLink('https://rickandmortyapi.com/graphql');
    GraphQLClient clinet =
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore()));
    QueryResult queryResult = await clinet.query(QueryOptions(
        document: gql(
      """
          query{
            characters(page:1){
              results{
                name
                image
              }
            }
          }
      """,
    )));

    setState(() {
      print(queryResult.data!["characters"]["results"]);
      user = queryResult.data!["characters"]["results"];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                print(user[index]['image']);
                return ListTile(
                  leading: CircleAvatar(
                      child: Image(
                          image: NetworkImage('${user[index]['image']}'))),
                  title: Text('${user.elementAt(index)['name']}'),
                );
              },
            ),
    );
  }
}
