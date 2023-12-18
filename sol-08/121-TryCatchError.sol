//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorThrow{
  function throwError() public pure {
    require(false, "Error is thrown and will be catched by Error object.");
    /* The require will throw Error type of error */
  }
}

contract TryCatch{
    event ErrorLog(string error);
    function catchError() public{
    ErrorThrow et = new ErrorThrow();
    try et.throwError(){
      /* Execute statements when no error thrown */
    }catch Error(string memory error){
      /* Errors thrown by require will be catched by Error object */
      emit ErrorLog(error);
    }
  }
}