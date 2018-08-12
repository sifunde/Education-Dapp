pragma solidity ^0.4.0;
//pragma experimental ABIEncoderV2;

import './Sifunde.sol';

contract paysheet_writer{
    // 
    mapping(address => Sifunde.value) uint_of_wage_from_teacher_address;
    
    event wage_assignment_successful(
        address     indexed     of_teacher, 
        address     indexed     as_member_of_institute
    );
    
    function assign_wage(address of_teacher, uint receiving_this_much, bytes3 symbol_of_currency)
    public{
        Sifunde.value memory
        value = Sifunde.value(
            receiving_this_much,
            symbol_of_currency
        );
        uint_of_wage_from_teacher_address[of_teacher] = value;
        emit wage_assignment_successful(of_teacher,msg.sender);
    }
    
}