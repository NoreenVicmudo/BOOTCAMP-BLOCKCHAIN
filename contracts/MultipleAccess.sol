// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Shape {
    function area() public pure virtual returns(string memory){
        return "Shape should define";
    }
}

contract Rectangle is Shape {
    function area() public pure override returns(string memory){
        return "Area = length * width";
    }
}

contract Circle is Shape {
    function area() public pure override returns(string memory){
        return "Area = length * width * 2";
    }
}