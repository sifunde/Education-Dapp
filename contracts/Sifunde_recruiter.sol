pragma solidity ^0.4.0;

contract recruiter{
    // 
    
    mapping(address => address[])   addresses_of_teachers_from_institution_address;
    mapping(address => address)     address_of_institution_from_teacher_address;
    
    event recruitment_successful(
        address     indexed     of_teacher, 
        address     indexed     as_academic_of_institute
    );
    
    function recruit(address of_account_as_academic, address of_institution)
    public{
        addresses_of_teachers_from_institution_address[of_institution].push(
            of_account_as_academic
        );
        address_of_institution_from_teacher_address[of_account_as_academic] = of_institution;
        emit recruitment_successful(of_account_as_academic,of_institution);
    }
    
    function get_addresses_of_teachers(address of_account) 
    public view returns(address[]){
        return addresses_of_teachers_from_institution_address[of_account];
    }
    
    function query_for_academic_relationship(
        address of_account_as_academic, address of_institution
    )
    public view returns(bool){
        return 
            address_of_institution_from_teacher_address[
                of_account_as_academic
            ] == of_institution;
    }
    
}