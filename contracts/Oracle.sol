// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract oracles {
    AggregatorV3Interface internal priceFeed;
    constructor() {
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

    }

    function getPrice() public view returns(int256){
        (, int256 price,,,) = priceFeed.latestRoundData();
        return price;
    }

    function EthToUSD() public view returns(int256){
        int256 ethUsd = getPrice();
        return (ethUsd / 1e8);
    } 
}