// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Return {
    function multipleReturns() public pure returns (uint, uint, string memory){
        uint numOne = 10; //masesave sa blockchain
        uint numTwo = 20;
        string memory theHello = "Hello World";

        return (numOne, numTwo, theHello);
    }
}