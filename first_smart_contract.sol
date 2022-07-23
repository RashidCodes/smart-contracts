// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// you can also specify other versions like this
// pragma solidity >=0.6.0 <0.9.0 (versions greater than or equal to 0.6.0 and less than 0.9.0


// create a contract: Similar to a class in JS
contract SimpleStorage {

    // let's go into some of the types of solidity
    // bool favouriteBool = false;
    // string favouriteString = "String";
    // int256 favouriteInt = -5; // can be positive/negative
    // address favouriteAddress = 0x274f5eE14cCc95a092C05a84e4fdD29a8E33D9Dd;
    // bytes32 favouriteBytes = "cat";


    // Automatically initialised to 0
    uint256 favouriteNumber; // this technically is a view function

    // Structs 
    struct People {
        uint256 favouriteNumber;
        string name;
    }

    
    // create a list of People 
    People[] public people;

    // a mapping (hash map)
    mapping(string => uint256) public nameToFavouriteNumber;

    // you can also create arrays of a fixed size 
    // People[1] public people;


    // assign a value to favouriteNumber
    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }

    // non-state changing keywords: view, pure
    function retrieve() public view returns(uint256) {
        return favouriteNumber;
    }

    /* Memory: The data will only be stored during the execution of the function or contract call
       Storage: The data will persist even after the function executes

       If you use a string parameter for one of your functions, you need to 
       give it a type of string memory
    */
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        people.push(People(_favouriteNumber, _name));

        // add to the mapping 
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }

    // pure functions are functions that basically do some type of math 
    // function do_some_math(uint256 favouriteNumber) public pure {
    //     favouriteNumber + 2;
    // }

}



