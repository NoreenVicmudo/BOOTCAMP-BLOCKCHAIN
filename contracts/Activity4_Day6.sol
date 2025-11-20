// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Struct {
    struct Student {
        string name;
        uint age;
        address wallet;
        bool enrolled;
    }

    Student[] private students;

    function addStudent(string memory _name, uint _age, bool _enrolled) external {
        students.push(Student({
            name: _name,
            age: _age,
            wallet: msg.sender,
            enrolled: _enrolled
        }));
    }

    function getStudent(uint index) external view returns(string memory, uint, address, bool){
        return (
            students[index].name,
            students[index].age,
            students[index].wallet,
            students[index].enrolled
            );
    }

    function getTotalStudents() external view returns (uint) {
        return students.length;
    }
}