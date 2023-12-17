//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayOfStruct {
  struct Student {
    string name;
    uint8 age;
    uint8 class;
  }

  Student [] public students;
  /*
      - Creating Array of type struct
      - As it is public it will give getter method to fetch employee details
      - We cannot loop through all the elements of an Array, we can only fetch by index value
  */
  uint8 public totalStudents;

  function addStudent(Student memory _s1) public{
    /*
      - This syntax will not work in v5 (solidity ^0.5.0)
      - Because this type is only supported in the new experimental ABI encoder
      - Use "pragma experimental ABIEncoderV2;" to enable the feature in v5 (solidity ^0.5.0)
      - In v8, From remix we can pass it like: ["John Doe",21,3]
    */
    students.push(_s1);
  }

  function addStudent(string memory _name, uint8 _age, uint8 _class) public{
    /* Overriden method */
    Student memory std = Student(_name, _age, _class);
    /* 
      - As the value is of struct type, we are creating a local variable to pass to Array
      - Note that we don't need to add a new keyword here
    */
    students.push(std);
    ++totalStudents;
  }
}