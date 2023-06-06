// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;



contract Q2E {
    bytes32 public salt = bytes32("6942069");
    bytes32 public hashedAnswer;
    string public question;

    constructor(string memory _question, bytes32 _hashedAnswer){
        question = _question;
        hashedAnswer = _hashedAnswer;
    }

    function guess(string calldata answer) public{
        require(keccak256(abi.encodePacked(salt, answer)) == hashedAnswer);
        if(address(this).balance > 0){
            payable(msg.sender).transfer(address(this).balance);
        }
    }

}
