// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NftSample is ERC721, Ownable {
    uint256 public TokenID;
    uint256 public constant MAX_SUPPLY = 5;

    constructor() ERC721("ChainNFT", "CNFT") Ownable(msg.sender){}

    function mint(address to) external onlyOwner {
        require(TokenID < MAX_SUPPLY, "ALL NFTs have been minted");
        _safeMint(to, TokenID);
        TokenID++;
    }
}