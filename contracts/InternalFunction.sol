// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract InternalFunction{
    function helper() internal pure  returns(uint256){
        return 100;
    }

    function helperTrigger() public pure returns (uint256){
        return helper();
    }
}

contract internalChild is InternalFunction{
    function useHelper() public pure returns (uint256){
        return helper();
    }
}