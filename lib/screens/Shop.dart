import 'package:flutter/material.dart';

class FoodIngredientsBuyPage extends StatefulWidget {
  @override
  _FoodIngredientsBuyPageState createState() => _FoodIngredientsBuyPageState();
}

class _FoodIngredientsBuyPageState extends State<FoodIngredientsBuyPage> {
  Cart cart = Cart();

  List<FoodItem> foodItems = [
    FoodItem(name: 'Banana', description: 'Description', price: 15),
    FoodItem(name: 'Mango', description: 'Description', price: 15),
    FoodItem(name: 'Lemon', description: 'Description', price: 15),
    FoodItem(name: 'Apple', description: 'Description', price: 15),
    FoodItem(name: 'Orange', description: 'Description', price: 15),
    FoodItem(name: 'Pineapple', description: 'Description', price: 15),
    FoodItem(name: 'Grapes', description: 'Description', price: 15),
    FoodItem(name: 'Strawberry', description: 'Description', price: 15),
    FoodItem(name: 'Watermelon', description: 'Description', price: 15),
    FoodItem(name: 'Papaya', description: 'Description', price: 15),
    FoodItem(name: 'Guava', description: 'Description', price: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Banner
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 150,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner4.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Services
              Text(
                'Services',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Deliver Shops Foods',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16.0),
              // Recommended for you
              Text(
                'Recommended for you',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              // Food Items
              Column(
                children: foodItems.map((foodItem) {
                  return buildFoodItem(foodItem);
                }).toList(),
              ),
              SizedBox(height: 16.0),
              // Cart
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cart (${cart.items.length})',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(cart: cart),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFoodItem(FoodItem foodItem) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodItem.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                foodItem.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          Text(
            '\$${foodItem.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green[600],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  addToCart(foodItem);
                },
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  removeFromCart(foodItem);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void addToCart(FoodItem foodItem) {
    setState(() {
      cart.addItem(foodItem);
    });
  }

  void removeFromCart(FoodItem foodItem) {
    setState(() {
      cart.removeItem(foodItem);
    });
  }
}

class FoodItem {
  final String name;
  final String description;
  final double price;

  FoodItem({
    required this.name,
    required this.description,
    required this.price,
  });
}

class Cart {
  List<FoodItem> items = [];

  void addItem(FoodItem item) {
    items.add(item);
  }

  void removeItem(FoodItem item) {
    items.remove(item);
  }
}

class CartPage extends StatelessWidget {
  final Cart cart;

  CartPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(cart.items[index].name),
            subtitle: Text('\$${cart.items[index].price.toString()}'),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                cart.removeItem(cart.items[index]);
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
