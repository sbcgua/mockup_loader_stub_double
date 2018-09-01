# Mockup loader addon: Stub implementation for *test double framwork*.

The addon to the [mockup_loader](https://github.com/sbcgua/mockup_loader) package. Implements interface stubbing via *test double framework* (as an alternative to the 'native' approach in the original package).

## Differences to the original mockup_loader

This code was actually the first verison of the stubbing feature. However, *test double framework* is not available on systems below 7.4 so *'native'* stubbing was also implemented via dynamic `generate subroutine pool` and became the default way. The test double code was saved to this repository, you can use it if you prefer test double way for any reason.

It is a lightweight 'addon' that just redefines a couple of factory methods but works in a similar way. So the only difference from test code perspective would be **the name of the factory class**. Below is the code example (for complete code examples and API reference see the original package documentation).

```abap
  data lo_factory type ref to zcl_mockup_loader_dbl_factory. " <<< THIS IS THE DIFFERENCE
  data lo_ml      type ref to zcl_mockup_loader.
  
  lo_ml = zcl_mockup_loader=>create( ... ).

  create object lo_factory
    exporting
      io_ml_instance   = lo_ml
      i_interface_name = 'ZIF_MOCKUP_LOADER_STUB_DUMMY'. " <YOUR INTERFACE TO STUB>

  " Connect one or MANY methods to respective mockups 
  lo_factory->connect_method( ... ).

  " Generate stub - internally the instance created by test double
  data li_ifstub type ref to ZIF_MOCKUP_LOADER_STUB_DUMMY. 
  li_ifstub ?= lo_dc->generate_stub( ).

  " Pass the stub to code-under-test
  ...
```
## License

The code is licensed under MIT License, same as the original mockup loader.
