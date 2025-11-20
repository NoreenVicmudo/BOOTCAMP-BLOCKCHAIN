// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Fixed {

    uint[3] public numbers = [uint (1), 2,3];

    function getValue(uint index) external view returns (uint) {
        require(index < numbers.length, "Index out of bounds");
        return numbers[index];
    }

    function setValue(uint index, uint value) external {
        require(index < numbers.length, "Index out of bounds");
        numbers[index] = value;
    }

    function getLength() external view returns (uint) {
        return numbers.length;
    }
}