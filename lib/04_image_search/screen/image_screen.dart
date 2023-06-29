import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/image_view_model.dart';
import 'hero_screen.dart';
import '../model/image_model.dart';

class ImageScreen extends StatefulWidget {
  ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() => context.read<ImageViewModel>().fetchImageList());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageViewModel = context.watch<ImageViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('이미지 검색 앱'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              cursorColor: Colors.teal,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.teal, width: 1),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    String query = controller.text;
                    imageViewModel.searchImages(query);
                  },
                ),
                suffixIconColor: Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: imageViewModel.imageList.length,
              itemBuilder: (context, index) {
                ImageModel image = imageViewModel.imageList[index];
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HeroScreen(
                                  tag: '${imageViewModel.imageList[index].id},',
                                  image: '${image.webformatURL}',
                                  user:
                                      '${imageViewModel.imageList[index].user}',
                                  userImageURL:
                                      '${imageViewModel.imageList[index].userImageURL}',
                                  type:
                                      '${imageViewModel.imageList[index].type}',
                                  tags:
                                      '${imageViewModel.imageList[index].tags}',
                                  likes:
                                      '${imageViewModel.imageList[index].likes}',
                                )),
                      );
                    },
                    child: Hero(
                      tag: imageViewModel.imageList[index].id,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 4.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                            '${image.webformatURL}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
