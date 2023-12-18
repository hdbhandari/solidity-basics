// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Asserts {
  event moneyCredited(address _from, uint _amount, uint _newBalance);
  event moneyDebited(address _from, uint _amount, uint _remainingBalance);
  event notOwner(address _from, uint _amount);
  event insufficientFunds(address _from, uint _requestedAmount, uint _availableAmount);

  address public owner;
  
  constructor(){
    owner = msg.sender;
  }
  
  function depositeWei() public payable{
    assert(msg.value == uint8(msg.value));
    emit moneyCredited(msg.sender, msg.value, getSCBalance());
  }

  function withdrawWei(uint8 _amount) public{
    if(owner != msg.sender){
      emit notOwner(msg.sender, _amount);
    }
    if(getSCBalance() < _amount){
      emit insufficientFunds(msg.sender, _amount, getSCBalance());
    }
    payable(msg.sender).transfer(_amount);
    emit moneyDebited(msg.sender, _amount, getSCBalance());
  }

  function getSCBalance() private view returns(uint){
    return address(this).balance;
  }
}