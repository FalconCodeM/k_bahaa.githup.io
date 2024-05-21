class Pod {
  final String wrongTouch;
  final String rightTouch;
  final String averageReactionTime;

  Pod({
    required this.wrongTouch,
    required this.rightTouch,
    required this.averageReactionTime,
  });

  // Factory constructor to create a Pod from JSON
  factory Pod.fromJson(Map<String, dynamic> json) {
    return Pod(
      wrongTouch: json['wrong_touch'],
      rightTouch: json['right_touch'],
      averageReactionTime: json['average_reaction_time'],
    );
  }

  // Method to convert a Pod to JSON
  Map<String, dynamic> toJson() {
    return {
      'wrong_touch': wrongTouch,
      'right_touch': rightTouch,
      'average_reaction_time': averageReactionTime,
    };
  }

  // copyWith method
  Pod copyWith({
    String? wrongTouch,
    String? rightTouch,
    String? averageReactionTime,
  }) {
    return Pod(
      wrongTouch: wrongTouch ?? this.wrongTouch,
      rightTouch: rightTouch ?? this.rightTouch,
      averageReactionTime: averageReactionTime ?? this.averageReactionTime,
    );
  }
}
