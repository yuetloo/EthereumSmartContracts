pragma solidity ^0.5.11;

interface IERC20 {
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
}

/**
* @notice: this contract accepts WETH as payment for token
*/
contract TokenSale {
    IERC20   public token;
    address public  wallet;
    IERC20   public weth;  // can use 0xeA303aC199302F484847aBa40f4Eee3C6Ede49B6 on ropsten

    constructor(address tokenWallet, IERC20 tokenForSale, IERC20 wethToReceive) public {
        require(wethToReceive != tokenForSale, "tokens should be different");
        require(tokenWallet != address(0), "wallet cannot be zero");
        require(address(tokenForSale) != address(0), "token address cannot be zero");
        require(address(wethToReceive) != address(0), "weth address cannot be zero");

        token = tokenForSale;
        weth = wethToReceive;
        wallet = tokenWallet;
    }

    function claimToken(uint amount) public {
        weth.transferFrom(msg.sender, wallet, amount);
        token.transferFrom(wallet, msg.sender, amount);
    }
}
