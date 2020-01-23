pragma solidity ^0.5.11;

interface ILib {
    function version() external view returns(uint);
}

contract LibV1 is ILib {
    uint public version = 1;
}

contract Ownable {
    address public owner;
    constructor() public {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "not onwer!");
        _;
    }
}

contract Proxy is Ownable {
    address public owner;
    ILib public lib;
    constructor(ILib libAddress) public {
        lib = libAddress;
    }
    function upgrade(ILib newLib) public onlyOwner {
        lib = newLib;
    }
    function version() public view returns(uint) {
        return lib.version();
    }
}
