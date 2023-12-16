//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Constructor {
  string public str;
  uint8 public unsignedInt;
  int8 public signedInt;
  bool public isBool;
  address public addr;

  constructor(string memory _str, uint8 _unsignedInt, int8 _signedInt, bool _isBool, address _addr) {
    str = _str;
    unsignedInt = _unsignedInt;
    signedInt = _signedInt;
    isBool = _isBool;
    addr = _addr;
  }
  /* 
   - This is parameterized contructor
   - memory keywork is required for string, struct and mapping types
   - At the time of deployment we need to pass values to deploy it
   - Try passing these: stringfromConsructor,100,-20,true,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 next to Deploy button in Remix
  */
}