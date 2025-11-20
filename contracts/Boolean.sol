// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Boolean {

    bool public isActive;

    function activate () public {
        isActive = true;
    }

    function deactivate() public {
        isActive = false;
    }
}