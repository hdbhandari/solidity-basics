//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Address {
  address public owner;
  address public otherAddr;
  /* It will store the owner of the contract */

  constructor(){
    owner = msg.sender;
    /* 
      - Initializing the owner by reading the message sender
      - message sender is the person who is deploying the smart contract
      - msg is the Global Object
    */
  }

  function getOwnerBalance() public view returns(uint){
    return owner.balance;
    /* It will return owner balance in wei */
  }

  function setOtherAddr(address _addr) public {
    otherAddr = _addr;
  }

  function getOtherAddrBalance() public view returns (uint){
    return otherAddr.balance;
  }
}