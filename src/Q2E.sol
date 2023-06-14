// SPDX-License-Identifier: GNU
pragma solidity ^0.8.13;

/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-. */
/* -.-.-.-.-.-. BANK OF NOWHERE LOTTO v0.1 -.-.-.-.-.-. */
/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-. */

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Q2E {
// might want to move this into the constructor? for privacy--- also need to make a note in the JS to try obfuscate it
    bytes32 private salt = bytes32("changeThisBeforeDeploying"); // --- CHANGE THIS BEFORE DEPOLY ---
    bytes32 public hashedAnswer;
    string public question;
    address public erc20contract;
    address public taxWallet;
    uint256 public erc20BasePrice;
    uint256 public erc20Fee;
    uint256 public guessCounter;

    event QuizFunded(uint amount);
    event AnswerGuessed(string guess);
    event AnswerCorrect(uint winnings);

    constructor(
        string memory _question, 
        bytes32 _hashedAnswer, 
        address _erc20contract, 
        address _taxWallet, 
        uint _erc20BasePrice, 
        uint _erc20Fee
        ){
        question = _question; // "xx?"
        hashedAnswer = _hashedAnswer; // "xx"
        erc20contract = _erc20contract; // 0x47E53f0Ddf71210F2C45dc832732aA188F78AA4f // BON/WMATIC
        taxWallet = _taxWallet; // 0xb1a23cD1dcB4F07C9d766f2776CAa81d33fa0Ede // bonDevs
        erc20BasePrice = _erc20BasePrice; // 3000000000000000000000 // 3,000 tokens
        erc20Fee = _erc20Fee; // 1000 // 10% of erc20 price (1,000/10,000)
    }

    function currentPrice() public view returns(uint256){
        uint price = (
            IERC20(erc20contract).balanceOf(address(this)) +
            (IERC20(erc20contract).balanceOf(address(this)) * erc20Fee)
        );















        
        return price;
    }
    
    function guess(string calldata answer) public{
        // require erc20Price transfer
        // all users must APPROVE staking contract to use erc20 before v-this-v can work
        uint256 price = currentPrice();

        bool success = IERC20(erc20contract).transferFrom(msg.sender, address(this), erc20Price);
        require(success == true, "transfer failed!");

        // convert FEE to MATIC && send to taxWallet
        
        // emit the guess so that it can be recorded on the frontend (and help future guesses)
        emit AnswerGuessed(answer);
        emit QuizFunded(IERC20(erc20contract).balanceOf(msg.sender));
        
        // compare answer and see if its a winner
        if(keccak256(abi.encodePacked(salt, answer)) == hashedAnswer){
            payable(msg.sender).transfer(address(this).balance);
            emit AnswerCorrect(winnings);
        }
    }

    fallback() external payable{
    }
    receive() external payable{
    }

}
