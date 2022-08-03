// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface InterfaceWallet {
    function deposit(uint _amount) external;
}

contract TestToken is ERC20 {
    string private _name;
    mapping(address => uint256) private _balances;

    constructor() {
        _name = "TestToken";
    }

    modifier notBurnAddress(address _address) {
        require(_address != address(0));
        _;
    }
    
    function name() public view returns (string) {
        return _name;
    }
    //function symbol() public view returns (string)
    function decimals() public view returns (uint8)
    function totalSupply() public view returns (uint256)
    function balanceOf(address _owner) public view returns (uint256 balance)
    function transfer(address _to, uint256 _value) public returns (bool success)
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
    function approve(address _spender, uint256 _value) public returns (bool success)
    function allowance(address _owner, address _spender) public view returns (uint256 remaining)

    
}