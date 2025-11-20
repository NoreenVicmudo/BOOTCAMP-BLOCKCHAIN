// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Activity2_Day6 {
    //Dynamic Array Practice
    uint [] private scores;

    function addScore (uint value) external {
        scores.push(value);
    }

    function removeLast() external {
        scores.pop();
    }

    function getScore(uint index) external view returns (uint) {
        require(index < scores.length, "Index out of bounds");
        return scores[index];
    }

    function getTotalScores() external view returns (uint) {
        return scores.length;
    }
}