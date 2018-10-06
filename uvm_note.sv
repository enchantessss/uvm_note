`uvm_info("MY_INFO1", $sformatf("val: %0d",val), UVM_LOW);
`uvm_warning("MY_WARNING1", "This is a Warning");
`uvm_error("MY_ERROR", "This is an error");
`uvm_fatal("MY_FATAL", "A fatal error has occurred");

`define uvm_field_int(ARG,FLAG)
`define uvm_field_real(ARG,FLAG)
`define uvm_field_enum(T,ARG,FLAG)
`define uvm_field_object(ARG,FLAG)
`define uvm_field_event(ARG,FLAG)
`define uvm_field_string(ARG,FLAG)

For enum type:
    typedef enum {TB_TRUE,TB_FALSE} tb_bool_e;
    ...
    tb_bool_e var_i;
    ...
    `uvm_field_enum(tb_bool_e, var_i, UVM_ALL_ON);

For array[]
`define uvm_field_array_int(ARG,FLAG)
`define uvm_field_array_enum(ARG,FLAG)
`define uvm_field_array_object(ARG,FLAG)
`define uvm_field_array_string(ARG,FLAG)


For array[N]
`define uvm_field_sarray_int(ARG,FLAG)
`define uvm_field_sarray_enum(ARG,FLAG)
`define uvm_field_sarray_object(ARG,FLAG)
`define uvm_field_sarray_string(ARG,FLAG)

For queue[$]
`define uvm_field_queue_int(ARG,FLAG)
`define uvm_field_queue_enum(ARG,FLAG)
`define uvm_field_queue_object(ARG,FLAG)
`define uvm_field_queue_string(ARG,FLAG)

For like bit[63:0] assoc[bit[63:0]] associate array, 1st para is store_type, 2nd para is index_type
`define uvm_field_aa_int_string(ARG,FLAG)
`define uvm_field_aa_string_string(ARG,FLAG)
`define uvm_field_aa_object_string(ARG,FLAG)
`define uvm_field_aa_int_int(ARG,FLAG)
`define uvm_field_aa_int_int_unsinged(ARG,FLAG)
`define uvm_field_aa_int_integer(ARG,FLAG)
`define uvm_field_aa_int_integer_unsigned(ARG,FLAG)
`define uvm_field_aa_int_byte(ARG,FLAG)
`define uvm_field_aa_int_byte_unsigned(ARG,FLAG)
`define uvm_field_aa_int_shortint(ARG,FLAG)
`define uvm_field_aa_int_shortint_unsigned(ARG,FLAG)
`define uvm_field_aa_int_longint(ARG,FLAG)
`define uvm_field_aa_int_longint_unsigned(ARG,FLAG)
`define uvm_field_aa_string_int(ARG,FLAG)
`define uvm_field_aa_string_object(ARG,FLAG)


Example: Grep
    grep apple fruitlist.txt
    grep -i apple fruitlist.txt
    grep -nr apple *
    
    -A num, --after-context=num: 
    -B num, --before-context=num:
    -i, --ignore-case:
    -n, --line-number:
    -R, -r, --recursive:
    -v, --invert-match:

Example: filter pineapple
    grep apple fruitlist.txt | grep -v pineapple

in base_test or testcase 's build_phase();
...
set_report_max_quit_count(num);
..
