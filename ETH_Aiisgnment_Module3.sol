// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public supply;
    address public owner;

    mapping(address => uint256) public balances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can execute this function");
        _;
    }

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        supply = _initialSupply * 10**uint256(_decimals);
        owner = msg.sender;
        balances[owner] = supply;
    }

    function transfer(address to, uint256 value) external {
        require(to != address(0), "Invalid recipient address");
        require(balances[msg.sender] >= value, "Insufficient balance");

        balances[msg.sender] -= value;
        balances[to] += value;

        emit Transfer(msg.sender, to, value);
    }

    function mint(address to, uint256 value) external onlyOwner {
        require(to != address(0), "Invalid recipient address");
        require(value > 0, "Mint amount must be greater than zero");

        supply += value;
        balances[to] += value;

        emit Mint(to, value);
    }

    function burn(uint256 value) external {
        require(balances[msg.sender] >= value, "Insufficient balance");
        require(value > 0, "Burn amount must be greater than zero");

        supply -= value;
        balances[msg.sender] -= value;

        emit Burn(msg.sender, value);
    }
}
