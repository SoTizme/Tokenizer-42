# ShilalToken42 (ShT42)

A simple ERC-20 token created as part of the **42 Tokenizer** project, in partnership with BNB Chain.

---

## Choices made

### Blockchain platform — Ethereum (Sepolia testnet)
I chose Ethereum because it is the most widely documented smart-contract platform, making it ideal for a first token project. The **Sepolia** testnet was used so that no real money is involved at any point.

### Token standard — ERC-20
ERC-20 is the dominant fungible-token standard on Ethereum. It provides a well-audited interface (transfer, approve, allowance, etc.) and is natively supported by wallets, explorers, and DeFi tooling.

### Language — Solidity 0.8.20
Solidity is the official language for Ethereum smart contracts. Version 0.8.x includes built-in overflow/underflow protection, removing the need for external SafeMath libraries.

### Framework — OpenZeppelin + Remix IDE
OpenZeppelin's battle-tested ERC-20 and Ownable base contracts were used to avoid reinventing the wheel and to keep the code secure. Remix IDE was chosen for its zero-setup browser-based workflow.

### Security considerations
- **Ownable**: only the deployer can mint new tokens, preventing arbitrary inflation.
- **No transfer restrictions**: transfers are intentionally unrestricted since this is an educational token.
- Real money was **never** used; all testing was done on Sepolia with free test ETH.

---

## Repository structure

```
README.md               ← this file
code/
    ShilalToken42.sol   ← smart contract source
deployment/
    deploy_info.md      ← contract address, network, deployment steps
documentation/
    whitepaper.md       ← token overview and usage guide
```

---

## Contract info

| Field            | Value                          |
|------------------|-------------------------------|
| Token name       | ShilalToken42                 |
| Ticker           | ShT42                         |
| Standard         | ERC-20                        |
| Network          | Ethereum Sepolia testnet       |
| Contract address | *(see deployment/deploy_info.md)* |
| Decimals         | 18                            |
| Initial supply   | 1,000,000 ShT42               |
