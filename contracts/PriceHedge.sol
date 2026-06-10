// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// On-Chain Insurance Settlement — parametric payout via Chainlink price oracle
// If ETH drops below the policyholder's strike price, the deposit is refunded.

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract PriceHedge {
    // One insurance policy
    struct Policy { address holder; uint256 strike; uint256 deposit; bool triggered; }

    mapping(uint256 => Policy) public policies;  // id → policy
    uint256 public nextId;                       // next policy id
    AggregatorV3Interface internal feed;         // Chainlink ETH/USD feed

    // Sepolia ETH/USD feed
    constructor() {
        feed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    // Buy a policy: send ETH, set your strike price (8 decimals, e.g. $2000 = 2000e8)
    function createPolicy(uint256 strike) external payable {
        require(msg.value > 0, "Need deposit");
        policies[nextId] = Policy(msg.sender, strike, msg.value, false);
        nextId++;
    }

    // ── Exercise 1 ────────────────────────────────────────────────────────────
    // Return the current ETH price from Chainlink.
    // feed.latestRoundData() returns: roundId, answer, startedAt, updatedAt, answeredInRound
    // You only need `answer`. Skip the rest with commas:  (, int256 answer,,,)
    // ─────────────────────────────────────────────────────────────────────────
    function getPrice() public view returns (int256) {

        // Write answer here for exercise - 1

    }

    // Trigger payout if price has dropped below the strike
    function checkPolicy(uint256 id) external {
        Policy storage p = policies[id];
        require(!p.triggered, "Already paid");

        // ── Exercise 2 ────────────────────────────────────────────────────────
        // Add a require() that only allows payout when current price < strike.
        // Cast int256 → uint256 to compare:  uint256(getPrice())
        // ─────────────────────────────────────────────────────────────────────
        
         // Write answer here for exercise - 2 here

        p.triggered = true;
        payable(p.holder).transfer(p.deposit);
    }
}