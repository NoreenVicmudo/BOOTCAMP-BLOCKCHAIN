// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

library Mathlib{
    function add(uint a, uint b) internal pure returns (uint){
        return a + b;
    }

    function square(uint a) internal pure returns(uint){
        return a * a;
    }
}

contract Calculator {
    using Mathlib for uint;

    function getSum(uint x, uint y) external pure returns(uint){
        return Mathlib.add(x, y);

        //x.add(y); <== This is shortcut
    }

    function getSquare(uint x) external pure returns(uint){
        return Mathlib.square(x);
        //return x.square();
    }
}