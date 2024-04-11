import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item {
  final String name;
  final String image;

  Item({
    required this.name,
    required this.image,
  });
}

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Item> itemList = List.generate(
    4,
    (index) => Item(
      name: 'Item ${index + 1}',
      image: 'assets/images/banner1.png',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 61, 0, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Color.fromRGBO(255, 61, 0, 1),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Material(
                color: Colors.white, // button color
                child: InkWell(
                  splashColor: Colors.grey, // splash color
                  onTap: () {
                    Navigator.of(context).pop();
                  }, // button pressed
                  child: SizedBox(
                      width: 32,
                      height: 32,
                      child:
                          Icon(Icons.arrow_back, color: Colors.black)), // icon
                ),
              ),
            ),
          ),
          title: const Text('Favourite'),
        ),
      ),
      body: itemList.isEmpty
          ? Center(
              child: Text(
                'No favorites found',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final item = itemList[index];
                return Dismissible(
                  key: Key(item.name),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20.0),
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      itemList.removeAt(index);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 11),
                    child: Container(
                      height: 97,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(230, 230, 230, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                item.image,
                                width: 141,
                                height: 77,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 13),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/avatar.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 6),
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(217, 217, 217, 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 1),
                                          child: Text(
                                            'Venuja Vethmin',
                                            style: TextStyle(
                                                fontSize: 8,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Chicken Saled',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/time.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                      const SizedBox(width: 6),
                                      const Text(
                                        '13 min',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  itemList.removeAt(index);
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Icon(Icons.delete),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
