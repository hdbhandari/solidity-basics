//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyEnums {
  enum subscriptionState {ACTIVE, INACTIVE, REJECTED}
  address public owner;
  subscriptionState public userSubscriptionStatus;
  uint public startTime;
  /* State updates can only be done, after starTime */

  constructor(){
    owner = msg.sender;
    userSubscriptionStatus = subscriptionState.INACTIVE;
    startTime = block.timestamp + 30;
    /*
      - Setting the start time to after 30 seconds 
      - We can also find it from here: https://www.epochconverter.com */
    */
  }

  modifier onlyOwner(){
    require(msg.sender==owner, "Sorry! Only owner is allowed to update subscription.");
    _;
  }

  modifier updateStateAfterTime(){
    int wait = int(startTime) - int(block.timestamp);
    require(block.timestamp >= startTime, "Please wait for few more seconds to start updating state.");
    _;
  }

  function setActive() public onlyOwner updateStateAfterTime{
    userSubscriptionStatus = subscriptionState.ACTIVE;
  }
  
  function setInactive() public updateStateAfterTime{
    userSubscriptionStatus = subscriptionState.INACTIVE;
  }

  function setRejected() public onlyOwner updateStateAfterTime{
    userSubscriptionStatus = subscriptionState.REJECTED;
  }
}