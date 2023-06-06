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

}
