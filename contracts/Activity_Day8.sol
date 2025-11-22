// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Activity_Day8{
    mapping(address => uint) private balances;

    event Deposited(address indexed sender, uint amount);
    event Withdrawn(address indexed recipient, uint amount);

    //ACTIVITY 1
    function deposit() external payable{
        require(msg.value > 0, "Must send some ETH");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender]; 
    }

    //ACTIVITY 2
    function withdraw(uint amount) external{
        require(balances[msg.sender] >= amount, "Not enough balance");
        balances[msg.sender] -= amount;
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Withdraw failed");

        emit Withdrawn(msg.sender, amount);
    }
}