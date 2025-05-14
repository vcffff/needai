import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:needai/presentation/themes/colors.dart';
import 'package:needai/providers/user_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<List<Color>> cardColors = [];

  @override
  void initState() {
    super.initState();
    _loadColors();
  }

  Future<void> _loadColors() async {
    final prefs = await SharedPreferences.getInstance();
    final favProvider = Provider.of<AddToFavourites>(context, listen: false);

    setState(() {
      cardColors = List.generate(favProvider.favourites.length, (index) {
        final startColorValue = prefs.getInt('startColor_$index');
        final endColorValue = prefs.getInt('endColor_$index');

        if (startColorValue != null && endColorValue != null) {
          return [Color(startColorValue), Color(endColorValue)];
        } else {
          final random = Random(index);
          final startColor = Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            0.8,
          );
          final endColor = Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            0.8,
          );
          prefs.setInt('startColor_$index', startColor.value);
          prefs.setInt('endColor_$index', endColor.value);
          return [startColor, endColor];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<AddToFavourites>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: bluecolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE3F2FD), Colors.white],
          ),
        ),
        child:
            favProvider.favourites.isEmpty
                ? const Center(
                  child: Text(
                    'No favorites yet',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    itemCount: favProvider.favourites.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          mainAxisExtent: 260,
                        ),
                    itemBuilder: (context, index) {
                      if (cardColors.length <= index) {
                        return const SizedBox.shrink();
                      }

                      final startColor = cardColors[index][0];
                      final endColor = cardColors[index][1];

                      return Card(
                        elevation: 8,
                        shadowColor: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [startColor, endColor],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${favProvider.favourites[index].title}",
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 50),
                                LinearProgressIndicator(
                                  value:
                                      favProvider.favourites[index].hours! / 24,
                                  backgroundColor: Colors.white.withOpacity(
                                    0.5,
                                  ),
                                  color: bluecolor,
                                  minHeight: 8,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                const SizedBox(height: 55),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Completed\n${favProvider.favourites[index].hours}/24',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        backgroundColor: bluecolor,
                                        radius: 22,
                                        child: const Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
      ),
    );
  }
}
