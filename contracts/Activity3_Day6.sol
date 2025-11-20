// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Activity3_Day6 {
    //Wallet Balances
    
    mapping (address => uint) private balances;

    function deposit (uint amount) public {  
        balances[msg.sender] = amount;
    }

    function getBalance(address user) public view returns (uint) {
        return balances[user]; 
    }

    function resetMyBalance() public{
        balances[msg.sender] = 0;
    }
}