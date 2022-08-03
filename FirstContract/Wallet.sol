// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

contract Wallet {
    address payable private _owner;

    constructor() {
        _owner = payable(msg.sender);
    }

    event Deposit(address to, uint amount);
    event Withdraw(address to, uint amount);
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
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) external payable onlyOwner enoughBalance(amount)  {
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }

    function transferTo(address payable to, uint amount) external payable onlyOwner enoughBalance(amount)  {
        to.transfer(amount);
        emit Transfer(_owner, to, msg.value);
    }
    function getBalance() public view returns(uint256) {
        return _owner.balance;
    }
}
