class Workout {
  final List<SetModel> sets;
  final DateTime date;
  final String title;

  Workout({
    required this.sets,
    required this.date,
    required this.title,
  });

  Map<String, dynamic> toJson() => {
        'sets': sets.map((s) => s.toJson()).toList(),
        'date': date.toIso8601String(),
        'title': title,
      };

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        sets: (json['sets'] as List<dynamic>)
            .map((e) => SetModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        date: DateTime.parse(json['date'] as String),
        title: json['title'] as String,
      );
}

class SetModel {
  final String exercise;
  final double weight;
  final int reps;
  final String title;

  SetModel({
    required this.exercise,
    required this.weight,
    required this.reps,
    required this.title,
  });

  Map<String, dynamic> toJson() => {
        'exercise': exercise,
        'weight': weight,
        'reps': reps,
        'title': title,
      };

  factory SetModel.fromJson(Map<String, dynamic> json) => SetModel(
        exercise: json['exercise'] as String,
        weight: json['weight'] as double,
        reps: json['reps'] as int,
        title: json['title'] as String,
      );
}
