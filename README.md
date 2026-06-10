# Insurance Automation Payout Using Smart Contracts

Parametric insurance settles automatically when a measurable condition is met — no adjuster, no paperwork. This demo wires a Chainlink ETH/USD oracle to a Solidity contract: when ETH falls below a pre-set strike, the deposit returns to the policyholder instantly. Same architecture behind crop insurance, weather derivatives, and flight-delay products.

---

## Clone github repo

Before beginning the repo you will have to clone this repo or download zip from github and manually open it on VS Code. 

Commands: 
git clone https://github.com/sidkhare7/price-hedge-demo.git //clone it
cd price-hedge-demo //open folder

## Setup

```bash
npm install
cp .env.example .env
npx hardhat compile
```

Add your Sepolia RPC URL and MetaMask private key to `.env` before deploying.

---

## Your task — two blanks in `contracts/PriceHedge.sol`

**Exercise 1 — `getPrice()`**
Call `feed.latestRoundData()` and return the price. It returns five values; you only need the second one (`answer`).

**Exercise 2 — `checkPolicy()`**
Write a `require()` that only allows settlement when ETH is below the strike. Cast the price with `uint256(getPrice())`.

Full answers are in `SOLUTION.md`.

---

## Deploy

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

Copy the printed address into `CONTRACT_ADDRESS` at the top of the `<script>` block in `index.html`.

---

## Run

Open `index.html` directly in your browser — no server needed.

Issue a policy with a strike just **above** the current ETH price, then click **Execute Payout** to watch it settle.

---

## Troubleshooting

| Symptom | Fix |
|---|---|
| Price shows `—` | `getPrice()` not filled in, or contract address not pasted into `index.html` |
| Execute Payout reverts | Strike is below current price, or Exercise 2 not filled in |
| Deploy fails | Check `.env` — RPC URL and private key must both be set |
