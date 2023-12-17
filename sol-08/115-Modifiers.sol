//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyEnums {
  enum subscriptionState {ACTIVE, INACTIVE, REJECTED}
  address public owner;

  subscriptionState public userSubscriptionStatus;

  constructor(){
    owner = msg.sender;
    userSubscriptionStatus = subscriptionState.INACTIVE;
  }
  modifier onlyOwner(){
    require(msg.sender==owner, "Sorry! Only owner is allowed to update subscription.");
    /*
      - Creating modifer to allow only owner to update subscription state
      - require will take first argument as condition
          and second as Error Message
    */
    _;
    /* It is replaced by rest of the statements  */
  }

  function setActive() public onlyOwner{
    userSubscriptionStatus = subscriptionState.ACTIVE;
  }
  
  function setInactive() public {
    userSubscriptionStatus = subscriptionState.INACTIVE;
  }

  function setRejected() public onlyOwner{
    userSubscriptionStatus = subscriptionState.REJECTED;
  }
}