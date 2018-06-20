pragma solidity ^0.4.24;


contract DappToken {

    // read total number of tokens
    uint256 public totalSupply;

    // constructor
    constructor () public {
        totalSupply = 1000000;
    }
}