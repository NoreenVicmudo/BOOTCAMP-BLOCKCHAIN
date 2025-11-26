// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract CallerContract {
    function callCompute(address contractAddress, uint256 num1, uint256 num2) external view returns(uint256 sum,uint256 diff,uint256 prod,uint256 quo){
        (bool success, bytes memory data) = contractAddress.staticcall(
            abi.encodeWithSignature("compute(uint256,uint256)", num1, num2)
        );

        require(success, "Compute Failed");

        return abi.decode(data, (uint256,uint256,uint256,uint256));
    }
}

contract ComputeContract {
    function compute(uint256 fnum,uint256 snum) external pure returns (uint256 sum, uint256 diff, uint256 prod, uint256 quo){
        sum = fnum + snum;
        prod = fnum * snum;  
        diff = (fnum >= snum) ? (fnum - snum) : 0;
        quo = (snum > 0) ? fnum / snum : 0;
    }
}