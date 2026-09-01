`include "../sequence_item.sv"
class adder_seqr extends uvm_sequencer#(adder_seq_item);
  `uvm_component_utils(adder_seqr)
  
  function new(string name = "adder_seqr", uvm_component parent = null);
    super.new(name,parent);
    `uvm_info("SEQUENCER", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SEQUENCER", "build phase", UVM_MEDIUM)
  endfunction
  
endclass
