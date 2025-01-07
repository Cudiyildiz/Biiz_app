// Temel kullanıcı modeli
class UserModel {
  final String uid;
  final String email;
  final String role;
  final String name;
  final String surname;
  final String profilPictures;
  final String createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.role,
    required this.name,
    required this.surname,
    required this.profilPictures,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      role: map['role'],
      name: map['name'],
      surname: map["surname"],
      profilPictures: map['profilPictures'],
      createdAt: map['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'role': role,
      'name': name,
      'surname': surname,
      'profilPictures': profilPictures,
      'createdAt': createdAt,
    };
  }
}

// Öğrenci modeli
class StudentModel extends UserModel {
  final List<String> joinedCourses;

  StudentModel({
    required String uid,
    required String email,
    required String role,
    required String name,
    required String surname,
    required String profilPictures,
    required String createdAt,
    required this.joinedCourses,
  }) : super(
    uid: uid,
    email: email,
    role: role,
    name: name,
    surname: surname,
    profilPictures: profilPictures,
    createdAt: createdAt,
  );

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      uid: map['uid'],
      email: map['email'],
      role: map['role'],
      name: map['name'],
      surname: map["surname"],
      profilPictures: map['profilPictures'],
      joinedCourses: List<String>.from(map['joinedCourses']),
      createdAt: map['createdAt'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final baseMap = super.toMap();
    baseMap['joinedCourses'] = joinedCourses;
    return baseMap;
  }
}

// Eğitmen modeli
class InstructorModel extends UserModel {
  final List<String> createdCourses;
  final String biography; // Eğitmen özgeçmişi

  InstructorModel({
    required String uid,
    required String email,
    required String role,
    required String name,
    required String surname,
    required this.biography,
    required String profilPictures,
    required String createdAt,
    required this.createdCourses,
  }) : super(
    uid: uid,
    email: email,
    role: role,
    name: name,
    surname: surname,
    profilPictures: profilPictures,
    createdAt: createdAt,
  );

  factory InstructorModel.fromMap(Map<String, dynamic> map) {
    return InstructorModel(
      uid: map['uid'],
      email: map['email'],
      role: map['role'],
      name: map['name'],
      surname: map['surname'],
      profilPictures: map['profilPictures'],
      createdAt: map['createdAt'],
      biography: map['biography'],
      createdCourses: List<String>.from(map['createdCourses'] ?? []),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final baseMap = super.toMap();
    baseMap['createdCourses'] = createdCourses;
    baseMap['biography'] = biography;
    return baseMap;
  }
}

// Kullanıcı rolüne göre doğru modeli seçen fonksiyon
UserModel createUserFromMap(Map<String, dynamic> map) {
  String role = map['role'];
  if (role == 'student') {
    return StudentModel.fromMap(map);
  } else if (role == 'instructor') {
    return InstructorModel.fromMap(map);
  } else {
    return UserModel.fromMap(map);
  }
}
