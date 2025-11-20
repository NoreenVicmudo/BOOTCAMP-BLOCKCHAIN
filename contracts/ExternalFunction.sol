// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract ExternalFunction{
    function helloFunction() external pure returns (string memory) {
        return "HELLO EXTERNAL";
    }
/*
    function accessHello() public pure returns (string memory){
        return helloFunction();
    }*/
}