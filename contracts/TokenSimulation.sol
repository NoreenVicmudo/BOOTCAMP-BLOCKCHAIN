// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CampusCoin is ERC20 {
    constructor(uint256 initialSupply) ERC20("Elysia","Cyrene"){
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }
}

contract StudentPayment {
    ERC20 public token;

    constructor(address tokenAddress){
        token = ERC20(tokenAddress);
    }

    function payVendor(address vendor, uint amount) external{
        require(vendor != address(0), "Invalid Vendor");
        require(amount > 0, "Invalid amount");

        bool success = token.transferFrom(msg.sender, vendor, amount);

        require(success, "Transfer from student failed");        
    }
}