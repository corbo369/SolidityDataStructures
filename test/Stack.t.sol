// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Stack.sol";

contract StackTest is Test {
    StackTester public stack;

    function setUp() public {
        stack = new StackTester();
    }

    function testPush(uint128 x) public {
        stack.addToStack(x);
        assertEq(stack.getTopItem(), x);
        assertEq(stack.count(), 1);
    }

    function testEmptyPop() public {
        vm.expectRevert();
        stack.removeTopItem();
    }

    function testAddOnePop(uint128 x) public {
        stack.addToStack(x);
        stack.removeTopItem();
        assertEq(stack.count(), 0);
    }
}
