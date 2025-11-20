// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Activity_Day5 {
    //Temperature Checker
    function temperatureChecker(string memory scales, int256 temperature) public pure returns (string memory) {
        bytes32 scaleHash = keccak256(bytes(scales));

        if (scaleHash == keccak256(bytes("celsius")) || scaleHash == keccak256(bytes("Celsius"))) {
            if (temperature >= 100) return "Boiling Point";
            if (temperature <= 0) return "Freezing Point";
            return "Not Boiling or Freezing Point";
        } else if (scaleHash == keccak256(bytes("fahrenheit")) || scaleHash == keccak256(bytes("Fahrenheit"))) {
            if (temperature >= 212) return "Boiling Point";
            if (temperature <= 37) return "Freezing Point";
            return "Not Boiling or Freezing Point";
        } else {
            revert("Invalid option.");
        }
    }

    //Grade Evaluator
    function gradeEvaluator(uint grade) public pure returns (string memory){
        if (grade >= 90) return "A";
        if (grade >= 80) return "B";
        if (grade >= 70) return "C";
        return "F";
    }

    //Speed Checker
    function speedChecker(uint speed) public pure returns (string memory){
        if (speed > 100) return "Overspeeding";
        if (speed == 100) return "WARNING! Speed Limit!";
        return "Normal speed";
    }

    //Age-Based Access
    function ageChecker(uint age) public pure returns (string memory){
        if (age >= 18) return "Allowed";
        if (age >= 13) return "Required with Guardian";
        return "Not allowed";
    }

    //Sum 1 to N
    function allNumbers(uint number) public pure returns (uint sum){
        for (uint i = 1; i <= number ; i++){
            sum += i;
        } 
    }

    //Even Number Printer
    function evenNumbers(uint even) public pure returns (uint evenSum){
        evenSum = 0;
        for (uint i = 2; i <= even ; i+= 2){
            evenSum += i;
        } 
        return evenSum;
    }
}