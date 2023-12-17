//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyMapping {
  struct Employee {
    string name;
    uint8 age;
    uint salary;
  }

  mapping (uint => Employee) public employee;
  /* 
    - Creating a map of employeed
    - The map will be having key-value pairs
    - Key will be of type: uint
    - Value will be of type: Employee (struct)
    - We cannot loop over the map
  */

  uint public totalEmployees;
  /* It will store count of Employees, which will act as an index also */

  function addEmployee(Employee memory _e) public {
    increamentEmployee();
    employee[totalEmployees] = _e;
  }

  function addEmployee(string memory _name, uint8 _age, uint _salary) public {
    /* Overriden method */
    increamentEmployee();
    Employee memory e = Employee(_name, _age, _salary);
    employee[totalEmployees] = e;
  }

  function increamentEmployee() private{
    /* As it is an private function, can be called from within contract only */
    ++totalEmployees;
  }
}