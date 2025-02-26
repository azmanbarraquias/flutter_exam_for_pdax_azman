import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PersonDetailPage extends StatelessWidget {
  const PersonDetailPage({
    super.key,
    required this.name,
    required this.email,
    required this.image,
  });

  final String name;
  final String email;
  final String image;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Person detail"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: key.toString(),
                child: CachedNetworkImage(
                  cacheKey: key.toString(),
                  imageUrl: image,
                  placeholder: (ctx, url) => const CircularProgressIndicator(),
                  errorWidget: (ctx, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(height: 20),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(email),
            ],
          ),
        ),
      ),
    );
  }
}
