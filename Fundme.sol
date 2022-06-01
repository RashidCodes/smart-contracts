// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0;

// importing from the @chainlink/contracts npm package
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


// interface AggregatorV3Interface {
//   function decimals() external view returns (uint8);

//   function description() external view returns (string memory);

//   function version() external view returns (uint256);

//   // getRoundData and latestRoundData should both raise "No data present"
//   // if they do not have data to report, instead of returning unset values
//   // which could be misinterpreted as actual reported values.
//   function getRoundData(uint80 _roundId)
//     external
//     view
//     returns (
//       uint80 roundId,
//       int256 answer,
//       uint256 startedAt,
//       uint256 updatedAt,
//       uint80 answeredInRound
//     );

//   function latestRoundData()
//     external
//     view
//     returns (
//       uint80 roundId,
//       int256 answer,
//       uint256 startedAt,
//       uint256 updatedAt,
//       uint80 answeredInRound
//     );
// }


contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;

    /* 
    THE PAYABLE FUNCTION CAN BE USED TO PAY FOR THINGS
    -------------------------------------------
    Every single function call has an associated "value" with it. This value 
    is how much GWEI, WEI, FINNAY, or ETHER  you're gonna send with your function call or your
    transaction.
    */

    /* 
    CONTRACTS CAN OWN ETHER
    ------------------------
    After paying a contract, the contract owns the ether (wherever it's deployed).
    */

    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;

        // accepting other currencies: Read about Oracles like Chainlink
    }


    // call the version function on the Aggregator interface
    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }


    function getPrice() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 answer,,,) = priceFeed.latestRoundData();

       return uint256(answer * 10000000000); //180019000000 wei
    }

}
