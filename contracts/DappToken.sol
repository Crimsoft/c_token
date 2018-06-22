pragma solidity ^0.4.24;


contract DappToken {


    // token name
    string public name = "CCoin";

    // token symbol
    string public symbol = "CCoin";

    // token standard
    string public standard = "CCoin v1.0.0";

    event Transfer(address _from, address _to, uint256 _value);

    // read total number of tokens
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    // constructor
    constructor (uint _initialSupply) public {

        // allocate the initial supply to the admin's account
        balanceOf[msg.sender] = _initialSupply;

        totalSupply = _initialSupply;
    }

    // transfer function
    function transfer(address _to, uint256 _value) public returns (bool success) {

        // throw exception if account doesn't have sufficient balance
        require(balanceOf[msg.sender] >= _value);

        // transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        // trigger transfer event
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
}