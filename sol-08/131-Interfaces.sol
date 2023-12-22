//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Token {
  function totalSupply() external pure returns(uint256);
}

contract Demo is Token{
  function totalSupply() public pure override returns(uint256){
    return 200;
  }
}