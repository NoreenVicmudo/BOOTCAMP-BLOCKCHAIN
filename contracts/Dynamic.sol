// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Dynamic {
    uint [] public numbers;

    function addNumber (uint value) external {
        numbers.push(value);
    }

    function removeNumber() external {
        numbers.pop();
    }

    function setValue(uint index, uint value) external {
        require(index < numbers.length, "Index out of bounds");
        numbers[index] = value;
    }

    function getLength() external view returns (uint) {
        return numbers.length;
    }
}