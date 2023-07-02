import 'package:flutter/material.dart';
import 'package:flutter_beginner/04_image_search_01/data/model/photo.dart';

class DetailScreen extends StatelessWidget {
  final Photo photo;

  DetailScreen({
    Key? key,
    required this.photo,
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
                backgroundImage: NetworkImage(photo.userImageURL),
              ),
              title: Text(photo.user),
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
                    Expanded(child: Text('${photo.likes}')),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: photo.id,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  photo.webformatURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Type: ${photo.type}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Tags: ${photo.tags}',
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
