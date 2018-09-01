class ZCL_MOCKUP_LOADER_DBL_FACTORY definition
  public
  inheriting from ZCL_MOCKUP_LOADER_STUB_FACTORY
  final
  create public
  for testing .

public section.

  methods GENERATE_STUB
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_MOCKUP_LOADER_DBL_FACTORY IMPLEMENTATION.


method GENERATE_STUB.
  data li_connector type ref to if_abap_testdouble_answer.
  create object li_connector type zcl_mockup_loader_stub_double
    exporting
      it_config = mt_config
      io_ml     = mo_ml.

  r_stub ?= cl_abap_testdouble=>create( object_name = mv_interface_name ).

  field-symbols <conf> like line of mt_config.
  loop at mt_config assigning <conf>.
    data lt_dummy_params type abap_parmbind_tab.
    data lv_invoke_name  type abap_methname.
    lt_dummy_params = generate_params( id_if_desc = md_if_desc i_method = <conf>-method_name ).
    lv_invoke_name  = mv_interface_name && '~' && <conf>-method_name.

    cl_abap_testdouble=>configure_call( r_stub )->ignore_all_parameters( )->set_answer( li_connector ).
    call method r_stub->(lv_invoke_name) parameter-table lt_dummy_params.
  endloop.
endmethod.
ENDCLASS.
