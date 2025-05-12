import 'package:flutter/material.dart';
import 'package:needai/providers/user_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<AddToFavourites>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body:
          favProvider.favourites.isEmpty
              ? const Center(child: Text('No favorites yet'))
              : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 1000,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text("${favProvider.favourites[index].title}"),
                      ],
                    ),
                  );
                },
              ),
    );
  }
}
