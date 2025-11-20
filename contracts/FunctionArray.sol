// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract FunctionArray {

    function arrayExample() public pure returns (uint) {
        uint[3] memory numbers = [uint(1),2,3];
        return numbers[0];


    }

    function arrayParameter(uint[] memory numbers, uint index) public pure returns (uint){
        return numbers[index];
    }

    function callDataFunction(uint[] calldata numbers, uint index) public pure returns (uint){
        return numbers[index];
    }
}