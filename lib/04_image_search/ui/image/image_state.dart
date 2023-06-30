import '../../model/image_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'image_state.freezed.dart';

part 'image_state.g.dart';

@freezed
class ImageState with _$ImageState {
  factory ImageState({@Default([]) List<ImageModel> imageList}) = _ImageState;

  factory ImageState.fromJson(Map<String, Object?> json) =>
      _$ImageStateFromJson(json);
}
