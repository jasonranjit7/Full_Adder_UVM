`include "../env/environment.sv"
`include "../sequence.sv"
class adder_test extends uvm_test;
  `uvm_component_utils(adder_test)
  
  adder_env env;
  adder_seq seq;
  
  function new(string name = "adder_test", uvm_component parent = null);
    super.new(name, parent);
    `uvm_info("TEST", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST", "build phase", UVM_MEDIUM);
    
    env = adder_env::type_id::create("env", this);
    seq = adder_seq::type_id::create("seq");
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST", "connect phase", UVM_MEDIUM);
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    `uvm_info("TEST", "end of elaboration", UVM_MEDIUM);
    print();
  endfunction
  
  task run_phase(uvm_phase phase);
    `uvm_info("TEST", "run phase", UVM_MEDIUM);
    
    phase.raise_objection(this);
    seq.start(env.agent.seqr);
    phase.drop_objection(this);
  endtask  
  
endclass
