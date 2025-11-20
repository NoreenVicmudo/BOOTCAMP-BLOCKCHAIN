// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Payable {
    function deposit() external {}

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}