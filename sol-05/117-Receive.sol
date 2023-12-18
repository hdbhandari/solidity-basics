//SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract ReceiveEther {
  function() external payable{}
  /* 
    - Note that we have not used function keyword to define receive()
    - We need to enter the amout of wei and click on Transact in Remix
        After which this function will be called
        This will add the amount of wei to the balance of SC
    - Unlike receive() of version 0.6 and above, it will allow to send CALLDATA in Hexadecimal
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