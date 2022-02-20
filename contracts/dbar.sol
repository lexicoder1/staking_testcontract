pragma solidity 0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract dbar is ERC20{

    constructor(uint amount)ERC20("dbar","dbar"){
      _mint(msg.sender ,amount*10**18);
    }

}