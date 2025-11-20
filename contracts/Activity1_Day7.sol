// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
//SIMPLE LOGGER
contract Activity1_Day7 {
    event ActionPerformed(address user, string action);

    function logAction(string memory _action) external {
        emit ActionPerformed(msg.sender, _action);
    }
}