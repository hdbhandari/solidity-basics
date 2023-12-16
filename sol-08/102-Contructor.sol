//SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

contract Constructor {
  string public str;
  uint8 public unsignedInt;
  int8 public signedInt;
  bool public isBool;
  address public addr;

  constructor() public {
    str = "set str from contructor";
    unsignedInt = 100;
    signedInt = -20;
    isBool = true;
    addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    /* 
      - address takes 20 bytes for storage
      - Note that it is not enclosed with double quotes
    */
  }
  /*
    - Only one constructor is allowed per contract
    - means overloading is not supported
    - [Sol-version-^0.5.0] A constructor has to be set with either public or internal visibility
    - [Sol-version-^0.8.0] The constructor visibility has been removed from Solidity
    - If we want the contract to be non-deployable, make it "abstract"
  */
}