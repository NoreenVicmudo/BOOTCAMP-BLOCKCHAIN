// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract LivingBeing {
    function breath() public pure returns (string memory){
        return "I AM BREATHING";
    }
}

contract Animal is LivingBeing {
    function eat() public pure returns (string memory){
        return "Eating...";
    }
}

contract Dog is Animal{
    function bark() public pure returns (string memory){
        return "Woof";
    }
}