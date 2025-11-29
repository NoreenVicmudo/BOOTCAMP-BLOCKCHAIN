// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
//import to peso

contract Activity1_Day12 {
    AggregatorV3Interface internal priceFeed;

    uint public constant PESO_CONSTANT = 58634 * 1e5; //58.634
    /*because there is no USD /PHP conversion in sepolia testnet 
    although there is one in polygon so i opted to use a constant*/

    constructor() {
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    function getUSDPrice() public view returns(int256){
        (, int256 price,,,) = priceFeed.latestRoundData();
        require(price > 0, "Invalid ETH/USD price.");
        return price;
    }

    //Activity #1
    function USDToETH(uint256 usdAmount) public view returns(uint256 ethAmount){
        uint256 price = uint256(getUSDPrice());
        require(price > 0, "Invalid ETH/USD price.");
        ethAmount = (usdAmount * 1e26) / price; //in wei bc 1e8 (ETH) makes the value 0 on smaller amounts (truncates)
        return ethAmount;
    }
    //Activity #2
    function convertToPeso() public view returns (uint256 phpAmount){
        uint256 ethToUSD = uint(getUSDPrice());
        return (ethToUSD * PESO_CONSTANT) / 1e8;
    }
}