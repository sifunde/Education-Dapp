pragma solidity ^0.4.0;

import './Sifunde.sol';

contract registrator{
    
    mapping(address => Sifunde.role) role_of_actor_type_from_address;
    
    event successful_registration(
        address         indexed     registered_account,
        Sifunde.role    indexed     registered_as
    );
    
    function register(address of_account, Sifunde.role of_actor_type) 
    public{
        role_of_actor_type_from_address[of_account] = of_actor_type;
        emit successful_registration(of_account, of_actor_type);
    }
    
    function get_actor_role(address of_account) 
    public view returns(uint8){
        return uint8(role_of_actor_type_from_address[of_account]);
    }
    
}