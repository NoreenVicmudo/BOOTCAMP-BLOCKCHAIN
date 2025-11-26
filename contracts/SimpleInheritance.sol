// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Animal {
    string public species;

    function setSpecies(string memory _species) public {    //public para mainherit
        species = _species;
    }

    function makeSound() public pure virtual returns (string memory) {
        return "Some general animal sound";
    }
}

contract Dog is Animal {
    function makeSound() public pure override returns (string memory) {
        return "Woof";
    }
}