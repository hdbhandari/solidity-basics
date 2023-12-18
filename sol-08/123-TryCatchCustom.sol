//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomThrow{
  error AnyCustomError(string);

  function throwCustom() public pure {
    revert AnyCustomError("This is how we can create a custom error with Message.");
  }
}

contract TryCatch{
    event ErrorLog(bytes lowLevelData);

    function catchPanic() public{
    CustomThrow ct = new CustomThrow();
    try ct.throwCustom(){
      /* Execute statements when no error thrown */
    }catch (bytes memory lowLevelData){
      /* Errors thrown by assert will be catched by Panic object */
      emit ErrorLog(lowLevelData);
      /* 
        - Low level data is not human readable
        - Low level data can be converted to actual message using web3
        - We can use the method "web3.utils.toAscii("--lowLevelData--")"
        - We need to remove some characters from generated lowlevel data to pass into web3(will check later)
      */
    }
  }
}