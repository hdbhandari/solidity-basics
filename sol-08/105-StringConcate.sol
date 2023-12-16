//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringConcate {
  string public str1;
  string public str2;

  function setStr1(string memory _s1) public {
    str1 = _s1;
  }

  function setStr2(string memory _s2) public {
    str2 = _s2;
  }

  function concate() public view returns(string memory concatinetedString){
    bytes memory b1 = bytes(str1);
    bytes memory b2 = bytes(str2);
    bytes memory concatinetedBytes = new bytes(b1.length + b2.length);
 
    for(uint i=0; i<b1.length; i++){
        concatinetedBytes[i] = b1[i];
    }
    for(uint i=0; i<b2.length; i++){
        concatinetedBytes[b1.length + i] = b2[i];
    }
    concatinetedString = string(concatinetedBytes);
  }
}