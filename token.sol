// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Token is ERC20 {
 address public immutable owner;
    constructor() ERC20("Token", "DT") {
        owner = msg.sender;
        _mint(msg.sender, 10**decimals()); // Mint initial supply (1 billion tokens)
    }
    error NotOwner();
  modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }
    // Mint new tokens (only the owner can call this function)
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    // Transfer tokens
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }


    // Burn tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

}
