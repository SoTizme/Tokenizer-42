# ShilalToken42 (ShT42) — Documentation

## Overview

**ShilalToken42** (ticker: **ShT42**) is a fungible digital token deployed on the Ethereum blockchain as part of the 42 Tokenizer project. It follows the ERC-20 standard and is intended purely for educational purposes on the Sepolia testnet.

---

## Token properties

| Property        | Value              |
|-----------------|--------------------|
| Name            | ShilalToken42      |
| Symbol / Ticker | ShT42              |
| Standard        | ERC-20             |
| Decimals        | 18                 |
| Initial supply  | 1,000,000 ShT42    |
| Network         | Ethereum Sepolia   |
| Real value      | None (testnet only)|

---

## What the token represents

ShT42 is a general-purpose educational token. It demonstrates the full lifecycle of an ERC-20 asset: creation, ownership control, transfers, minting, and burning. It has no intended real-world monetary value.

---

## Smart contract architecture

The contract inherits from two OpenZeppelin base contracts:

### `ERC20`
Provides the standard token interface:
- `transfer(to, amount)` — send tokens to another address
- `approve(spender, amount)` — authorize a third party to spend on your behalf
- `transferFrom(from, to, amount)` — third-party transfer after approval
- `balanceOf(address)` — check any wallet's token balance
- `allowance(owner, spender)` — check approved spending limit
- `totalSupply()` — total tokens currently in circulation

### `Ownable`
Restricts sensitive operations to the contract deployer (owner):
- `owner()` — returns the current owner address
- `transferOwnership(newOwner)` — hand over ownership to another address
- `renounceOwnership()` — permanently give up owner privileges

### Custom functions

| Function | Access | Description |
|---|---|---|
| `mint(to, amount)` | Owner only | Creates new ShT42 tokens and sends them to `to` |
| `burn(amount)` | Any holder | Destroys the caller's own ShT42 tokens |

---

## How to use the token

### Prerequisites
- [MetaMask](https://metamask.io) wallet installed in your browser
- Sepolia testnet selected in MetaMask
- Free test ETH from [https://sepoliafaucet.com](https://sepoliafaucet.com)

### Add ShT42 to MetaMask
1. Open MetaMask → **Import tokens**
2. Paste the contract address (see `deployment/deploy_info.md`)
3. Symbol and decimals will fill automatically
4. Click **Add custom token**

### Send ShT42 to another wallet
1. In MetaMask, select ShT42 from your token list
2. Click **Send**, enter the recipient address and amount
3. Confirm the transaction

### Interact via Remix (owner actions)
1. Open Remix, load `ShilalToken42.sol`, compile and connect MetaMask
2. Under **Deployed Contracts**, expand the contract at its address
3. Use `mint`, `burn`, `transfer`, etc. directly from the UI

---

## Security model

- **Mint control**: only the owner can inflate supply — prevents unauthorized creation of tokens.
- **Burn is voluntary**: no address can burn another address's tokens.
- **No pause mechanism**: transfers cannot be frozen (sufficient for this educational scope).
- **No real funds**: the contract lives on a testnet; losing access to the owner wallet has no financial consequence.

---

## Dependencies

- Solidity `^0.8.20`
- OpenZeppelin Contracts `v5.x`
  - `@openzeppelin/contracts/token/ERC20/ERC20.sol`
  - `@openzeppelin/contracts/access/Ownable.sol`
