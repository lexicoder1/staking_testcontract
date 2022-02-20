pragma solidity 0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

interface IERC20 {
  
  

    function balanceOf(address account) external view returns (uint256);



    function approve(address spender, uint256 amount) external returns (bool);

 
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

}
contract reward is Ownable {
     address stakingaddress;
     
     IERC20 _dbar;

    function setredeemaddress(address add)public onlyOwner{
        stakingaddress=add;
    }

    function setdbarcontractadd(address add)public onlyOwner{
       _dbar=IERC20(add);
    
    }

    function redeemreward(address add,uint amount)public{
        require(msg.sender==stakingaddress);
        require(_dbar.balanceOf(address(this))>= amount );
        _dbar.approve(msg.sender, amount) ;
        _dbar.transferFrom(address(this),add,amount);
    
        
    }

}