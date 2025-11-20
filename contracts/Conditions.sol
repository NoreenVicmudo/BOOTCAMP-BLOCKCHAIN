// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Conditions {

    function isLess(uint a, uint b) public pure returns (bool){
        return a < b;
    }

    function isGreater(uint a, uint b) public pure returns (bool){
        return a > b;
    }

    function isLessOrEqual(uint a, uint b) public pure returns (bool){
        return a <= b;
    }

    function isLessOrGreater(uint a, uint b) public pure returns (bool){
        return a >= b;
    }

    function isEqual(uint a, uint b) public pure returns (bool){
        return a == b;
    }

    function isNotEqual(uint a, uint b) public pure returns (bool){
        return a != b;
    }
}