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

//
 //
  // Q2  - task_2

class BankAccount {
  String? _accountHolder;
  num? _balance;

  BankAccount({String? accountHolder}) {
    if (accountHolder != null && accountHolder.trim().isNotEmpty) {
      _accountHolder = accountHolder;
    } else {
      _accountHolder = '';
    }
    _balance = 0.0;
  }

  String? get accountHolder => _accountHolder;
  num? get balance => _balance;
  set accountHolder(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      _accountHolder = value;
    } else {
      print('Error');
    }
  }

  set balance(num? value) {
    if (value != null && value >= 0) {
      _balance = value;
    } else {
      print('Error');
    }
  }

  void deposit(num amount) {
    if (amount > 0) {
      _balance = (_balance ?? 0) + amount;
      print(' ok deposit money $amount . balance $_balance');
      print('========================');
    } else {
      print('Error : dont doposit  money');
    }
  }

  void withdraw(num amount) {
    if (amount > 0 && amount <= (_balance ?? 0)) {
      _balance = (_balance ?? 0) - amount;
      print('ok withdraw money $amount . balance $_balance');
    } else {
      print('Error : dont withdraw money');
    }
  }
}

void main() {
  BankAccount myAcconunt = BankAccount(accountHolder: 'Amir');
  myAcconunt.deposit(1000);
  myAcconunt.withdraw(200);
}

 //
  //
   // Q3 - task_3

class Person {
  String? _name;
  int? _age;

  Person({String? name, int? age}) {
    if (name != null && name.trim().isNotEmpty) {
      _name = name;
    } else {
      _name = '';
    }
    if (age != null && age >= 0) {
      _age = age;
    } else {
      print(' $age  . Error : pleese your enter Age');
    }
  }
}

class Student extends Person {
  int? studentId;
  num? grade;

  Student({String? name, int? age, this.studentId, this.grade})
    : super(name: name, age: age);

  void displayInfo() {
    print('Student ID: $studentId  ');
    print('Name: $_name ');
    print('Age: $_age');
    print('Grade: $grade ');
  }
}

void main() {
  final student = Student(name: 'Amir', age: 19, studentId: 1001, grade: 95);

  student.displayInfo();
}

  //
   //
    // Q4  - task_4

abstract class Employee {
  String? name;
  int? employeeId;
  Employee({this.name, this.employeeId});

  num calculateSalary();
}

class FullTimeEmployee extends Employee {
  num? monthlySalary;
  FullTimeEmployee({String? name, int? employeeId, this.monthlySalary})
    : super(name: name, employeeId: employeeId);

  @override
  num calculateSalary() => monthlySalary ?? 0;
}

class PartTimeEmployee extends Employee {
  num? hourSalary;
  num? hourWork;
  PartTimeEmployee({
    String? name,
    int? employeeId,
    this.hourSalary,
    this.hourWork,
  }) : super(name: name, employeeId: employeeId);
  @override
  num calculateSalary() => (hourSalary ?? 0) * (hourWork ?? 0);
}

void main() {
  List<Employee> employees = [
    FullTimeEmployee(name: 'Amir', employeeId: 4, monthlySalary: 5250),
    PartTimeEmployee(
      name: 'Ahmed',
      employeeId: 5,
      hourSalary: 16,
      hourWork: 270,
    ),
  ];
  for (var employee in employees) {
    print(
      'Employee : ${employee.name} ,  Employee ID : ${employee.employeeId} ,Salary : ${employee.calculateSalary()} money',
    );
  }
}

 //
  //
   // Q5 - task_5

import 'dart:ffi';

import 'package:path/path.dart';

class LibraryItem {
  String? _id;
  String? _title;
  bool _isBorrowed = false;

  LibraryItem({String? id, String? title}) {
    if (id != null && id.trim().isNotEmpty) {
      _id = id;
    } else {
      _id = '';
    }
    if (title != null && title.trim().isNotEmpty) {
      _title = title;
    } else {
      _title = '';
    }
  }
  String? get id => _id;
  String? get title => _title;
  bool get isBorrowed => _isBorrowed;

  void borrowItem() {
    if (_isBorrowed) {
      print('Sorry $_title is already borrowed');
    } else {
      _isBorrowed = true;
      print('$_title  borrowed.');
    }
  }

  void returnItem() {
    if (!_isBorrowed) {
      print('Error: "$_title" was not borrowed ');
    } else {
      _isBorrowed = false;
      print('Success "$_title" returned');
    }
  }
}

class Book extends LibraryItem {
  String? author;

  Book({super.id, super.title, this.author});
}

class Magazine extends LibraryItem {
  int? issueNumber;
  Magazine({super.id, super.title, this.issueNumber});
}

class Member {
  List<LibraryItem> borrowedItems = [];

  void borrow(LibraryItem item) {
    if (borrowedItems.length >= 3) {
      print('Reached the maximum 3 items');
      return;
    }

    if (item.isBorrowed) {
      print('Sorry,  already borrowed');
      return;
    }

    item.borrowItem();
    borrowedItems.add(item);
    print(' successfully borrowed');
  }

  void returnItem(LibraryItem item) {
    if (!borrowedItems.contains(item)) {
      print('Error: not borrow ');
      return;
    }

    item.returnItem();
    borrowedItems.remove(item);
    print(' successfully returned');
  }
}

void main() {
  
  Book book1 = Book(id: '1', title: 'Englsh', author: 'Ahmed');
  Book book2 = Book(id: '2', title: 'Science', author: 'Mohamed');
  Magazine mag1 = Magazine(id: '3', title: 'AL-Msrey_ALyom', issueNumber: 45);
  Magazine mag2 = Magazine(id: '4', title: ' ALhaya', issueNumber: 12);

  Member member = Member();

  member.borrow(book1);
  print('OK Borrow 1 book ');
  print('');
  print('------------------------');
  member.borrow(book2);
  print('Ok borrow 2  books');
  print('');
  print('------------------------');
  member.borrow(mag1);
  print('Ok borrow 1  Magazine');
  print('');
  print('------------------------');
  member.borrow(mag2);
  print('--------------------------- ---');
  member.returnItem(book1);
  print('---------------- ---');
  member.borrow(mag2);
  print('---------------- ---');
  member.returnItem(mag1);
  print('---------------- ---');
  member.borrow(book2);
}
