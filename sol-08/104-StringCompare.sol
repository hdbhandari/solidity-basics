//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyString {
  string public str1;
  string public str2;

  function setStr1(string memory _s1) public {
    str1 = _s1;
  }

  function setStr2(string memory _s2) public {
    str2 = _s2;
  }

  function compareString() public view returns(bool isSame) {
    isSame = keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2));
    /*
      - There are no native string comparison functions in Solidity
      - There is still a way to compare two strings: by comparing their keccak256 hashes
      - There is no way to calculate length of string as well in Solidity
    */
  }
}