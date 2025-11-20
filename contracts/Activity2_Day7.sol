// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
// VOTING TRACKER
contract Activity2_Day7 {
    event VoteCasted(address indexed voter, uint proposalId, bool choice);

    function vote(uint _proposalId, bool _choice) external {
        emit VoteCasted(msg.sender, _proposalId, _choice);
    }
}