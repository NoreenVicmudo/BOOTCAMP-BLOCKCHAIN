// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract StudentRegistry {

    event StudentRegistered(uint studentId, string name, address wallet);
    mapping (uint => string) public studentName;

    function registerStudent(uint studentId, string memory name, address wallet) external {
        studentName[studentId] = name;
        emit StudentRegistered(studentId, name, wallet);
    }
}