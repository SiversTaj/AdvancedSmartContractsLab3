pragma solidity >=0.5.0 <0.7.0;

contract Storage {
    bytes4 bytes4data = 0xaabbccdd;
    uint72 uintdata = 0x123456;
    bool booldata = true;
    address addrdata = 0xdC962cEAb6C926E3a9B133c46c7258c0E371b82b;

    function getData() public view returns (bytes4 output1, uint64 output2, bool output3, address output4)
    {
        assembly {
            let resultA := sload(bytes4data_slot)
            let resultB := sload(uintdata_slot)
            let result1 := shl(224, and(resultA, 0xffffffff))
            let result := shr(shl(3, uintdata_offset), resultB)
            let resultC := sload(booldata_slot)
            let resultD := sload(addrdata_slot)

            mstore(0x20, result1)
            mstore(0x20, result)
            mstore(0x20, resultC)
            mstore(0x20, resultD)

            output1 := result1
            output2 := result
            output3 := resultC
            output4 := resultD

        }
    }
}