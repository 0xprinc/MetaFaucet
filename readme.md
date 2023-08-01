# MetaFaucet 

Introducing a new type of testnet token faucet. To support developers who don't have test tokens for testing onchain stuff.<br>
Thanks to [ERC4337(Account Abstraction)](https://eips.ethereum.org/EIPS/eip-4337) :)  <br>
__Metafaucet uses the SmartAccount as the token reserves and supplies the gas fees to the transaction the developer wants to make.__

## Proof Of Concept
Brief overview of how the whole MetaFaucet is gonna work.<br>
<img width="680" alt="Screenshot 2023-07-27 at 6 25 37 PM" src="https://github.com/0xprinc/MetaFaucet/assets/82727098/ab3a9f0f-75cb-4993-bc19-d2bd792fd7fa">

## To-Do
- [x] Make the `Metafaucet` contract (brain of the whole project)
- [x] Make the deployer contract that will act as the owner of the required contract by the user
- [x] Get the `EntryPoint` and `SmartAccount` contract 
- [ ] Set authorizations related to the `SmartAccount` contract
- [ ] Connect all the contracts inside the Metafaucet contract
