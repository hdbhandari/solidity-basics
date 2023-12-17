//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyStruct {
  struct employee {
    string name;
    uint8 age;
    uint16 salary;
  }
  /* 
    - Custom data type struct 
    - It doesn't have a = sign
    - It doesn't have a semicolon
  */

  employee public newEmployee;
  /* Creating variable from Custom data type User(struct) */

  function addEmployee(string memory _name, uint8 _age, uint16 _salary) public{
    newEmployee.name = _name;
    newEmployee.age = _age;
    newEmployee.salary = _salary;
  }
}