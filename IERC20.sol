pragma solidity ^0.5.11;

/**
* @dev Interface of ERC20 standard https://eips.ethereum.org/EIPS/eip-20
 */
interface IERC20 {
    // optional
    //function name() public view returns (string);
    //function symbol() public view returns (string);
    //function decimals() public view returns (uint8);

    // mandatory
    function totalSupply() external view returns (uint256);
    function balanceOf(address owner) external view returns (uint256 balance);
    function transfer(address recipient, uint256 amount) external returns (bool success);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool success);
    function approve(address spender, uint256 amount) external returns (bool success);
    function allowance(address owner, address spender) external view returns (uint256 remaining);
    event Transfer(address indexed sender, address indexed recipient, uint256 amount);
    event Approval(address indexed owner, address indexed spender, uint256 amount);
}

