import 'package:equatable/equatable.dart';

class Person extends Equatable {
  const Person(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

void main() {
  final person1 = Person("Asliddin");
  final person2 = Person("Asliddin");
  print(person1 == person2);
}
