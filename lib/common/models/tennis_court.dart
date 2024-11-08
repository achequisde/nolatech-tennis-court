import 'package:freezed_annotation/freezed_annotation.dart';

part 'tennis_court.freezed.dart';
part 'tennis_court.g.dart';

@freezed
class TennisCourt with _$TennisCourt {
  const factory TennisCourt({
    required String title,
    required String type,
    required double price,
    required String address,
  }) = _TennisCourt;
  factory TennisCourt.fromJson(Map<String, Object?> json) =>
      _$TennisCourtFromJson(json);
}
