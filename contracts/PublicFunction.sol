// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract PublicFunction {
    function greet() public pure returns (string memory) {
        return "Hello Blockchain";
    }

    function otherFunction() public pure returns (string memory) {
        return greet();
    }
}