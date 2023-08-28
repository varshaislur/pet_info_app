import 'package:flutter/material.dart';
import 'package:pet_info_app/users_pets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key,required this.usersPet});
  final Datum usersPet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar:AppBar(
        title:Text("About Pet"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,


      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(usersPet.petImage),
              ),
            ),
          ),
          SizedBox(height:20.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text("name of pet: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              Text(usersPet.petName,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
              ),),
            ],


          ),
          SizedBox(height:10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("amiability of the pet:  ",
              style:TextStyle(
                color:Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
              usersPet.isFriendly?Text("is friendly ",style:TextStyle(
                color:Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )):Text("is not Friendly ",style:TextStyle(
                color:Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              )),
              usersPet.isFriendly?Icon(Icons.thumb_up,color:Colors.green,):Icon(Icons.thumb_down,color: Colors.red,),
            ],
          ),
          SizedBox(height:20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name of the owner: ",
              style:TextStyle(
              color:Colors.white,
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              )),
              Text(usersPet.userName,
                  style:TextStyle(
                    color:Colors.white,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          )

        ],
      )

    );
  }
}
