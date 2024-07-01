# CustomToken Smart Contract

## Overview

The `CustomToken` smart contract is an ERC-20 compatible token deployed on the Ethereum blockchain. The contract allows the owner to mint new tokens, transfer tokens between addresses, and burn tokens. The token has customizable name, symbol, and decimals set during deployment.

## Contract Details

### State Variables

- `string public name`: The name of the token.
- `string public symbol`: The symbol of the token.
- `uint8 public decimals`: The number of decimals the token uses.
- `uint256 public supply`: The total supply of the token.
- `address public owner`: The address of the contract owner who has the exclusive right to mint new tokens.
- `mapping(address => uint256) public balances`: A mapping to track the token balance of each address.

### Events

- `event Transfer(address indexed from, address indexed to, uint256 value)`: Emitted when tokens are transferred.
- `event Mint(address indexed to, uint256 value)`: Emitted when new tokens are minted.
- `event Burn(address indexed from, uint256 value)`: Emitted when tokens are burned.

### Modifiers

- `modifier onlyOwner`: Ensures that only the owner can execute certain functions.

### Constructor

#### `constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply)`

Initializes the contract with the specified name, symbol, decimals, and initial supply. Sets the contract deployer as the owner and assigns the entire initial supply to the owner's balance.

### Functions

#### `function transfer(address to, uint256 value) external`

Transfers tokens from the sender's account to the specified `to` address.

- **Requirements**:
  - `to` must not be the zero address.
  - The sender's balance must be greater than or equal to `value`.

#### `function mint(address to, uint256 value) external onlyOwner`

Mints new tokens and assigns them to the specified `to` address.

- **Requirements**:
  - `to` must not be the zero address.
  - `value` must be greater than zero.

#### `function burn(uint256 value) external`

Burns a specified `value` of tokens from the sender's account.

- **Requirements**:
  - The sender's balance must be greater than or equal to `value`.
  - `value` must be greater than zero.

## Usage

To use this contract, you can deploy it on the Ethereum blockchain using tools like Remix, Truffle, or Hardhat. After deployment, you can interact with the contract functions as specified.

---

This contract provides a basic template for creating, transferring, and burning ERC-20 tokens with customizable parameters. It can be extended or modified as needed for specific use cases.
