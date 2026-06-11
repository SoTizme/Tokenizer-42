# Deployment Info

## Network

| Field        | Value                        |
|--------------|------------------------------|
| Network      | Ethereum Sepolia testnet      |
| Chain ID     | 11155111                     |
| Explorer     | https://sepolia.etherscan.io |

---

## Contract address

> **TODO:** Replace the line below with your actual deployed address after deployment.

```
Contract address: 0xYourDeployedContractAddressHere
```

You can view it on the explorer at:
`https://sepolia.etherscan.io/address/0xYourDeployedContractAddressHere`

---

## How to deploy (Remix IDE)

1. Open [https://remix.ethereum.org](https://remix.ethereum.org)
2. Create a new file `ShilalToken42.sol` and paste the contract from `code/ShilalToken42.sol`
3. Go to the **Solidity Compiler** tab:
   - Select compiler version `0.8.20`
   - Enable **Optimization** (200 runs)
   - Click **Compile ShilalToken42.sol**
4. Go to the **Deploy & Run Transactions** tab:
   - Environment: **Injected Provider — MetaMask**
   - Make sure MetaMask is connected to **Sepolia**
   - In the constructor field, enter the initial supply (e.g. `1000000`)
   - Click **Deploy** and confirm the transaction in MetaMask
5. After deployment, copy the contract address from Remix and update this file.

---

## Verifying on Etherscan (optional but recommended)

1. Go to `https://sepolia.etherscan.io/address/<your_address>#code`
2. Click **Verify and Publish**
3. Select:
   - Compiler: `v0.8.20`
   - License: MIT
   - Optimization: Yes, 200 runs
4. Paste the flattened source code (use Remix → right-click file → Flatten)
5. Submit — your contract source will be publicly visible

---

## Demonstrating the token (for evaluation)

Once deployed, you can demonstrate the following directly in Remix under **Deployed Contracts**:

| Action      | Function  | Who can call |
|-------------|-----------|--------------|
| Check balance | `balanceOf(address)` | Anyone |
| Transfer tokens | `transfer(to, amount)` | Any holder |
| Mint new tokens | `mint(to, amount)` | Owner only |
| Burn tokens | `burn(amount)` | Any holder |
| Check owner | `owner()` | Anyone |
| Transfer ownership | `transferOwnership(address)` | Owner only |
