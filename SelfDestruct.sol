pragma solidity 0.5.16;

contract Bank {
    constructor() public payable {}
    function getInterest() public pure returns(uint) {return 6;}
    function getBalance() public view returns (uint) {return address(this).balance;}
    function () external payable { revert("bank does not accept ether"); }
    function kill(address payable target) public {
        selfdestruct(target);
    }
}
contract Caller {
    Bank public bank;

    constructor(Bank theBank) public payable {
        bank = theBank;
    }
    function doTransfer(address payable user) public {
        user.transfer(1 ether);
    }
    function doSend(address payable user) public {
        require(user.send(1 ether));
    }
    function kill(address payable target) public {
        selfdestruct(target);
    }
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    function getInterest() public view returns(uint) {
        return bank.getInterest();
    }
}
