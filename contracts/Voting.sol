// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping(string => uint256) private votes; // Tracks votes for each candidate
    string[] public candidates; // List of candidates

    // Event emitted when a vote is cast
    event VoteCasted(string candidate, uint256 totalVotes);

    // Constructor to initialize the candidates
    constructor(string[] memory _candidates) {
        candidates = _candidates;
    }

    // Function to cast a vote to a candidate
    function vote(string memory candidate) public {
        require(validCandidate(candidate), "Invalid candidate");
        votes[candidate]++;
        emit VoteCasted(candidate, votes[candidate]);
    }

    // Function to get the total votes for a candidate
    function getVotes(string memory candidate) public view returns (uint256) {
        require(validCandidate(candidate), "Invalid candidate");
        return votes[candidate];
    }

    // Function to validate if a candidate exists
    function validCandidate(string memory candidate) internal view returns (bool) {
        for (uint256 i = 0; i < candidates.length; i++) {
            if (keccak256(abi.encodePacked(candidates[i])) == keccak256(abi.encodePacked(candidate))) {
                return true;
            }
        }
        return false;
    }
}
