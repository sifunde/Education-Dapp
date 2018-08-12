pragma solidity ^0.4.0;

import './Sifunde.sol';
import './Sifunde_registrator.sol';

contract enroller{
    // 
    
    using Sifunde for Sifunde.role;
    
    mapping(address => address[])   addresses_of_students_from_teacher_adress;
    mapping(address => address)     address_of_teacher_from_student_adress;
    
    event enrollation_successful(
        address     indexed     of_student, 
        address     indexed     as_pupil_of_teacher
    );
    
    function enroll(address of_student_as_pupil, address of_teacher)
    public{
        addresses_of_students_from_teacher_adress[of_teacher].push(
            of_student_as_pupil
        );
        address_of_teacher_from_student_adress[of_student_as_pupil] = of_teacher;
        emit enrollation_successful(of_student_as_pupil,of_teacher);
    }
    
    function get_addresses_of_pupils(address of_teacher) 
    public view returns(address[]){
        return addresses_of_students_from_teacher_adress[of_teacher];
    }
    
    function query_for_pupil_relationship(address of_account_as_pupil,address of_teacher)
    public view returns(bool){
        return address_of_teacher_from_student_adress[of_account_as_pupil] == of_teacher;
    }
}