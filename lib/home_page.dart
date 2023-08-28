import 'dart:io';
import 'dart:js';
import 'package:pet_info_app/details_page.dart';
import 'package:flutter/material.dart';
import 'package:pet_info_app/users_pets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
late UsersPets usersPets;
 bool isDataLoaded=false ;
String errorMsg='';

//Api call
  Future<UsersPets> getDataFromAPI() async{
    Uri uri=Uri.parse('https://jatinderji.github.io/users_pets_api/users_pets.json');
    var response = await http.get(uri);
    if(response.statusCode == 200)
      {
      UsersPets usersPets = usersPetsFromJson(response.body);
      setState(() {
        isDataLoaded=true;
      });
       return usersPets;
      }
    else
      {
        errorMsg='${response.statusCode}:${response.body}';
        return UsersPets(data: []);
      }


  }
  assignData() async
  {
    usersPets=await getDataFromAPI();

  }

  @override
  void initState() {
    // TODO: implement initState
    assignData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
        appBar: AppBar(
          title: Text('Pet info page'),
          centerTitle: true,
        ),
        body: !isDataLoaded ? const Center(child: Text("not loaded"),) :
        errorMsg.isNotEmpty ? Center(child: Text(errorMsg)) : usersPets.data
            .isEmpty ? Center(child: Text('no data'),) :
        ListView.builder(
          itemCount: usersPets.data.length,
          itemBuilder: (context, index) =>
              Card(


                child: Container(
                  color: Colors.black87,
                  child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage(usersPet: usersPets.data[index]),
                        ));
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            usersPets.data[index].petImage),
                      ),
                      trailing: Icon(usersPets.data[index].isFriendly
                          ? (Icons.thumb_up)
                          : (Icons.thumb_down),
                        color: usersPets.data[index].isFriendly
                            ? (Colors.green)
                            : (Colors.red),),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(usersPets.data[index].userName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),

                          Row(
                            children: [
                              Text("Dog name: ",
                              style: TextStyle(
                                color: Colors.white,
                              ),),
                              Text(usersPets.data[index].petName,
                              style: TextStyle(
                                color: Colors.white,
                              ),),
                            ],
                          ),


                        ],
                      )),
                ),

              ),
        )
    );
  }
  }

