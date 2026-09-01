class adder_seq extends uvm_sequence;
  `uvm_object_utils(adder_seq)
  
  adder_seq_item tx;
  
  function new(string name = "adder_seq");
    super.new(name);
    `uvm_info("SEQUENCE", "constructor", UVM_MEDIUM);
  endfunction
  
  virtual task body();
    repeat(5) begin
      tx = adder_seq_item::type_id::create("tx");
      
      wait_for_grant();
      tx.randomize();
      send_request(tx);
      wait_for_item_done();
    end
  endtask
  
endclass
