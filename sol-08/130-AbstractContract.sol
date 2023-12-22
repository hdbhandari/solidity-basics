//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract AbstractContract {
  function helloAbsttract() public virtual pure returns(string memory){}
}

contract AbstractDemo is AbstractContract{
  function helloAbsttract() public pure override returns(string memory){
      return "Hello World!";
  }
}