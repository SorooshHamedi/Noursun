// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

import "./Ownable.sol";

/**
@title Network

**/
contract Pool {
    ///@dev inherits OpenZepplin's Ownable contract
    struct Transaction {
        address id1;
        address id2;
        uint32 transferId;
        uint amount;
    }
    uint32 transferId = 0;
    address validator;

    function setValidator(address _address) public {
        validator = _address;
    }

    Transaction[] public transactions;
    modifier onlyValidator() {
        require(msg.sender == validator, "Only the validator can add transactions");
        _;
    }
    function addTransaction(address id1, address id2, uint amount) onlyValidator internal {
        transferId++;
        transactions.push(Transaction(id1, id2, transferId, amount));
    }
    

}
