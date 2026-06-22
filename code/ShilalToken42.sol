// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title ShilalToken42 (ShT42)
/// @notice ERC-20 token created for the 42 Tokenizer project
contract ShilalToken42 is ERC20, Ownable {

    /// Deploy the token and assign the initial supply to the owner
    constructor(uint256 initialSupply)
        ERC20("ShilalToken42", "ShT42")
        Ownable(msg.sender)
    {
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    /// Mint new tokens (owner only)
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount * 10 ** decimals());
    }

    /// Burn caller's tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount * 10 ** decimals());
    }
}
