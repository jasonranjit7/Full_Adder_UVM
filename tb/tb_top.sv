`include "uvm_macros.svh"
//import uvm_pkg::*
`include "interface.sv"
`include "../test/test.sv"
module top();
  
  adder_interface intf();
  
  initial begin
    uvm_config_db#(virtual adder_interface)::set(null, "*", "vif", intf);
    run_test("adder_test");
  end
  
  full_adder dut(.a(intf.a),
                 .b(intf.b),
                 .cin(intf.cin),
                 .sum(intf.sum),
                 .cout(intf.cout)
                );
  
endmodule
  
