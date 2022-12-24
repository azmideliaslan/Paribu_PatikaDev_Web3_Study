//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract feeCollector{
    address public owner; // Which adress user have 0xd2342342342asfawf    
    uint256 public balance;  // balance of money

    constructor(){
        owner = msg.sender;  //revealed our address 
    }

    receive() payable external{
        balance += msg.value;  //if money comes balance inc
    }

    function withdraw(uint amount, address payable destAddr) public{ 
        require(msg.sender == owner,"Only owner can withdraw"); // our code public so we have to use this funct for just user can manage balance
        require(amount <= balance, "Insufficient funds"); // balance has to be more then amount so we can send back
        destAddr.transfer(amount); // send funds to given address
        balance -= amount;
    }
}