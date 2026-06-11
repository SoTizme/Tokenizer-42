pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title ShilalToken42 - A simple ERC-20 token for the 42 Tokenizer project
// Deployed on the Ethereum Sepolia testnet for educational purposes only.
//         This token has no real monetary value.
contract ShilalToken42 is ERC20, Ownable {

    //  Constructor

    /// @notice Deploy the token and mint the initial supply to the deployer
    /// @param initialSupply Total tokens to mint (in whole units, e.g. 1000000)
    constructor(uint256 initialSupply) ERC20("ShilalToken42", "ShT42") Ownable(msg.sender) {
        // Mint all initial tokens to the wallet that deploys the contract (the owner).
        // decimals() returns 18 by default, so we shift by 10^18 to convert whole units.
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    //  Owner-only functions
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount * 10 ** decimals());
    }

    //  Public functions
    function burn(uint256 amount) external {
        _burn(msg.sender, amount * 10 ** decimals());
    }
}
