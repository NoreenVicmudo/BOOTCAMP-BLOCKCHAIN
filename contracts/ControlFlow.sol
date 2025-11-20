// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ControlFlow {
    function rewardPoints(uint purchases) public pure returns (uint points) {
        points = 0;

        if (purchases >= 5) {
            points += 100;
        }
    }
}