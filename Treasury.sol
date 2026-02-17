// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./StableToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Treasury
 * @dev Manages the supply of StableToken based on price data.
 */
contract Treasury is Ownable {
    StableToken public token;
    uint256 public constant TARGET_PRICE = 1e18; // $1.00 (18 decimals)

    event Rebase(uint256 price, int256 supplyDelta);

    constructor(address _token) Ownable(msg.sender) {
        token = StableToken(_token);
    }

    /**
     * @dev Adjusts supply based on current price. 
     * In a real app, 'currentPrice' would come from a Chainlink Oracle.
     */
    function policy(uint256 currentPrice) external onlyOwner {
        if (currentPrice > TARGET_PRICE) {
            // Price is too high, expand supply (mint tokens to treasury/users)
            uint256 expansionAmount = (token.totalSupply() * (currentPrice - TARGET_PRICE)) / TARGET_PRICE;
            token.mint(address(this), expansionAmount);
            emit Rebase(currentPrice, int256(expansionAmount));
        } else if (currentPrice < TARGET_PRICE) {
            // Price is too low, contraction logic (simplified)
            emit Rebase(currentPrice, -1); 
        }
    }
}
