pragma solidity >0.5.0;

contract DynamicArrayStorage {
    struct Store { uint8 x; uint8 y; }
    Store[] data;
    
    constructor() public {
        data.push(Store(0x22, 0x33));
        data.push(Store(0x44, 0x55));
    }
    function getData(uint slot) public view returns (bytes32 result) {
        assembly {
            mstore(0, data_slot)
            result := sload(add(keccak256(0,0x20),slot))
        }        
    }
    function getLength() public view returns(bytes32 result) {
        assembly {
            result := sload(data_slot)
        }
    }
}
