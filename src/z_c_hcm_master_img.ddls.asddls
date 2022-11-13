@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'HCM - IMG Master'
@Metadata.allowExtensions: true
define root view entity Z_C_HCM_MASTER_IMG
  as projection on Z_I_HCM_MASTER_IMG
{
      //      @ObjectModel.text.element: ['Employeenumber']
  key e_number       as Employeenumber,
      e_name         as EmployeeName,
      e_department   as EmployeeDepartment,
      status         as EmployeeStatus,
      job_title      as JobTitle,
      start_date     as StartDate,
      end_date       as EndDate,
      email          as Email,
      //      @ObjectModel.text.element: ['Employeename']
      m_number       as ManagerNumber,
      m_name         as ManagerName,
      m_departament  as ManagerDepartament,
      @Semantics.user.createdBy: true
      crea_date_time as CreateOn,
      crea_uname     as CreateBy,
      @Semantics.user.lastChangedBy: true
      lchg_date_time as ChangeON,
      lchg_uname     as Changedby
}
