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
    function balanceOf(address _owner) external view returns (uint256 balance);
    function transfer(address _to, uint256 _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
    function approve(address _spender, uint256 _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

