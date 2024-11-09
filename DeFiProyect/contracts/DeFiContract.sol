// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeFiContract {
    address public owner;
    mapping(address => uint) public balances;
    mapping(address => uint) public loans;
    uint public totalSupply;
    mapping(address => uint) public rewards;
    mapping(address => uint) public votes;

    event LoanTaken(address indexed user, uint amount);
    event RewardClaimed(address indexed user, uint amount);
    event Voted(address indexed user, uint vote);

    constructor(uint initialSupply) {
        owner = msg.sender;
        totalSupply = initialSupply;
        balances[owner] = initialSupply;
    }

    function deposit() external payable {
        require(msg.value > 0, "Must deposit ETH");
        balances[msg.sender] += msg.value;
    }

    function takeLoan(uint amount) external {
        require(balances[msg.sender] >= amount / 2, "Need 50% collateral");
        loans[msg.sender] += amount;
        emit LoanTaken(msg.sender, amount);
    }

    function claimReward() external {
        uint reward = rewards[msg.sender];
        require(reward > 0, "No reward available");
        rewards[msg.sender] = 0;
        balances[msg.sender] += reward;
        emit RewardClaimed(msg.sender, reward);
    }

    function vote(uint option) external {
        require(balances[msg.sender] > 0, "Must hold tokens to vote");
        votes[msg.sender] = option;
        emit Voted(msg.sender, option);
    }
}
