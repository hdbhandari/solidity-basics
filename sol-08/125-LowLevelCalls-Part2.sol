//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/* 
  Reference: https://ethereum-blockchain-developer.com/2022-04-smart-wallet/07-low-level-calls-in-depth/

  How to run it?
  - Deploy contractOne
  - Deploy contractTwo
  - Deposite Some balance in ContractTwo
  - Copy contractOne address
  - Send amount to ContractOne from ContractTwo by this method: depositeOnContractOne()
  - Unlike 124-TransferVsSend, this time call is success because we are sending extra gas along with transaction
*/

contract ContractOne{
  mapping(address => uint) public addressBalance;

  function getBalance() public view returns(uint){
    return address(this).balance;
  }

  function deposite() public payable{
    addressBalance[msg.sender] += msg.value;
  }
}

contract contractTwo{
  function deposite() public payable {}

  function depositeOnContractOne(address _contractOne) public {
    ContractOne _cOne = ContractOne(_contractOne);
    _cOne.deposite{value: 10, gas: 100000}();
    /* 
      - Low level interaction
      - Here we are passing wei value as 10
      - Here we are passing 100000 gas, instead on default which is 2300
      - The extra gas which is not used in the transaction will be sent back
      - This logic will only work if we know:
          > That the receiving contract is a contract
          > And that the receiving contract has a specific function
    */
  }
}