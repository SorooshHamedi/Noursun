// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

import "./Wallet.sol";

contract User is Ownable {
    Wallet public wallet;
    address private _owner;

    struct Transaction {
        address from;
        address to;
        uint amount;
        uint transactionId;
    }

    Transaction[] public transactionPool;
    constructor (uint _initialDeposit, string memory _name) {
        wallet = new Wallet(_initialDeposit);
        _owner = msg.sender;
    }


}