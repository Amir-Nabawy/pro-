//
// Q1 - task_1

class Student {
  String? _name;
  int? _age;
  num? _grade;

  Student({String? name, int? age, num? grade}) {
    if (name != null && name.trim().isNotEmpty) {
      _name = name;
    } else {
      _name = '';
    }
    if (age != null && age >= 0) {
      _age = age;
    } else {
      _age = 0;
      print(' $age Error: Please enter your correct age ');
    }
    if (grade != null && grade >= 0 && grade <= 100) {
      _grade = grade;
    } else {
      _grade = 0;
      print(' $grade Error: Please enter your correct grade ');
    }
  }

  String? get name => _name;
  int? get age => _age;
  num? get grade => _grade;

  set name(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      _name = value;
    } else {
      print('Error');
    }
  }

  set age(int? value) {
    if (value != null && value >= 0) {
      _age = value;
    } else {
      print('Error');
    }
  }

  set grade(num? value) {
    if (value != null && value >= 0 && value <= 100) {
      _grade = value;
    } else {
      print('Error');
    }
  }
}

void main() {
  final List<Student> students = [
    Student(name: 'Amir', age: 19, grade: 95),
    Student(name: ' Aseel ', age: -11, grade: 1010),
  ];

  for (var student in students) {
    print(
      'Name : ${student.name} , Age: ${student.age}, Grade:  ${student.grade} ',
    );
  }
}
