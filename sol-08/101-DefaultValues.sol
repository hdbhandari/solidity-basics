//SPDX-License-Identifier: MIT
/* 
  - The The Software Package Data Exchange® (SPDX®) identifier is there to 
      communicate the license under which the Solidity file will be made available
  - is optional, but recommended
*/

pragma solidity ^0.8.0;
/*
  - pragma specifies the code compatibility with the compiler versions of the Solidity
  - It defines minimum and maximum version of the compiler that compiles our smart contract
  - ^0.8.0 defines that no earlier versions will be supported than 0.8.0 and no major version i.e. 0.9.0 will be supported
  - We can also use >= and <= etc operations to define range of versions
  - >=0.4.0 < 0.6.0 means that the contract can be compiled by any compiler versions between 0.4.0 and 0.6.0, (0.4.0 inclusive)
  - If we'd write it as pragma solidity ^0.8.0 it would mean >=0.8.0 and <0.9.0
*/

contract DefaultValues{
  /* 
    - contract key word marks the start of the smart contract 
  */
  string public str;
  uint public unsignedInt;
  int public signedInt;
  bool public isBool;
  address public addr;
  /* 
    - Above are storage variables
    - For public visibility variables, Solidity will automatically generate a getter function
    - Solidity don't have the concept of undefined or null
    - Values of these variables will be having 0, false or "" as default vaules
  */
}