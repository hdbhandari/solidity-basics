//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PanicThrow{
  function throwAssert() public pure {
    assert(false);
    /* The assert will throw Panic type of error */
  }
}

contract TryCatch{
    event ErrorLog(uint errorCode);
    function catchPanic() public{
    PanicThrow pt = new PanicThrow();
    try pt.throwAssert(){
      /* Execute statements when no error thrown */
    }catch Panic(uint errorCode){
      /* Errors thrown by assert will be catched by Panic object */
      emit ErrorLog(errorCode);
    }
  }
}