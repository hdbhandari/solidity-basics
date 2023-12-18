//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
  Reference: https://ethereum-blockchain-developer.com/2022-04-smart-wallet/07-low-level-calls-in-depth/
*/

contract ContractOne{
  mapping(address => uint) public addressBalances;
  function getBalance() public view returns(uint){
    return address(this).balance;
  }

  receive() external payable{
    /* 
      - Now we removed deposite() function and added receive()
      - We did it because this is the default function which can work as deposite and
          other contract don't need to know it's name
    */
    addressBalances[msg.sender] += msg.value;
  }
}

contract ContractTwo{
  function deposite() public payable{}

  function depositeOnContractOne(address _contractOne) public{
    (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
    /* 
      - Unlike last contract in 125-LowLevelCalls-Part2.sol, here we don't know:
          > That the receiving contract is a contract
          > And that the receiving contract has a specific function
      - But What is changed?
          > Now we generically send 10 wei to the address _contractOne
          > This can be a smart contract or a wallet
          > If its a contract it will always call the fallback function
    */
    require(success, "Couldn't Transfer amount.");
  }
}