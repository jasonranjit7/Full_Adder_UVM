class adder_seq_item extends uvm_sequence_item;
  `uvm_object_utils(adder_seq_item)
  
  rand bit a;
  rand bit b;
  rand bit cin;
  
  bit cout;
  bit sum;
  
  function new(string name = "adder_seq_item");
    super.new(name);
    `uvm_info("SEQ ITEM", "constructor", UVM_MEDIUM);
  endfunction
  
endclass
