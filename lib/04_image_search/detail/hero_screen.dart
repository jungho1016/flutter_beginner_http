import 'package:flutter/material.dart';

import '../model/image_model.dart';

class DetailScreen extends StatelessWidget {
  final ImageModel image;

  DetailScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 이미지'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(image.userImageURL),
              ),
              title: Text(image.user),
              trailing: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                    Expanded(child: Text('${image.likes}')),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: image.tags,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  image.webformatURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Type: ${image.type}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Tags: ${image.tags}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// tag: '${image.id},',
// image: '${image.webformatURL}',
// user: '${image.user}',
// userImageURL: '${image.userImageURL}',
// type: '${image.type}',
// tags: '${image.tags}',
// likes: '${image.likes}',
