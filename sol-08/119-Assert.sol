// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Asserts {
  mapping(address => uint8) public weiReceived;
  /* Here it will receive maximum of 255 wei in 1 transaction because of uint8 */
  mapping(address => mapping (address=> uint8)) public transferLogs;
  /*
    - This mapping will store, how many transaction a sender has made 
    - Here we need to pass 2 addresses to get the amount transferred
  */

  function depositeWei() public payable{
    assert(msg.value == uint8(msg.value));
    /* Here we are checking if after round of the values are same or not */
    weiReceived[msg.sender] = weiReceived[msg.sender] + uint8(msg.value);
  }

  function withdrawWei(uint8 _amount) public{
    // require(weiReceived[msg.sender] >= _amount, "Max that you can get, cann't be more then deposited.");
    assert(weiReceived[msg.sender] >= _amount);
    weiReceived[msg.sender] = weiReceived[msg.sender] - _amount;
    transferLogs[msg.sender][msg.sender] = _amount;
    /* We will firts deduct the amount to be withdrawn */
    payable(msg.sender).transfer(_amount);
  }

  function withdrawWeiIntoOtherAccount(address payable _to, uint8 _amount) public{
    assert(weiReceived[msg.sender] >= _amount);
    transferLogs[msg.sender][_to] = _amount;
    _to.transfer(_amount);
  }

  function getSCBalance() public view returns(uint){
    return address(this).balance;
  }

  function getSCAddress() public view returns(address){
    return address(this);
  }
}