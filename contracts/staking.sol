pragma solidity 0.8.0; 
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

interface Ireward{
    function redeemreward(uint amount)external;
}


contract staking is ERC20("XDbar", "xDbar"), Ownable {
    IERC20 _dbar;
    Ireward _Ireward;

    mapping (address=>uint) trackblock;

    mapping(address=>bool)checkifstaked;

     
    function setdbarcontractadd(address add)public onlyOwner{
       _dbar=IERC20(add);
    
    }
    function setrewardaddress(address add)public onlyOwner{
       _Ireward=Ireward(add);
    }

   function stake(uint amount)public{
        require(_dbar.balanceOf(msg.sender)>= amount*10**18 );
        require(checkifstaked[msg.sender]==false);
        trackblock[msg.sender]=block.number;
         _mint(msg.sender, amount*10**18);
         checkifstaked[msg.sender]=true;
         _dbar.transfer(address(this),amount*10**18);
   
    }   



   function redeem()public{
     require(checkifstaked[msg.sender]==true);
  
     uint rewardblockno= block.number- trackblock[msg.sender];
     uint reward=rewardblockno*(10*10**18);
     uint _reward= balanceOf(msg.sender)+reward;
      checkifstaked[msg.sender]=false;
     _burn(msg.sender,balanceOf(msg.sender));
     _Ireward.redeemreward(reward);
     _dbar.approve(msg.sender, _reward) ;
     _dbar.transferFrom(address(this),msg.sender,_reward);

   }

}