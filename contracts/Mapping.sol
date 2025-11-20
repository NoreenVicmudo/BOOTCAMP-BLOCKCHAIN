// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Mapping {
    mapping (uint => uint) public scores;

    function setScore(uint studentId, uint score) external {
        scores[studentId] = score;
    }

    function getScore(uint studentId) external view returns (uint) {
        return scores[studentId];
    }
}