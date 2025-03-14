#SimpleVoting.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    mapping(string => uint) public votes;

    function vote(string memory candidate) public {
        require(
            keccak256(abi.encodePacked(candidate)) == keccak256(abi.encodePacked("Alice")) ||
            keccak256(abi.encodePacked(candidate)) == keccak256(abi.encodePacked("Bob")),
            "Candidate must be Alice or Bob"
        );
        votes[candidate]++;
    }
}
