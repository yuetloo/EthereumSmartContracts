pragma solidity ^0.5.11;

interface IERC20 {
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
}

/**
* @notice: this contract accepts WETH as payment for token
*/
contract TokenSale {
    IERC20   public token;
    address public owner;
    IERC20   public weth;  // can use 0xeA303aC199302F484847aBa40f4Eee3C6Ede49B6 on ropsten

    constructor(IERC20 tokenForSale, IERC20 wethToReceive) public {
        token = tokenForSale;
        weth = wethToReceive;
        owner = msg.sender;
    }

    function claimToken(uint amount) public {
        weth.transferFrom(msg.sender, owner, amount);
        token.transferFrom(owner, msg.sender, amount);
    }
}