//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
- In these contracts, we can understand difference between transfer and send methods

- Reference: https://ethereum-blockchain-developer.com/2022-04-smart-wallet/07-low-level-calls-in-depth/

** How to run below contract?

- Deploy the Sender contract
- fund the Sender contract with some 100 wei (hit transact to let it go to the receive function)
- Deploy the ReceiverNoAction and copy the contract address
- Send 10 wei to the ReceiverNoAction wiht withdrawTransfer. 
    It works, because the function receive in ReceiverNoAction doesn't 
    do anything and doesn't use up more than 2300 gas
- Send 10 wei to the ReceiverNoAction with withdrawSend. 
    It also works, because the function still does not need more than 2300 gas.
- Deploy the ReceiverAction Smart contract and copy the contract address
- Send 10 Wei to the ReceiverAction with withdrawTransfer. It fails, because the contract tries 
    to write a storage variable which costs too much gas.
- Send 10 Wei to the ReceiverAction with withdrawSend. The transaction doesn't fail, 
    but it also doesn't work, which leaves you now in an odd state. 👈🏻 That's the Problem right here.
*/

contract Sender {
  receive() external payable{}

  function debitViaTransfer(address payable _to) public{
    _to.transfer(10);
  }

  function debitViaSend(address payable _to) public{
    bool isSuccess = _to.send(10);
    require(isSuccess, "Sending Wei failed.");
  }
}

contract ReceiverNoAction {
  receive() external payable{
    /* Here after receiving Wei, we are not performing any action. */
  }

  function getBalance() view public returns(uint){
    return address(this).balance;
  }
}

contract ReceiverAction {
  uint public balanceReceived;
  receive() external payable{
    balanceReceived += msg.value;
    /*
     - Here we are performing some action after receiving wei
     - Here it will fail, because performing extra operations with receive cost gas
     - While performing extra operations with receive cost gas specially with first transaction
    */
  }

  function getBalance() view public returns(uint) {
    return address(this).balance;
  }
}