class adder_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(adder_scoreboard)
  
  adder_seq_item tx_q[$];
  logic expected_sum = 0;
  logic expected_cout = 0;
  
  uvm_analysis_imp#(adder_seq_item,adder_scoreboard) item_collected_export;
  
  function new(string name = "adder_scoreboard", uvm_component parent = null);
    super.new(name,parent);
    `uvm_info("SCOREBOARD", "constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCOREBOARD", "build phase", UVM_MEDIUM)
    
    item_collected_export = new("item_collected_export", this);
  endfunction
  
  function void write(adder_seq_item tx);
    tx_q.push_back(tx);
    
    expected_sum = tx.a^tx.b^tx.cin;
    
    if(tx.sum == expected_sum) begin
      `uvm_info("SBD", $sformatf("PASS: expected=%0b, actual=%0b", expected_sum, tx.sum), UVM_LOW)
    end
    else  begin
      `uvm_error("SBD", $sformatf("FAIL: expected=%0b, actual=%0b", expected_sum, tx.sum))
    end
    
  endfunction
      
  
endclass
