// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./LinkedListCell.sol";

abstract contract Stack {

    LinkedListCell private topCell;

    mapping(uint128 => LinkedListCell) private getCellFromNext;

    uint128 private seed = 1;

    uint256 public count;

    function push(uint256 x) internal {
        LinkedListCell memory newCell = LinkedListCell(seed, topCell.index, x);
        getCellFromNext[seed] = newCell;
        topCell = newCell;
        seed++;
        count++;
    }

    function peek() internal view returns (uint256) {
        if(count == 0) revert();
        return topCell.data;
    }

    function pop() internal returns (uint256) {
        uint256 x = peek();
        topCell = getCellFromNext[topCell.next];
        count--;
        return x;
    }
}

contract StackTester is Stack {

    function addToStack(uint256 x) public {
        push(x);
    }

    function getTopItem() public view returns (uint256 topItem){
        topItem = peek();
    }

    function removeTopItem() public returns (uint256 topItem) {
        topItem = pop();
    }
}
