import '../../model/image_model.dart';

class ImageState {
  final List<ImageModel> imageList;
  ImageState({required this.imageList});

  ImageState copyWith({List<ImageModel>? imageList}) =>
      ImageState(imageList: imageList ?? []);
}
