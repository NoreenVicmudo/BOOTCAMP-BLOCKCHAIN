// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract FirstContract {
    uint256 public number;

    function setNumber(uint256 num) external {
        number = num;
    }
}