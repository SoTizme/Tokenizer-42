# How to Deploy ShilalToken42 (ShT42)

A complete step-by-step guide — from zero to a deployed token on Sepolia testnet.

---

## Tools used

| Tool | Purpose | Link |
|---|---|---|
| MetaMask | Wallet to sign transactions | https://metamask.io |
| Sepolia faucet | Free test ETH | https://cloud.google.com/application/web3/faucet/ethereum/sepolia |
| Remix IDE | Write, compile, deploy the contract | https://remix.ethereum.org |
| Sepolia Etherscan | View the deployed contract publicly | https://sepolia.etherscan.io |

---

## Contract Address

**Contract Address:** `0x6B29414aE8FD8A59b40fC093ac9b4fcA6d04b45d`

**Explorer Link:** [View on Sepolia Etherscan](https://sepolia.etherscan.io/address/0x6B29414aE8FD8A59b40fC093ac9b4fcA6d04b45d)

## Step 1 — Create a MetaMask wallet

1. Go to [https://metamask.io](https://metamask.io) and click **Download**
2. Install the browser extension (Chrome or Firefox recommended)
3. Click **Create a new wallet**
4. Set a strong password
5. **Save your Secret Recovery Phrase (12 words) somewhere safe** — if you lose this, you lose access to your wallet forever
6. Confirm the phrase when asked
7. Your wallet is ready — you will see your public address at the top (starts with `0x...`)

> ⚠️ Never share your Secret Recovery Phrase or private key with anyone.

---

## Step 2 — Enable Sepolia testnet in MetaMask

By default MetaMask hides test networks. To show Sepolia:

1. Open MetaMask → click the **three dots (⋮)** at the top right → **Settings**
2. Go to **Security & Privacy**
3. Scroll down and turn ON **Show test networks**
4. Go back to the main screen
5. Click the network name at the top (it says "Ethereum Mainnet")
6. In the list, select **Sepolia test network**

Your MetaMask is now on Sepolia — you will see "Sepolia" at the top.

---

## Step 3 — Get free test ETH (SepoliaETH)

You need test ETH to pay for gas fees when deploying. It is completely free.

1. Go to [https://cloud.google.com/application/web3/faucet/ethereum/sepolia](https://cloud.google.com/application/web3/faucet/ethereum/sepolia)
2. Sign in with a Google account
3. Paste your MetaMask wallet address in the field (copy it from MetaMask — starts with `0x...`)
4. Click **Request 0.5 ETH**
5. Wait ~30 seconds
6. Open MetaMask → you should see **0.5 SepoliaETH** in your balance

> ℹ️ You can request again after 24 hours if you need more.

---

## Step 4 — Open Remix IDE and create the contract file

1. Go to [https://remix.ethereum.org](https://remix.ethereum.org)
2. In the left panel, under **File Explorer**, Inside the `contracts` folder click the **new file** icon
3. Name the file `ShilalToken42.sol`
4. Paste the full contract code from the `code/ShilalToken42.sol` file in this repository

---

## Step 5 — Compile the contract

1. Click the **Solidity Compiler** tab on the left (icon looks like an "S")
2. Set the compiler version to **0.8.20**
3. Check **Enable optimization** (leave runs at 200)
4. Click **Compile ShilalToken42.sol**
5. You should see a green checkmark — no errors, only a possible SPDX warning which is harmless

---

## Step 6 — Reconnect to your contract anytime (no redeploying)

Once deployed, your contract lives permanently on Sepolia. You never need to deploy it again — just reconnect:

1. Open Remix and load `ShilalToken42.sol`
2. Compile with Solidity **0.8.20**
3. Go to **Deploy & Run Transactions**
4. Select **Injected Provider — MetaMask** in the Environment dropdown
5. Connect MetaMask (same wallet used to deploy) and confirm it's on **Sepolia**
6. Scroll to **Deployed Contracts**, click the small **add (+)** button
7. Paste your existing contract address
8. The contract loads, fully connected and ready to use

---

## Step 7 — View your token on Etherscan

1. Go to [https://sepolia.etherscan.io](https://sepolia.etherscan.io)
2. Paste your contract address in the search bar
3. You will see your token, its transactions, and its details publicly visible

---

## Step 8 — Add ShT42 to MetaMask (to see your balance)

1. Open MetaMask → scroll down → click **Import tokens**
2. Paste your contract address in the **Token contract address** field
3. MetaMask fills in automatically:
   - Symbol: `ShT42`
   - Decimals: `18`
4. Click **Next** → **Import**
5. You will now see **1,000,000 ShT42** in your wallet

> ℹ️ If the balance doesn't appear right away, this is a common MetaMask display delay. Check **Remix → balanceOf** or **Sepolia Etherscan** to confirm your real balance — these are always the source of truth.

---

## Step 9 — Using the token functions

All actions are done in Remix under **Deployed Contracts** → expand your contract.

### Check a balance (free — blue button)
- Function: `balanceOf`
- Input: a wallet address
- Result: that address's token balance in wei (1,000,000 tokens = `1000000000000000000000000`)

### Mint new tokens (orange button — owner only)
- Function: `mint`
- Input:
  - `to`: any wallet address
  - `amount`: e.g. `500`
- Confirm in MetaMask → new ShT42 created

### Transfer tokens (orange button)
- Function: `transfer`
- Input:
  - `to`: another wallet address
  - `amount`: e.g. `100`
- Confirm in MetaMask → ShT42 sent

### Burn tokens (orange button)
- Function: `burn`
- Input:
  - `amount`: e.g. `200`
- Confirm in MetaMask → ShT42 permanently destroyed

### Check total supply (free — blue button)
- Function: `totalSupply`
- No input needed
- Shows total ShT42 currently in existence (decreases after burn)

### Check the owner (free — blue button)
- Function: `owner`
- No input needed
- Returns the only wallet address allowed to call `mint`

---

## Important notes

- **Never use real ETH** — this project uses Sepolia testnet only, all ETH here has no real value
- **Keep your deployer wallet safe** — it is the only wallet that can call `mint`
- **Never click `renounceOwnership`** — it permanently removes mint access with no way back