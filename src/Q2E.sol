// SPDX-License-Identifier: GNU
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Q2E {
    bytes32 private salt = bytes32("changeThisBeforeDeploying"); // --- CHANGE THIS BEFORE DEPOLY ---
    bytes32 public hashedAnswer;
    string public question;
    address public erc20contract;
    address public taxWallet;
    uint256 public erc20Price;
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
        uint _erc20Price, 
        uint _erc20Fee
        ){
        question = _question; // "xx?"
        hashedAnswer = _hashedAnswer; // "xx"
        erc20contract = _erc20contract; // 0x47E53f0Ddf71210F2C45dc832732aA188F78AA4f // BON/WMATIC
        taxWallet = _taxWallet; // 0xb1a23cD1dcB4F07C9d766f2776CAa81d33fa0Ede // bonDevs
        erc20Price = _erc20Price; // 10000000000000000000000 // 10_000 tokens
        erc20Fee = _erc20Fee; // 1000 // 10% of erc20 price (1,000/10,000)
        guessCounter = 0;
    }

    function guess(string calldata answer) public{
        // emit the guess so that it can be recorded on the frontend (and help future guesses)
        emit AnswerGuessed(answer);
        emit QuizFunded(IERC20(erc20contract).balanceOf(msg.sender));

        // require erc20Price && convert FEE to MATIC && send to taxWallet
        
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
