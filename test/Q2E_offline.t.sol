// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Q2E_offline.sol";

contract Q2ETest is Test {
    Q2E public game;

    function setUp() public {

        lotto = new Q2E_offline(
            "BON LOTTO #0.1",
            "69",
            0x47E53f0Ddf71210F2C45dc832732aA188F78AA4f,
            0x26432f7cf51e644c0adcaf3574216ee1c0a9af6d,
            750000000000000000000,
            1000
        );

    }



}
