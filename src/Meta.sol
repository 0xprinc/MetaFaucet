contract Meta is {
    
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
            payable(msg.sender).transfer(0.1 ether);
        }
        return address(contAddr);
    }
}
