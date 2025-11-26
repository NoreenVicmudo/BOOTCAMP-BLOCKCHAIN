// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Parent {
    function lineage() public pure returns(string memory){
        return "First Function";
    }

    function lineage1() public pure returns(string memory){
        return "Second Function";
    }
}

contract SecondParent {
    function lineage3() public pure returns(string memory){
        return "Third Function";
    }
}

contract Child is Parent, SecondParent{
}