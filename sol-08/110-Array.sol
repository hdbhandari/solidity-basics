//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyArray {
  string [] public names;

  function pushNameInArray(string memory _name) public{
    names.push(_name);
  }
}