// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

interface InterfaceWallet {
    function deposit(uint _amount) external;
}

contract Wallet is Ownable {
    address private _owner;
    uint private _balance;

    
    constructor(uint initialDeposit) {
        _balance = initialDeposit;
        _owner = msg.sender;
    }

    modifier enoughBalance(uint _amount) {
        require(_balance >= _amount, "The requested amount is higher than the wallet's balance");
        _;
    }
    
    event Deposit(uint amount);
    event Withdraw(address to, uint amount);
    event Transfer(address from, address to, uint amount);

    function deposit(uint _amount) external {
        _balance += _amount;
        emit Deposit(_amount);
    }

    function transferTo(address _to, uint _amount) external onlyOwner enoughBalance(_amount) {
        _balance -= _amount;
        InterfaceWallet(_to).deposit(_amount);
        emit Transfer(msg.sender, _to, _amount);
    }

    function getBalance() external view returns(uint) {
        return _balance;
    }
    
}