// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract BuyMeACoffee {
    struct Coffee {
        address sender;
        string message;
        uint256 timestamp;
    }

    uint256 totalCoffee;
    address payable owner;

    event NewCoffee(address indexed sender, uint256 timestamp, string message);

    constructor() {
        owner = payable(msg.sender);
    }

    function buyMeACoffee (
        string memory _message
    ) payable public {
        require(msg.value > 0 ether, "You need to send some ether");

        totalCoffee += 1;

        payable(owner).transfer(msg.value);
        
        emit NewCoffee(msg.sender, block.timestamp, _message);
    }

    function getTotalCoffee() public view returns (uint256) {
        return totalCoffee;
    }
}