// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Activity_Day4 {
    // 1. Celsius to Fahrenheit
    function convertTemperature(uint256 celsius) public pure returns (uint256) {
        return (celsius * 18) / 10 + 32; //formula 	(0°C × 9/5) + 32 = 32°F
    }

    // 2. Hours to seconds
    function convertTime(uint hour) public pure returns (uint) {
        return (hour * 60 * 60); //formula 60 × 60 = 3600 
    }

    // 3. Average of 3 numbers
    function computeAverage(uint fnum, uint snum, uint tnum) public pure returns (uint) {
        return ((fnum + snum + tnum) / 3); //formula sum of 3 numbers divided by 3
    }

    // 4. Convert ETH to dollars
    function convertETH(uint eth) public pure returns (uint) {
        return ((eth * 305681) / 100);
    }
}