//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyFallback {
  receive() external payable{}
  /* 
    - If we pass CALLDATA along with Transact, then it will call fallback() else receive()
    - CALLDATA has to be in Hexadecimal format
  */
  fallback() external payable{}
  /* 
    - Note that we have not used function keyword to define either fallback()
    - If we pass Transact with Hexadecimal data, then fallback() will be called
    - If we don't pass any Hex data with Transact, receive() will be called
    - In version 0.6 and older:
        -> we had to use fallback function for the same functionality
        -> fallback function is a function without any name
    - It is available after solidity version 0.6
  */

  function getContractBalance() view public returns(uint){
    /* To get smart contract balance */
    return address(this).balance;
  }

  function getContractAddress() view public returns(address){
    /* To get smart contract address */
    return address(this);
  }  
}