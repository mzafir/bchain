pragma solidity ^0.4.18;

contract Splitit {
    /* Constructor */

address [] employees = [0x2d67b2B46c305C82B0F06946B68df5E37478c0Ef,0x9692912619B70c92EC32938FC30015C4CA8e1d67, 0x2d67b2B46c305C82B0F06946B68df5E37478c0Ef, 0xf880a272FA0a2Fb9AA7E3D6Ca3EED3C8Ea765a17];
uint totalreceived;
mapping ( address => uint) withdrawnAmounts;

 function Splitit() payable {
     updatetotalfundsrecevied();
}

 function () payable {
    updatetotalfundsrecevied();
}

function updatetotalfundsrecevied () internal {

     totalreceived += msg.value;
     
 }

    modifier conWithdraw()  {
        bool contains = false;
        
        for (uint i=0; i<employees.length; i++)
        {
            if (employees[i]==msg.sender){
                contains=true;
            }
            
        }
        require(contains);
        _;
    }
    
     function withdraw(){
         uint amountallocated=totalreceived/employees.length;
         uint amountWithdrawn=withdrawnAmounts[msg.sender];
         uint amount=totalreceived - amountWithdrawn;
         withdrawnAmounts[msg.sender]=amountWithdrawn+amount;
         
         
         if (amount>0)
         {
             msg.sender.transfer(amount);
         }
     }
}





