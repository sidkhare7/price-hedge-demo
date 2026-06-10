# Solution

## TODO #1 — `getPrice()`

```solidity
function getPrice() public view returns (int256) {
    (, int256 answer,,,) = feed.latestRoundData();
    return answer;
}
```

## TODO #2 — `checkPolicy()` require

```solidity
require(uint256(getPrice()) < p.strike, "Price above strike");
```
