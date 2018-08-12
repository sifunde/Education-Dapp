pragma solidity ^0.4.0;

import './Sifunde_institution.sol';

contract escrow_assigner{
    // 
    
    mapping(address => address[])   address_of_institution_from_escrow_adress;
    mapping(address => address)     address_of_escrow_from_student_adress;
    
    event escrow_assigned(
        address     indexed     of_institution_as_principal, 
        address     indexed     of_escrow
    );
    
    function assign_escrow(address of_institution_as_principal, address of_escrow)
    public{
        address_of_institution_from_escrow_adress[of_escrow].push(
            of_institution_as_principal
        );
        address_of_escrow_from_student_adress[of_institution_as_principal] = of_escrow;
        emit escrow_assigned(of_institution_as_principal,of_escrow);
    }
    
}