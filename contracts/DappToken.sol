pragma solidity ^0.4.24;


contract DappToken {


    string public name = "CCoin";
    string public symbol = "CCoin";
    string public standard = "CCoin v1.0.0";

    event Transfer(address _from, address _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    // read total number of tokens
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

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

    // approve function
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // delegated transfers
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        // update the balances
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        // update the allowance
        allowance[_from][msg.sender] -= _value;

        // trigger transfer event
        emit Transfer(_from, _to, _value);

        return true;
    }
}