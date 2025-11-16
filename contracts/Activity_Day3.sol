// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GameStats {

    // A struct to hold all stats for one player
    struct Player {
        uint256 score;
        uint256 levelProgress; 
        bool isAlive;
        string name;        
    }

    mapping(address => Player) public playerStats;

    //Create player
    function createPlayer(string memory _name) public {
        // msg.sender is the address of the person calling this function
        address playerAddress = msg.sender;
        
        //Validation
        require(playerStats[playerAddress].score == 0, "Player already exists.");

        playerStats[playerAddress] = Player({
            score: 0,
            levelProgress: 0,
            isAlive: true,
            name: _name
        });
    }

    //Update player score
    function updateScore(uint256 _newScore) public {
        address playerAddress = msg.sender;
        
        //Validation
        require(playerStats[playerAddress].isAlive, "Player not found or is not alive.");
        
        playerStats[playerAddress].score = _newScore;
    }
}