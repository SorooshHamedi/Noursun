// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

contract Wallet {
    address private _owner;

    constructor() {
        _owner = msg.sender;
    }

    event Withdraw(address receiver, uint amount);
    event Transfer(address from, address to, uint amount);
    
    modifier onlyOwner {
        require(msg.sender == _owner, "Only the owner has authority for this action.");
        _;
    }

    modifier enoughBalance(uint amount) {
        require(address(this).balance >= amount, "Not enough ether in account");
        _;
    }
    receive() external payable {
        //emit Deposit(msg.sender, msg.value);
    }

    function withdraw() onlyOwner enoughBalance(uint amount) public payable {
        payable(msg.sender).transfer(amount);
        event Withdraw(address receiver, uint amount);
    }

    function transferTo(address payable to, uint amount) onlyOwner enoughBalance(amount) external payable {
        to.transfer(amount);
        emit Transfer(_owner, to, msg.value);
    }
    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
