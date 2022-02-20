pragma solidity 0.8.0; 
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


contract staking is ERC20("XDbar", "xDbar"), Ownable {
    IERC20 _dbar;

    mapping (address=>uint) trackblock;

     
    function setdbarcontractadd(address add)public onlyOwner{
       _dbar=IERC20(add);
    
    }

   function stake(uint amount)public{
        require(_dbar.balanceOf(msg.sender)>= amount );
        msg.sender[]
         _mint(msg.sender, amount);

         _dbar.transfer(address(this),amount);
   
    }   



   function redeem()public{


}
}