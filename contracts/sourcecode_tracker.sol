/**
 *Submitted for verification at Etherscan.io on 2024-08-15
*/

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

contract SourceCodeTracker {
    struct Commit {
        string commitHash;
        string ipfsHash;
        string committer;
        uint256 timestamp;
        string description;
    }

    mapping(string => Commit[]) private repositoryCommits;

    function recordCommit(
        string memory repoName,
        string memory commitHash,
        string memory ipfsHash,
        string memory committer,
        string memory description
    ) public {
        Commit memory newCommit = Commit({
            commitHash: commitHash,
            ipfsHash: ipfsHash,
            committer: committer,
            timestamp: block.timestamp,
            description: description
        });
        repositoryCommits[repoName].push(newCommit);
    }

    function getCommitHistory(string memory repoName) public view returns (Commit[] memory) {
        return repositoryCommits[repoName];
    }
}