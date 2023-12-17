//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyByte {
  bytes private myUnicodeByte = unicode"Hello Wörld";
  /* 
    - In version 0.5, we don't need to pass unicode prefix
    - In version 0.8, we have to use unicode as prefix before the String like:
        bytes public myUnicodeByte = unicode"Hello Wörld";
    - unicode characters will take 2 bytes
    - Note that the visibility is specified as private
  */

  function getByteLength() public view returns(uint){
    return myUnicodeByte.length;
  }

  function getByteAndLength(bytes memory _b) public pure returns(uint byteLength, string memory byteToString){
    /* Note that this function is expecting 'byte' type of data */
    byteLength = _b.length;
    byteToString = string(abi.encodePacked(_b));
  }
  /* 
    - Note that this function is returning 2 values
    - we can declare the variables in returns params, and set those in function definition
  */
}