class lcl_mockup_dbl_factory_test definition final
  for testing
  duration short
  risk level harmless.

  public section.
    constants c_base_test_class
      type string
      value '\CLASS-POOL=ZCL_MOCKUP_LOADER_STUB_FACTORY\CLASS=LCL_TEST_BASE'.

  private section.
    methods main_test_double for testing.
endclass.

class lcl_mockup_dbl_factory_test implementation.

  method main_test_double.
    call method (c_base_test_class)=>('MAIN_TEST')
      exporting
        lv_factory_classname = 'ZCL_MOCKUP_LOADER_DBL_FACTORY'.
  endmethod.

endclass.
