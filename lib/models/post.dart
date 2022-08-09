import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String author;
  final String text;

  const Post({
    required this.id,
    this.author = 'Joe Doe',
    this.text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
        'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
  });

  @override
  List<Object?> get props => [id, author, text];
}
