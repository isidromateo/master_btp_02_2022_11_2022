@AbapCatalog.sqlViewName: 'ZV_EMPL_IMG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'HCM - IMG Master'
define root view Z_I_EMPLOYEE_IMG
  as select from zemployee_img as employee
{
  key e_number,
      e_name,
      e_department,
      status,
      job_title,
      start_date,
      end_date,
      email,
      m_number,
      m_name,
      m_departament,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname
}
