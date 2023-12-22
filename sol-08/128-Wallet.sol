//SPDX-License-Identifier: MIT
/* 
  Requirements:

  1 - Wallet has 1 owner
  2 - Receive funds with a fallback function
  3 - Set a new owner with 3-out-of-5 guardians
  4 - Give allowance to other people
  5 - Spend money on EOA and Contracts
*/

pragma solidity ^0.8.0;

contract MyWallet{
  /* 1 - Wallet has 1 owner */
  address payable public owner;
  constructor() {
    owner = payable(msg.sender);
  }

  /* 2 - Receive funds with a fallback function */
  function getWalletBalance() public view returns(uint){
    return address(this).balance;
  }
  receive() external payable{}
  fallback() external payable{}

  /* 3 - Set a new owner with 3-out-of-5 guardians */
  struct Guardian {
    address votedFor;
    bool isGuardian;
  }
  mapping(address=> Guardian) public guardiansList;
  uint public registeredGuardiansCount;

  function setGuardian(address _guardianAddr, bool _isGuardian) public{
    require(owner == msg.sender, "Only owner can set Guardians for transfer funds, Aborting!");
    ++registeredGuardiansCount;
    Guardian memory guardian = Guardian(address(0), _isGuardian);
    guardian.isGuardian = _isGuardian;
    guardiansList[_guardianAddr] = guardian;
    if(!_isGuardian && registeredGuardiansCount>0){
        --registeredGuardiansCount;
    }
  }

  // Using this function, multiple Guardians can be added in one call
  // This is for testing purpose only
  function setMultiGuardians(address [] memory _guardianAddresses) public{
    for(uint8 i=0;i<_guardianAddresses.length;i++){
      // Setting _isGuardian to true for all
      setGuardian(_guardianAddresses[i], true);
    }
  }

  address payable newOwner;
  // Total number of required votes to update owner
  uint public constant totalVotesNeededForUpdatingOwner = 3;
  // Votes till now
  uint public ownerUpdateVoteCount;
  // Mapping to store address and how much vote received for this address to become owner
  mapping(address=>uint) public voteReceivedForNewOwner;
  
  function setNewOwner(address payable _newOwner) public{
    require(guardiansList[msg.sender].isGuardian, "You are not the Guardian, Abort!");
    require(guardiansList[msg.sender].votedFor==address(0), "You have already voted");
    require(owner!=_newOwner, "New owner cannot be same as the old owner.");

    // Incrementing vote counts till now with 1
    ownerUpdateVoteCount+=1;
    // Updating guardian's votedFor property
    guardiansList[msg.sender].votedFor=_newOwner;

    // Incrementing vote count of newOwner with 1
    voteReceivedForNewOwner[_newOwner] += 1;
    // If after new vote, the guardian is having suffuient number of votes to become owner
    if(voteReceivedForNewOwner[_newOwner]>=totalVotesNeededForUpdatingOwner){
        owner = _newOwner;
    }
  }

  /* 4 - Give allowance to other people */
  mapping(address => bool) public isAllowedToSend;
  mapping(address => uint) public allowance;
  function updateAllowance(address _for, uint _amount, bool _status) public{
    require(owner == msg.sender, "Only owner can update allowance for transfer funds, Aborting!");
    isAllowedToSend[_for] = _status;
    allowance[_for]=_amount;
  }

  /* 5 - Spend money on EOA and Contracts */
  function fundTransfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory returnedData){
    /* 
      - While calling the fundTransfer if it is an EOA(Externally Owned Account)
          then we can pass payload as 0x
      - While calling the fundTransfer if it is an Contract, then we need to pass input address(from Remix logs)
          to the _payload
    */
    if(owner!=msg.sender){
      require(isAllowedToSend[msg.sender], "You are not allowed to transfer funds.");
      require(allowance[msg.sender]>=_amount, "You don't have sufficient allowance to transfer");
      allowance[msg.sender] -= _amount;
    }

    (bool success, bytes memory returnData) = _to.call{value: _amount}(_payload);
    require(success, "Fund transfer failed, aborting the transaction.");
    return returnData;
  }
}

contract Consumer{
  function getBalance() public view returns(uint){
      return address(this).balance;
  }

  function deposite() external payable { }
  /* 
    If we will click on this function in Remix
      under the logs, we will find an address titled "Input"
      That address we need to pass as "payload"
  */
}