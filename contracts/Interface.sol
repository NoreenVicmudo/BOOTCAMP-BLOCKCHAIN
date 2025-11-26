// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;


interface IFirstContract{
    function setNumber(uint256 num) external;
    function number() external view returns (uint256); //state variable
}

contract ContractCaller{
    function callSetNumber(address contractAddress, uint256 num) external {
        IFirstContract(contractAddress).setNumber(num);
    }

    function readNumber(address contractAddress) external view returns(uint256){
        return IFirstContract(contractAddress).number();
    }
}