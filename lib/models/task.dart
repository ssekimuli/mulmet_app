import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String title;
  final bool completed;
  final String userId;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    required this.completed,
    required this.userId,
    required this.createdAt,
  });

  factory Task.fromFirestore(Map<String, dynamic> data, String id) {
    return Task(
      id: id,
      title: data['title'] ?? '',
      completed: data['completed'] ?? false,
      userId: data['userId'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'completed': completed,
      'userId': userId,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}