# CoinDeck Token Hardhat Project

This repository contains the smart contract implementation for the **CoinDeck Token (DECK)**, a custom ERC20 token with burnable, permit, and voting functionalities. The project leverages OpenZeppelin's libraries and is designed for deployment on Ethereum-compatible blockchains.

---

## Project Overview

The CoinDeck Token (DECK) is a utility token with the following features:

- **Burnable:** Token holders can burn their tokens to reduce the circulating supply.
- **Permit (EIP-2612):** Allows off-chain approvals for token transfers using signatures, reducing gas costs.
- **Voting:** Integrates token-based governance, enabling token holders to participate in on-chain decision-making.

The token has a total supply of **100 billion tokens**, with **7 decimal places** for improved precision.

---

## Contract Features

- **Minting:** The total supply is minted to a specified admin address during deployment.
- **Decimals:** The token uses 7 decimal places instead of the default 18.
- **Voting Integration:** Implements ERC20Votes to enable governance functionalities.

### Key Functions

1. **Constructor**
   - Mints the total supply to the provided admin address.
   - Ensures the admin address is not the zero address.

2. **Decimals**
   - Overrides the default `decimals()` function to set the token precision to 7 decimal places.

3. **ERC20Votes Hooks**
   - `_afterTokenTransfer`: Updates vote tracking post-transfer.
   - `_mint`: Handles minting with voting logic.
   - `_burn`: Handles burning with voting logic.

---

## Prerequisites

Ensure you have the following tools installed:

1. **Node.js** (v14 or higher)
2. **Hardhat**: Ethereum development environment
3. **NPM or Yarn**: Package manager

---

## Installation

1. Clone the repository:

   ```bash
   git clone <repository_url>
   ```

2. Navigate to the project directory:

   ```bash
   cd coindeck-token
   ```

3. Install dependencies:

   ```bash
   npm install
   ```

---

## Deployment

Follow these steps to deploy the CoinDeck Token contract to your preferred Ethereum-compatible network:

1. Configure your deployment details in the `hardhat.config.js` file.
   - Add your network configurations (e.g., Infura/Alchemy API URL and private key).

2. Run the deployment script:

   ```bash
   npx hardhat run scripts/deploy.js --network <network_name>
   ```

3. Provide the admin address as a parameter in the deployment script.

---

## Interaction with the Contract

Once deployed, the contract can be interacted with using tools like Hardhat scripts, Ethers.js, or a blockchain explorer. Some common interactions include:

1. **Token Transfers**
   - Transfer tokens between addresses.

2. **Burn Tokens**
   - Reduce the total circulating supply by burning tokens.

3. **Permit**
   - Approve token transfers off-chain using signatures.

4. **Voting**
   - Participate in governance proposals using voting power derived from token holdings.

---

## Directory Structure

```
.
├── contracts
│   └── CoinDeck.sol         # Smart contract implementation
├── scripts
│   └── deploy.js            # Deployment script
├── hardhat.config.js        # Hardhat configuration file
├── package.json             # Project dependencies
├── README.md                # Project documentation
```

---

## License

This project is licensed under the **MIT License**. See the `LICENSE` file for details.
