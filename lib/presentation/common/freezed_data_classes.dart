import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class GetMoviesObject with _$GetMoviesObject {
  factory GetMoviesObject(int page, String type, bool isHasMoreMovies) =
      _GetMoviesObject;
}
