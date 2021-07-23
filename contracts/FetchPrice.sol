// SPDX-License-Identifier: MIT
pragma solidity ^0.6.10;

import "./UniswapLib.sol";

contract FetchPrice {
    using FixedPoint for *;
    /**
     * @dev Fetches the current token/eth price accumulator from uniswap.
     */
    function currentCumulativePrice(address pair , bool isUniswapReversed) public view returns (uint) {
        (uint cumulativePrice0, uint cumulativePrice1,) = UniswapV2OracleLibrary.currentCumulativePrices(pair);
        if (isUniswapReversed) {
            return cumulativePrice1;
        } else {
            return cumulativePrice0;
        }
    }
    
    function getPairInfo(address pair) public view returns (address) {
        address token0 = IUniswapV2Pair(pair).token0();
        return token0;
    }

}
