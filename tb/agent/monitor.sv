
class adder_monitor extends uvm_monitor;
  `uvm_component_utils(adder_monitor)
  
  virtual adder_interface intf;
  uvm_analysis_port #(adder_seq_item) item_collected_port;
  
  function new(string name = "adder_monitor", uvm_component parent = null);
    super.new(name,parent);
    `uvm_info("MONITOR", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR", "build phase", UVM_MEDIUM);
    item_collected_port = new("item_collected_port", this);
    
    if(!uvm_config_db#(virtual adder_interface)::get(this,"","vif",intf))
      `uvm_fatal("no interface in mon", "vif get failed");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    adder_seq_item rx;
    `uvm_info("MONITOR", "run phase", UVM_MEDIUM)
    forever begin
      @(intf.a or intf.b or intf.cin);
      #1
      rx = adder_seq_item::type_id::create("rx");
      rx.a = intf.a;
      rx.b = intf.b;
      rx.cin = intf.cin;
      rx.cout = intf.cout;
      rx.sum = intf.sum;
      item_collected_port.write(rx);
    end
  endtask     
  
endclass
