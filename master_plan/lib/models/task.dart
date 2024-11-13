class Task {
  final String name;
  final String description;
  bool isComplete; // Menghapus 'final' agar bisa diubah

  Task({
    required this.name,
    this.description = '',
    this.isComplete = false, // Nilai default untuk isComplete
  });
}