// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract viewMutability {
    uint256 private firstNum = 10;

    function readFirstNum() public view  returns (uint256){
        return firstNum;
    }

    function readFirstNumTwo() public returns(uint256){
        firstNum = 100;
        return firstNum;
    }
}