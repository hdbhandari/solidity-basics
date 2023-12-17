//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyNumbers {
  int8 public n = int8(127);
  /*
    - int8 can take values between -2^8 to +(2^8)-1 which is -128 to +127
    - If we will go above 127, the value will be -128
    - If we will go below -128, the value will be 127
    - In version 0.8 the values won't be rounded and it will throw errror if we try to do so 
    - In version 0.8 it will throw error if we go less than 0 or greater than 255
  */

  function incrementN() public returns (int8 num){
    num = int8(n++);
  }
  function decrementN() public returns (int8 num){
    num = int8(n--);
  }

  int8 public m;
  function incrementM() public returns (int8 num){
    unchecked{
      num = int8(m++);
    }
    /* 
        In solidity 8.0, if we wants to get round off behaviour, 
        then we have to use "unchecked" block
    */
  }
  function decrementM() public returns (int8 num){
    unchecked{
      num = int8(m--);
    }
    /* 
        In solidity 8.0, if we wants to get round off behaviour, 
        then we have to use "unchecked" block
    */
  }
}