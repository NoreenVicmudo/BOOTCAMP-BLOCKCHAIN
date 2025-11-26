// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract SecondContract {
    function callSetNumber(address contractAddress, uint256 num) external {
        (bool success, ) = contractAddress.call(
            abi.encodeWithSignature("setNumber(uint256)", num)
        );

        require(success, "Call Failed");
    }

    function readNumber(address contractAddress) external view returns(uint256){
        (bool success, bytes memory data) = contractAddress.staticcall(
            abi.encodeWithSignature("number()")
        );

        require(success, "Read Failed");
        return abi.decode(data, (uint256));
    }
}