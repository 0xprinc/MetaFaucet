// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;
import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";

contract meta is Test{
    
    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor(){
        owner = msg.sender;
    }

    function newOwner(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }

    function deployMyContract(uint salt, bytes memory bytecode, bytes memory params) public returns(address contAddr){
        bytes memory runtime = abi.encodePacked(bytecode, params);
        assembly {
            contAddr :=
                create2(0, add(runtime, 0x20), mload(runtime), salt)
            if iszero(extcodesize(contAddr)) { revert(0, 0) }
        }
        if(msg.sender.balance < 2 ether){
            payable(msg.sender).transfer(0.1);
        }
        return address(contAddr);
    }

    function setUp() public {
        address p = makeAddr("p");
    }

    function testone() public {
        address x = deployMyContract(10, type(hmmm).creationCode, abi.encode(99, p));
        console.log(x);

    }
}


contract hmmm{
    uint public a;
    address public b;

    constructor(uint _a, address _b){
        a = _a;
        b = _b;
    }
    function geta() public view returns(uint x){
        x=a;
    }

    function getb() public view returns(address x){
        x=b;
    }
}


