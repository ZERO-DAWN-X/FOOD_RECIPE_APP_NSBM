import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MealPlanApp());
}

class MealPlanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Plan Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MealPlanScreen(),
    );
  }
}

class Meal {
  final String name;
  final String imageUrl;

  Meal({required this.name, required this.imageUrl});
}

class MealService {
  static Future<List<Meal>> fetchMeals() async {
    final response = await http.get(Uri.parse('https://api.example.com/meals'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((json) => Meal(name: json['name'], imageUrl: json['imageUrl']))
          .toList();
    } else {
      throw Exception('Failed to fetch meals');
    }
  }
}

class MealPlanScreen extends StatefulWidget {
  @override
  _MealPlanScreenState createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends State<MealPlanScreen> {
  List<Meal> _meals = [];
  List<String> _selectedPreferences = [];

  @override
  void initState() {
    super.initState();
    _fetchMeals();
  }

  Future<void> _fetchMeals() async {
    try {
      final meals = await MealService.fetchMeals();
      setState(() {
        _meals = meals;
      });
    } catch (e) {
      print('Failed to fetch meals: $e');
      // Handle error
    }
  }

  void _togglePreference(String preference) {
    setState(() {
      if (_selectedPreferences.contains(preference)) {
        _selectedPreferences.remove(preference);
      } else {
        _selectedPreferences.add(preference);
      }
    });
  }

  List<Meal> _generateMealPlan() {
    // Implement logic to generate meal plan based on selected preferences
    // For demonstration, let's just return a random subset of meals
    return _meals.sublist(0, 3); // Change the logic as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Plan Generator'),
      ),
      body: _meals.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Select preferences:'),
                CheckboxListTile(
                  title: Text('Vegetarian'),
                  value: _selectedPreferences.contains('vegetarian'),
                  onChanged: (_) => _togglePreference('vegetarian'),
                ),
                CheckboxListTile(
                  title: Text('Vegan'),
                  value: _selectedPreferences.contains('vegan'),
                  onChanged: (_) => _togglePreference('vegan'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final mealPlan = _generateMealPlan();
                    // Show generated meal plan (you can implement this)
                  },
                  child: Text('Generate Meal Plan'),
                ),
                // Display generated meal plan (you can implement this)
              ],
            ),
    );
  }
}
