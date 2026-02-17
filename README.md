# Algorithmic Stablecoin Lite

This repository provides a high-quality, expert-level implementation of an algorithmic stablecoin. It demonstrates the core mechanics of maintaining a peg through supply expansion and contraction (Rebasing).

## The Mechanism
The protocol uses a simple "Elastic Supply" model:
* **Above Peg ($ > 1):** The protocol mints new tokens and distributes them to stakers (Expansion).
* **Below Peg ($ < 1):** The protocol incentivizes token burning or reduces supply (Contraction).

## Core Components
* **StableToken:** The asset pegged to 1 USD.
* **Oracle:** Provides the current market price of the token (Mocked for testing).
* **Treasury:** Manages the logic of when to expand or contract supply.



## Security Note
This is a simplified model for educational purposes. Real-world algorithmic stablecoins require complex game theory and deep liquidity to resist "death spirals."

## License
MIT
