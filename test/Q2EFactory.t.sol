// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Q2EFactory.sol";

contract Q2EFactoryTest is Test {

    Q2EFactory public factory;

    function setUp() public {
        factory = new Q2EFactory();
    }

}
