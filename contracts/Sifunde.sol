pragma solidity ^0.4.0;

library Sifunde{
    
    enum role{parent,student,teacher,donor,auditor,provider}
    // enumerations are implemented with unsigned integers
    // of the smallest size necessary. Uint8 in this case.
    // parent   -> 0
    // student  -> 1
    // teacher  -> 2
    // donor    -> 3
    // auditor  -> 4
    // provider -> 5
    
    struct value{
        uint    this_much;
        bytes3  symbol_of_currency;
    }
    
}