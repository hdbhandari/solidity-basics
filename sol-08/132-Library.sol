//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Reference: https://dapp-world.com/course/introduction-to-solidity-Ynws/abstract-contracts-interfaces-libraries/lesson */

library Math{
    function add(uint256 a, uint256 b) internal pure returns(uint256){
        return a + b;
    }
}

contract DemoLibrary {
    using Math for uint;

    function addValues(uint256 _a, uint256 _b) public pure returns(uint256){
        uint256 x = _a.add(_b);
        return x;
    }
}