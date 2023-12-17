//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyEnums {
  enum subscriptionState {ACTIVE, INACTIVE, REJECTED}
  /*
    - Declaration of an Enum data type named subscriptionState
    - It doesn't have a = sign
    - It doesn't have a semicolon
  */

  subscriptionState public userSubscriptionStatus;
  /* - Using the State type of custom data type(enum) below */

  function setActive() public {
    userSubscriptionStatus = subscriptionState.ACTIVE;
  }
  function setInactive() public {
    userSubscriptionStatus = subscriptionState.INACTIVE;
  }
  function setRejected() public {
    userSubscriptionStatus = subscriptionState.REJECTED;
  }
}