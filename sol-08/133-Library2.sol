//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Math {
// 1. Create a math library named Math and create a function named add that accepts two uin256 arguments 
// and returns their addition.
  function add(uint256 _a, uint256 _b) public pure returns(uint256){
      return _a + _b;
  }
}
// 2. Create a contract named Addition and add an earlier created Math Library in it.
// 3. Create a function named Add that will add two arguments and use add function from the math library to add these arguments.
contract Addition {
  function Add(uint256 _a, uint256 _b) public pure returns(uint256){
      return Math.add(_a, _b);
  }
}