// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract BlockchainMachine {

    // state variables
    address public owner;
    mapping (address => uint) public blockBalances;

    // set the owner as th address that deployed the contract
    // set the initial Blockchain machine balance to 100
    constructor() {
        owner = msg.sender;
        blockBalances[address(this)] = 100;
    }

    function getBlockchainMachineBalance() public view returns (uint) {
        return blockBalances[address(this)];
    }

    // Let the owner restock the Blockchain Machine
    function restock(uint amount) public {
        require(msg.sender == owner, "Only the owner can restock.");
        blockBalances[address(this)] += amount;
    }

    // Purchase blocks from the Blockchain Machine
    function purchase(uint amount) public payable {
        require(msg.value >= amount * 2 ether, "You must pay at least 2 ETH per block");
        require(blockBalances[address(this)] >= amount, "Not enough blocks in stock to complete this purchase");
        blockBalances[address(this)] -= amount;
        blockBalances[msg.sender] += amount;
    }
}