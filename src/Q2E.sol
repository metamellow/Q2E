// SPDX-License-Identifier: GNU
pragma solidity ^0.8.13;

/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-. */
/* -.-.-.-.-.-. BANK OF NOWHERE LOTTO v0.1 -.-.-.-.-.-. */
/* -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-. */

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Router.sol";

contract Q2E {
    bytes32 private salt = bytes32("changeThisBeforeDeploying"); // --- CHANGE THIS BEFORE DEPOLY ---
    bytes32 public hashedAnswer;
    string public question;
    address public erc20contract;
    address public taxW;
    uint256 public erc20Base;
    uint256 public erc20Fee;
    uint256 public counter;
    
    event QuizFunded(uint amount);
    event AnswerGuessed(string guess);
    event AnswerCorrect(uint winnings);

    constructor(
        string memory _question, 
        bytes32 _hashedAnswer, 
        address _erc20contract, 
        address _taxW, 
        uint _erc20Base, 
        uint _erc20Fee
        ){
        question = _question; // "xx?"
        hashedAnswer = _hashedAnswer; // "xx"
        erc20contract = _erc20contract; // "0x47E53f0Ddf71210F2C45dc832732aA188F78AA4f" BON/WMATIC
        taxW = _taxW; // "0xb1a23cD1dcB4F07C9d766f2776CAa81d33fa0Ede" bonDevs
        erc20Base = _erc20Base; // "750000000000000000000" 750 tokens ~$4
        erc20Fee = _erc20Fee; // "1000" 10% of erc20 price (1,000/10,000)
        counter = 1;
    }

    function currentPrice() public view returns(uint256){
        uint price = (counter * erc20Base);
        return price;
    }
    
    function guess(string calldata answer) public{
        uint256 price = currentPrice();

        // all USERS must APPROVE lotto contract to use erc20 before v-this-v can work
        bool paymentTxn = IERC20(erc20contract).transferFrom(msg.sender, address(this), price);
        require(paymentTxn == true, "transfer failed!");

        uint256 tax = price * erc20Fee / 10000;
        uint256 payment = price - tax;

        // DEVS must APPROVE uniswap to use contracts erc20 before v-this-v can work
        bool taxTxn = IERC20(erc20contract).transferFrom(msg.sender, taxW, tax);
        require(taxTxn == true, "transfer failed!");

        // emit the guess so that it can be recorded on the frontend (and help future guesses)
        emit AnswerGuessed(answer);
        emit QuizFunded(IERC20(erc20contract).balanceOf(msg.sender));
        
        // compare answer and see if its a winner
        if(keccak256(abi.encodePacked(salt, answer)) == hashedAnswer){
            payable(msg.sender).transfer(address(this).balance);
            emit AnswerCorrect(winnings);
        }
    }

    function bonFundsConvert() public{

    }

    fallback() external payable{
    }
    receive() external payable{
    }

}
