`include "../agent/agent.sv"
`include "scoreboard.sv"
class adder_env extends uvm_env;
  `uvm_component_utils(adder_env)
  
  adder_agent agent;
  adder_scoreboard scb;
  
  
  function new(string name = "adder_env", uvm_component parent = null);
    super.new(name,parent);
    `uvm_info("ENV", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV", "build phase", UVM_MEDIUM);
    
    agent = adder_agent::type_id::create("agent", this);
    scb = adder_scoreboard::type_id::create("scb", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV", "connect phase", UVM_MEDIUM);
    
    agent.mon.item_collected_port.connect(scb.item_collected_export);
  endfunction
  
endclass
