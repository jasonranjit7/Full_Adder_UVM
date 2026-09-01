`include "sequencer.sv"
`include "monitor.sv"
`include "driver.sv"

class adder_agent extends uvm_agent;
  `uvm_component_utils(adder_agent)
  
  adder_seqr seqr;
  adder_monitor mon;
  adder_driver drv;
  
  function new(string name = "adder_agent", uvm_component parent = null);
    super.new(name,parent);
    `uvm_info("AGENT", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT", "build phase", UVM_MEDIUM);
    seqr = adder_seqr::type_id::create("seqr", this);
    mon = adder_monitor::type_id::create("mon", this);
    drv = adder_driver::type_id::create("drv", this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT", "connect phase", UVM_MEDIUM)
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
endclass
