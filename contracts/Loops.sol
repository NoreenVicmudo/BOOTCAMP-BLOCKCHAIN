// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Loops {
    function sumFor(uint n) public pure returns (uint sum){
        for (uint i = 1; i <= n ; i++){
            sum++;
        }
    }

    function countWhile (uint n) public pure returns (uint count){
        uint i = 0;
        while (i < n){
            count++;
            i++;
        }
    }

    function runOnce() public pure returns (uint sum){
        do {
            sum++;
        } while (false);
    }
}