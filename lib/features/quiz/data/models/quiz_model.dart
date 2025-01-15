import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

@freezed
class QuizModel with _$QuizModel {
  const factory QuizModel({
    required int id,
    required String question,
    required List<String> options,
    required int correctOptionIndex,
    String? explanation,
    String? imageUrl,
  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);
}