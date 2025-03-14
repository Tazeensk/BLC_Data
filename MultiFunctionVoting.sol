#MultiFunctionVoting.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiFunctionVoting {
    mapping(string => uint) public votes;
    string[] public candidates;
    address public owner;

    constructor() {
        owner = msg.sender; // Set contract deployer as owner
        candidates.push("Alice");
        candidates.push("Bob");
    }

    // Function to cast a vote
    function vote(string memory _candidate) public {
        require(isValidCandidate(_candidate), "Invalid candidate");
        votes[_candidate]++;
    }

    // Function to get total votes of a candidate
    function getVotes(string memory _candidate) public view returns (uint) {
        require(isValidCandidate(_candidate), "Invalid candidate");
        return votes[_candidate];
    }

    // Function to get the list of all candidates
    function getCandidates() public view returns (string[] memory) {
        return candidates;
    }

    // Function to reset all votes (only owner can call this)
    function resetVotes() public onlyOwner {
        for (uint i = 0; i < candidates.length; i++) {
            votes[candidates[i]] = 0;
        }
    }

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    // Private function to check if a candidate is valid
    function isValidCandidate(string memory _candidate) private view returns (bool) {
        for (uint i = 0; i < candidates.length; i++) {
            if (keccak256(bytes(_candidate)) == keccak256(bytes(candidates[i]))) {
                return true;
            }
        }
        return false;
    }
}
