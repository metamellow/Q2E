// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Q2E.sol";

contract Q2ETest is Test {
    Q2E public q2e;

    function setUp() public {
        // create a question
        string memory question = "2 * 2 = ";
        string memory answer = "4";
        bytes32 salt = bytes32("69420");
        bytes32 hashedAnswer = keccak256(abi.encodePacked(salt, answer));
        emit log_bytes32(hashedAnswer);
    }

    function testtrue() public {
        assertTrue(true);
    }
}
