// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract LogicalOperators {
    function addExample(uint age, bool hasTicket) public pure returns (string memory){
        if (age >= 18 && hasTicket) { //Truety
            return "Entry Allowde";
        }

        return "Entry Denied";
    }

    function orExample(bool hasCoupon, bool isVip) public pure returns (string memory){
        if (hasCoupon || isVip){
            return "Discount replied";
        }

        return "No discount";
    }

    function notExample(bool paused) public pure returns (string memory){
        if(!paused){
            return "Action allowed";
        }
            return "Action blocked";
        
    }
}