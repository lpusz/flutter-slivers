import 'package:equatable/equatable.dart';

class Story extends Equatable {
  final int id;
  final String author;
  final String imageUrl;

  const Story({
    required this.id,
    required this.imageUrl,
    this.author = 'Joe Doe',
  });

  @override
  List<Object?> get props => [id, author, imageUrl];
}
