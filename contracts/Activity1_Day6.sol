// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Activity1_Day6{
    //Fixed Array Practice

    uint[3] private favoriteNumbers = [1,2,3];

    function setNumber(uint index, uint number) external {
        require(index < favoriteNumbers.length, "Index out of bounds");
        favoriteNumbers[index] = number;
    }

    function getNumber(uint index) external view returns (uint) {
        require(index < favoriteNumbers.length, "Index out of bounds");
        return favoriteNumbers[index];
    }
}