import 'dart:io';

// Define an interface
abstract class Employee {
  void displayInfo();
}

// Define a base class using inheritance
class Person {
  String name;
  int age;
  
  Person(this.name, this.age);
  
  void introduceYourself() {
    print('Hello, my name is $name and I am $age years old.');
  }
}

// Define a class that implements an interface and overrides an inherited method
class Manager extends Person implements Employee {
  String department;
  
  Manager(String name, int age, this.department) : super(name, age);
  
  @override
  void displayInfo() {
    print('Manager: $name, Department: $department');
  }
  
  // Method to demonstrate the use of a loop
  void holdMeetings() {
    for (int i = 0; i < 3; i++) {
      print('$name is holding meeting $i');
    }
  }
}

void main() {
  // Create an instance of Manager initialized with data from a file
  final manager = Manager.fromFile('manager_data.txt');
  
  // Demonstrate inheritance
  manager.introduceYourself();
  
  // Demonstrate interface implementation and method override
  manager.displayInfo();
  
  // Demonstrate loop
  manager.holdMeetings();
}

extension FileManager on Manager {
  static Manager fromFile(String filePath) {
    final file = File(filePath);
    final lines = file.readAsLinesSync();
    final name = lines[0].trim();
    final age = int.parse(lines[1].trim());
    final department = lines[2].trim();
    
    return Manager(name, age, department);
  }
}
