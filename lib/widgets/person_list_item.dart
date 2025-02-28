import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PersonListItem extends StatelessWidget {
  const PersonListItem({
    super.key,
    required this.name,
    required this.email,
    required this.image,
    required this.onTap,
    required this.isFev,
    required this.fevTap,
  });

  final String name;
  final String email;
  final String image;
  final Function() onTap;
  final bool isFev;
  final Function() fevTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.inversePrimary.withAlpha(400),
      elevation: 2.5,
      key: ValueKey(key),
      margin: const EdgeInsets.all(10),
      child: ListTile(
        onTap: onTap,
        leading: Hero(
          tag: key.toString(),
          child: CachedNetworkImage(
            cacheKey: key.toString(),
            imageUrl: image,
            placeholder: (ctx, url) => const CircularProgressIndicator(),
            errorWidget: (ctx, url, error) => const Icon(Icons.error),
          ),
        ),
        trailing: GestureDetector(
          onTap: fevTap,
          child: Icon(
            isFev ? Icons.favorite : Icons.favorite_border,
            color: isFev ? Colors.red : Colors.grey,
          ),
        ),
        title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(email, maxLines: 2, overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
