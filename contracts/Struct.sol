// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Struct {
    struct Student {
        string name;
        uint age;
        address wallet;
        bool enrolled;
    }

    mapping(uint => Student) public students;

    function addStudent(uint _id, string memory _name, uint _age) external {
        students[_id] = Student({
            name: _name,
            age: _age,
            wallet: msg.sender,
            enrolled: true
        });
    }

    function updateEnrollment(uint _id) external {
        students[_id].enrolled = false;
    }

    function getStudent(uint _id) external view returns(string memory, uint, address, bool){
        return (
            students[_id].name,
            students[_id].age,
            students[_id].wallet,
            students[_id].enrolled
            );
    }
}