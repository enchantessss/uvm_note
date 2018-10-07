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

uvm_config_db#(int)::set(this, "env.i_agt.drv", "key", 100);
uvm_config_db#(int)::get(this, "", "key", var);

-- get_full_name
`uvm_info("FULL_NAME_DISPLAY", $sformatf("the full name of current component is %s", get_full_name()), UVM_LOW);

// function phase
build_phase
connect_phase
end_of_elaboration_phase
start_of_simulation_phase
    // task phase
    pre_reset_phase
    reset_phase
    post_reset_phase
    pre_configure_phase
    configure_phase
    post_configure_phase
    pre_main_phase
    main_phase
    post_main_phase
    pre_shutdown_phase
    shutdown_phase
    post_shutdown_phase
// function phase
extract_phase
check_phase
report_phase
final_phase


phase.jump(uvm_reset_phase::get());
phase.jump(uvm_phase phase);
phase can be:
    uvm_build_phase::get();
    uvm_connect_phase::get();
    ...
    uvm_run_phase::get();
    ...
    uvm_final_phase::get();


in testcase's build_phase can set:
    uvm_top.set_timeout(500ns,0);
or use command:
    ./simv +UVM_TIMEOUT="700ns,YES" // <time>,<overridable>
