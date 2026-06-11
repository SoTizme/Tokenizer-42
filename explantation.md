No worries — that's exactly what eval prep is for. Let's do two things: get you deployed, then make sure you can explain every line.

---

## Step 1 — Deploy first (5 minutes)

Do this right now before anything else:

1. Go to [remix.ethereum.org](https://remix.ethereum.org)
2. Create `ShilalToken42.sol`, paste your contract
3. Compiler tab → `0.8.20` → Enable Optimization → **Compile**
4. Deploy tab → **Injected Provider (MetaMask)** → Sepolia selected → constructor: `1000000` → **Deploy** → confirm in MetaMask
5. Copy the contract address → update your `deployment/deploy_info.md`

---

## Step 2 — Understand the code (so you don't get caught off guard)

Here's every part of your contract explained in plain language, the way you should be able to say it out loud to an evaluator:

**`pragma solidity ^0.8.20`**
> "I'm using Solidity version 0.8.20 or higher. This version has built-in protection against integer overflow and underflow, so I don't need a SafeMath library."

**`import ERC20 and Ownable`**
> "Instead of writing the token logic from scratch, I import two audited base contracts from OpenZeppelin. ERC20 gives me all the standard token functions, and Ownable gives me an owner system so only I can mint new tokens."

**`constructor(uint256 initialSupply)`**
> "When the contract is deployed, I pass a number like 1,000,000. The constructor calls `_mint` to create that many tokens and send them all to the deployer's wallet. I multiply by `10^18` because ERC-20 tokens use 18 decimal places — similar to how 1 ETH = 10^18 wei."

**`mint(address to, uint256 amount) onlyOwner`**
> "Only the contract owner can call this to create new tokens and send them to any address. The `onlyOwner` modifier from Ownable blocks anyone else from calling it."

**`burn(uint256 amount)`**
> "Any token holder can destroy their own tokens by calling this. It reduces their balance and the total supply permanently."

---

## Step 3 — Practice these likely eval questions

| Question | What to say |
|---|---|
| What is ERC-20? | A standard interface for fungible tokens on Ethereum. Every ERC-20 has the same functions: transfer, approve, balanceOf, totalSupply, etc. |
| What is a smart contract? | Code deployed on the blockchain that runs automatically when called. It has no owner who can change it after deployment (unless the contract allows it). |
| Why Sepolia and not mainnet? | Sepolia is a testnet — it uses fake ETH that has no value. The project explicitly forbids using real money. |
| What does `onlyOwner` do? | It's a modifier from OpenZeppelin's Ownable. It checks that `msg.sender == owner()` before running the function, otherwise it reverts. |
| What is `msg.sender`? | The address that called the current function. In the constructor it's the deployer, in a transfer it's the sender. |
| Can you mint unlimited tokens? | Technically yes, but only the owner can. This is a security choice — in production you'd add a supply cap. |
| What's the difference between `transfer` and `transferFrom`? | `transfer` sends from your own wallet. `transferFrom` lets an approved third party (like a DEX) move tokens on your behalf after you called `approve`. |
| What is a ticker/symbol? | A short identifier for the token, like ShT42. Similar to stock tickers. Used in wallets and explorers. |

---

Once you've deployed, come back and I'll walk you through **live demo practice** — showing the evaluator mint, transfer, burn, and balanceOf in Remix in real time.