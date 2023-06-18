// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Q2E.sol";

contract Q2ETest is Test {
    Q2E public game;

    function setUp() public {
        // create a question
        string memory question = "2 * 2 = ";
        string memory answer = "4";
        // salt is needed bc need to hash answer provided
        bytes32 salt = bytes32("changeThisBeforeDeploying");
        bytes32 hashedAnswer = keccak256(abi.encodePacked(salt, answer));
        emit log_bytes32(hashedAnswer);

        //start game
        game = new Q2E(question, hashedAnswer);
        emit log(game.question());
    }

    function testPass() public {
        assertTrue(true);
    }

    function testFail() public{
        game.guess("1");
    }

    function test_QuizPass() public{
        uint256 beginBalance = address(this).balance;
        vm.deal(address(game), 1_000 ether);
        game.guess("4");
        assertEq(address(this).balance, beginBalance + 1_000 ether);
    }

    fallback() external payable{}
    receive() external payable{}


}
