import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app_nsbm/models/food_model.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('foods').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        List<Food> foods = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          
          return Food(
            name: data['name'],
            image: data['image'],
            time: data['time'],
            rate: data['rate'],
            review: data['review'],
            isLiked: data['isLiked'],
          );
        }).toList();

        // Build the UI using the Food items
        return ListView.builder(
          itemCount: foods.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(foods[index].name),
                subtitle: Text('Rating: ${foods[index].rate}'),
                leading: Image.asset(
                  foods[index]
                      .image, // Assuming foods[index].image contains the asset path
                  width: 50,
                  height: 50,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
