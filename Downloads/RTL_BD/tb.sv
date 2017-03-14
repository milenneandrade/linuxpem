

// Code your testbench here
// or browse Examples
module tb();
  
  logic clk;
  logic rst;
  logic [7:0]conversor_adc;
  logic [7:0]BD_DATA_0;
  logic [7:0]BD_DATA_1;
	
  RTL_BD teste(.clk(clk),.rst(rst), .conversor_adc(conversor_adc), .BD_DATA_0(BD_DATA_0), .BD_DATA_1(BD_DATA_1));
  
  
  initial
    begin
      clk = 1'b0;
      repeat(100) #5 clk = ~clk;
    end
  
  initial
    begin
      rst = 1'b1;
      #10 rst = 1'b0;
      #10 rst = 1'b1;
    end
  
  /*
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  */
endmodule
