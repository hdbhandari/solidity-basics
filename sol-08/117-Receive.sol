//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReceiveEther {
  receive() external payable{}
  /* 
    - Note that we have not used function keyword to define receive()
    - It is available after solidity version 0.6
    - We need to enter the amout of wei and click on Transact in Remix
    - But it won't allow to send CALLDATA
    - If we need to have call data, we need to implement fallback()
    - After which this function will be called
    - This will add the amount of wei to the balance of SC
    - In version 0.6 and older:
        -> we had to use fallback function for the same functionality
        -> fallback function is a function without any name
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