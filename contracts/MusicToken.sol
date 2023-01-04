// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";//The contract is inheriting from the OpenZeppelin ERC20 contract
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
//first part shows the name and symbol of the token
contract MusicToken is ERC20, ERC20Burnable, Pausable, Ownable {
    constructor() ERC20("MusicToken", "MTT") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    } //constructor is used to specify initial values. only deployer can call the contract and can transfer initial values

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
//mint function has two argumants that are used for the address of reciver and the amount that is going to be exchanged.
    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
