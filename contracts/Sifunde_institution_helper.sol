pragma solidity ^0.4.0;

import './Sifunde_registrator.sol';
import './Sifunde_recruiter.sol';
import './Sifunde_paysheet_writer.sol';
import './Sifunde_enroller.sol';
import './Sifunde_attendance_storer.sol';

contract institution{
    // 
    paysheet_writer
    use_paysheet_writer_to      = paysheet_writer(0x0);
    
    registrator 
    use_registrator_to          = registrator(0x0);
    
    recruiter 
    use_recruiter_to            = recruiter(0x0);
    
    enroller 
    use_enroller_to             = enroller(0x0);
    
    attendance_storer 
    use_attendance_storer_to    = attendance_storer(0x0);
    
    modifier must_have_registered_as_student(address of_account){
        require(use_registrator_to.get_actor_role(of_account) == 1);
        _;
    }
    
    modifier must_have_registered_as_teacher(address of_account){
        require(use_registrator_to.get_actor_role(of_account) == 2);
        _;
    }
    
    modifier must_have_academic_relationship(
        address of_account_as_academic, address of_institution
    ){
        require(
            use_recruiter_to.query_for_academic_relationship(
                of_account_as_academic,
                of_institution
            )
        );
        _;
    }
    
    modifier must_have_pupil_relationship(
        address of_account_as_pupil, address of_teacher
    ){
        require(
            use_enroller_to.query_for_pupil_relationship(
                of_account_as_pupil,
                of_teacher
            )
        );
        _;
    }
    
    function hire_as_teacher(address of_account,uint receiving_this_much,bytes3 symbol_of_currency)
        must_have_registered_as_teacher(of_account)
    public{
        use_recruiter_to.recruit(of_account,msg.sender);
        use_paysheet_writer_to.assign_wage(of_account, receiving_this_much, symbol_of_currency);
    }
    
    function acknowledge_teacher_attendance(address of_account)
        must_have_registered_as_teacher(of_account)
    public{
        use_attendance_storer_to.store_attendance(of_account);
    }
    
    function matriculate_as_student(address of_account_as_pupil, address of_teacher)
        must_have_registered_as_student(of_account_as_pupil)
        must_have_registered_as_teacher(of_teacher)
    public{
        use_enroller_to.enroll(of_account_as_pupil, of_teacher);
    }
    
    function acknowledge_student_attendance(address of_account_as_pupil, address of_teacher)
        must_have_registered_as_student(of_account_as_pupil)
        must_have_registered_as_teacher(of_teacher)
        must_have_pupil_relationship(of_account_as_pupil, of_teacher)
    public{
        use_attendance_storer_to.store_attendance(of_account_as_pupil);
    }
    
    function get_enrollment(){
        use_recruiter_to.get_addresses_of_teachers(msg.sender);
    }
}