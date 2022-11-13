@AbapCatalog.sqlViewName: 'ZV_HCM_IMG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'HCM - IMG Master'
define root view Z_I_HCM_MASTER_IMG
  as select from zhc_master_img as hcmmaster
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
