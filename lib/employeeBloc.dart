import 'dart:async';
import 'employee.dart';

class EmployeeBloc{
  List <Employee> _employeeList = [
    Employee(1,"osama",10000),
    Employee(2,"ali",20000),
    Employee(3,"areeba",30000),
    Employee(4,"saima",40000),
    Employee(5,"hanif",50000),
  ];
  final _employeeListStreamController = StreamController<List<Employee>>();
  final _employeeSalaryIncreamentStreamContoller = StreamController<Employee>();
  final _employeeSalaryDeacrementStreamContoller = StreamController<Employee>();

  //getter;

Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;

StreamSink<Employee> get employeeSalaryIncreament => _employeeSalaryIncreamentStreamContoller.sink;

StreamSink<Employee> get employeeSalaryDecreament => _employeeSalaryDeacrementStreamContoller.sink;

EmployeeBloc(){
_employeeListStreamController.add(_employeeList);
_employeeSalaryIncreamentStreamContoller.stream.listen(_increamentSalary);
_employeeSalaryDeacrementStreamContoller.stream.listen(_deacrementSalary);
}

  _increamentSalary(Employee employee) {
  double salary = employee.salary;
  double increamentSalary = salary * 20/100;
  _employeeList[employee.id-1].salary =salary + increamentSalary;
  }
  _deacrementSalary(Employee employee){
    double salary = employee.salary;
    double decreamentSalary = salary * 20/100;
    _employeeList[employee.id -1].salary =salary - decreamentSalary;
  }

  void dispose(){
  _employeeSalaryDeacrementStreamContoller.close();
  _employeeListStreamController.close();
  _employeeSalaryIncreamentStreamContoller.close();

  }
}