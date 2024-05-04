class Comment {
  final int id;
  final String? author;
  final String text;
  final DateTime date;

  Comment(
      {required this.id, this.author, required this.text, required this.date});
}
