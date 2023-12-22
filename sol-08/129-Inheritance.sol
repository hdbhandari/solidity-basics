//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
  uint public myANum = 10;
  /* 
  * virtual keyword will allow this function to be overridden in the child contract
  */
  function setANum() public virtual{
      myANum = 30;
  }
}

contract B is A {
  uint public myBNum;
  constructor(uint _num){
      myBNum = _num;
  }
}

/* 
  * Inheriting contracts A and B
  * We need to pass contructor argument with contract name
*/
contract C is A, B(5) {
  /* 
    * overriding the function
  */
  function setANum() public override{
      myANum = 40;
  }
}