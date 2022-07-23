// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

// import simple storage
import "./SimpleStorage.sol";


// Deploy a contract from contract

contract StorageFactory is SimpleStorage{ // inheritance using the "is" keyword

    // addresses the SimpleStorage contract was deployed to
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function storageFactoryStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // In order for us to interact with a contract, we need
        // Address
        // ABI 

        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])); // returns the simple storage "class"/contract

        // now we can call any of the functions 
        simpleStorage.store(_simpleStorageNumber);

    }


    function storageFactoryGet(uint256 _simpleStorageIndex) public view returns (uint256){
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));

        return simpleStorage.retrieve();
    }
}
