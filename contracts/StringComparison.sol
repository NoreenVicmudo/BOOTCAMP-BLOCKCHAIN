// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract StringComparison {

    function dayPlan(string memory today) public pure returns (string memory) {

        if (keccak256(abi.encode(today)) == keccak256(abi.encode("Monday"))) {
            return "Monday, it's workday";
        } else {
            return "It's not Monday";
        }
    }
}