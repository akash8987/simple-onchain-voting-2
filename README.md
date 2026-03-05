# Simple On-Chain Voting

A streamlined, secure, and expert-level implementation of a decentralized voting system. This repository provides a transparent way to conduct polls where each Ethereum address can cast a single vote for a set of predefined candidates.

## Features
* **Gas Optimized:** Minimal storage writes to keep transaction costs low.
* **One-Address-One-Vote:** Built-in mapping to prevent double-voting.
* **Transparency:** Real-time tallying of results directly on the blockchain.

## Getting Started
1. Deploy the `Voting.sol` contract with a list of candidate names.
2. Users call the `vote` function with the index of their chosen candidate.
3. Use `getCandidateCount` and `candidates` to view results.

## License
MIT
