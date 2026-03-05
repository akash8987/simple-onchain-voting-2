// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title Simple On-Chain Voting
 * @dev Implements a basic voting mechanism for a fixed list of candidates.
 */
contract Voting {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    mapping(address => bool) public hasVoted;
    Candidate[] public candidates;

    event Voted(address indexed voter, uint256 candidateIndex);

    /**
     * @dev Initializes the contract with a list of candidate names.
     * @param _candidateNames Array of strings representing candidate names.
     */
    constructor(string[] memory _candidateNames) {
        for (uint256 i = 0; i < _candidateNames.length; i++) {
            candidates.push(Candidate({
                name: _candidateNames[i],
                voteCount: 0
            }));
        }
    }

    /**
     * @dev Allows a user to cast a vote for a candidate.
     * @param _candidateIndex The index of the candidate in the candidates array.
     */
    function vote(uint256 _candidateIndex) external {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(_candidateIndex < candidates.length, "Invalid candidate index.");

        hasVoted[msg.sender] = true;
        candidates[_candidateIndex].voteCount += 1;

        emit Voted(msg.sender, _candidateIndex);
    }

    /**
     * @dev Returns the total number of candidates.
     */
    function getCandidateCount() external view returns (uint256) {
        return candidates.length;
    }
}
