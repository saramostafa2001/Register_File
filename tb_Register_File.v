`timescale 1us/1ns
module tb_Register_File ();
reg                                                                tb_Wr_Enable;
reg                                                                tb_Rd_Enable;
reg                                                                tb_CLK;
reg                                                                tb_RST;
reg                [1:0]                                           tb_Address;
reg                [15:0]                                          tb_Wr_Data;
wire               [15:0]                                          tb_Rd_Data;

  

always #5 tb_CLK = !tb_CLK ;
  
 
Register_File DUT
(
.Wr_Enable(tb_Wr_Enable),
.Rd_Enable(tb_Rd_Enable),
.CLK(tb_CLK),
.RST(tb_RST),
.Address(tb_Address),
.Wr_Data(tb_Wr_Data),
.Rd_Data(tb_Rd_Data)          
);



initial
  begin 
  
   $dumpfile ("Register_File.vcd");
   $dumpvars;
   
   tb_Wr_Data = 16'b0001;
   tb_Address = 4'b01;
   tb_CLK = 1'b0; 
 

 
 $display("Test Case 1: Read1");
    #3
    tb_Address = 2'b10;
	tb_Rd_Enable = 1'b1;
	tb_Wr_Enable = 1'b0;
	#5
	if( tb_Rd_Data != 16'b111011)
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");
		 
	


	
$display("Test Case 2: Read2");
    #3
    tb_Address = 2'b11;
	tb_Rd_Enable = 1'b1;
	tb_Wr_Enable = 1'b0;
	#5
	if( tb_Rd_Data != 16'b0011)
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");	     



		 
 $display("Test Case 3: Write1");
    #3
	tb_Address = 2'b00;
	tb_Wr_Data = 16'b0001;
	tb_Rd_Enable = 1'b0;
	tb_Wr_Enable = 1'b1;
	#5
	if( tb_Rd_Data != 16'b0001)
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");
		 




$display("Test Case 4: Write2");
    #3
	tb_Address = 2'b01;
	tb_Wr_Data = 16'b1111;
	tb_Rd_Enable = 1'b0;
	tb_Wr_Enable = 1'b1;
	#5
	if( tb_Rd_Data != 16'b1111)
		 $display ("Test Case Failed");
	else 
		 $display ("Test Case Passed");	 
		 
		 		 
			 
	#10				 
   
   
   $finish;
   
   end
   
 
 
 endmodule  
   
   

