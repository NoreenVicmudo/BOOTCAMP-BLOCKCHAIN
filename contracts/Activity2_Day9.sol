// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

interface IStudentRegistry {
    function register (string memory _name, uint _age) external;
    function getStudent (address _addr) external view returns (string memory, uint);
    function isRegistered (address _addr) external view returns (bool);
}

contract StudentRegistry is IStudentRegistry{
    struct Student {
        string name;
        uint age;
    }

    mapping (address => Student) public students;

    function register(string memory _name, uint _age) public {
        students[msg.sender] = Student(_name, _age);
    }

    function getStudent (address _addr) public view returns (string memory, uint){
        Student memory s = students[_addr];
        return (s.name, s.age);
    }


    function isRegistered (address _addr) public view returns (bool) {
        return bytes(students[_addr].name).length > 0;
    }
}