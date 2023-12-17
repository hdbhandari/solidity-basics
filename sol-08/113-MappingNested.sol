//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyMappingNested {
  mapping(uint => mapping (uint => bool)) demo;
  /* 
    - Intentionally not added public to demonstrate getter-setters
  */

  function setDemo(uint i, uint j, bool _val) public {
    demo[i][j]=_val;
  }

  function getDemo(uint i, uint j) public view returns (bool isVal){
    isVal = demo[i][j];
  }
}