// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Calldata {
    function changeNumber(string calldata namer) internal pure returns (string memory){
        return namer;
    }

    string public name;

    function changeString (string storage nameRef) internal pure returns (string storage) {
        return nameRef;
    }
}