
class adder_driver extends uvm_driver#(adder_seq_item);
  `uvm_component_utils(adder_driver)
  
  adder_seq_item tx;
  virtual adder_interface vif;
  
  function new(string name = "adder_driver", uvm_component parent = null);
    super.new(name,parent);
    `uvm_info("DRIVER", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER", "build phase", UVM_MEDIUM)
    
    if(!uvm_config_db#(virtual adder_interface)::get(this,"","vif", vif))
      `uvm_fatal("no intf in drv", "vif get failed");
    
  endfunction
  
  task drive(adder_seq_item tx);
    vif.a<=tx.a;
    vif.b<=tx.b;
    vif.cin<=tx.cin;
    #10;
  endtask
  
  task run_phase(uvm_phase phase);
    `uvm_info("DRIVER", "run phase", UVM_MEDIUM);
    forever begin
      seq_item_port.get_next_item(tx);
      drive(tx);
      seq_item_port.item_done();
    end
  endtask
  
  
endclass
