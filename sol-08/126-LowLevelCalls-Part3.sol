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

  function deposite() public payable{
    addressBalances[msg.sender] += msg.value;
  }
}

contract ContractTwo{
  function deposite() public payable{}

  function depositeOnContractOne(address _contractOne) public{
    bytes memory payload = abi.encodeWithSignature("deposit()");
    (bool success, ) = _contractOne.call{value: 10, gas: 100000}(payload);
    /* 
      - Unlike last contract in 125-LowLevelCalls-Part2.sol, here we don't know:
          > That the receiving contract is a contract
      - It is doing exactly same as last contract but with low level calls (_contractOne.call) 
          and therefore the typesafety is gone
      - We have to manually check if success returned true, otherwise there is no chance 
          we know if the called contract errored out
      - It will consume more gas then earlier version
      - But it can be even one level lower. Because, what if we don't even know the function at all
          That means, we would need to send the funds to the fallback receive function in ContractOne.
          This we will do in next contract.
    */
    require(success, "Couldn't Transfer amount.");
  }
}