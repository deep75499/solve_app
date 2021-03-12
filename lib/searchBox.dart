import 'package:flutter/material.dart';


// class SearchBoxAdmin extends StatefulWidget {
//   @override
//   _SearchBoxAdminState createState() => _SearchBoxAdminState();
// }

// class _SearchBoxAdminState extends State<SearchBoxAdmin> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title:Text(
//           'Search',
//         ),
//         actions: <Widget>[
//             IconButton(
//                 icon: Icon(
//                 Icons.search,
//                 color: Colors.white,
//               ),
//               onPressed: (){
//                 showSearch(context: context, delegate: Datasearch());
//               },
//             ),

//           ],
//         ),
//     );
//   }
// }

class Datasearch extends SearchDelegate<String>{
  final cities = [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",

  ];

  final recentCities =
  [
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat"
  ];


  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(icon: Icon(Icons.clear),
          onPressed: (){
            query = "";
          }
      ),
    ];

  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on the selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),

          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //recent serch facility code
    final suggestionList = query.isEmpty ? recentCities : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }

}
