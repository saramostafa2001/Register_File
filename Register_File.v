module Register_File 
(
    input                reg                    Wr_Enable,
	input                reg                    Rd_Enable,
    input                wire                   CLK,
	input                wire                   RST,
    input                reg  [1:0]             Address,
    input                reg  [15:0]            Wr_Data, 
    output               reg  [15:0]            Rd_Data

);

    
reg [15:0] reg_file [7:0];     
   


always @(*)               
 begin 
 
  case (Address)
  
	
		   2'b00 : 
		   begin  		                //Write
		     if(Wr_Enable && !Rd_Enable )
			  reg_file[Address] = Wr_Data;
			  Rd_Data = reg_file[Address];
		   end
			
		   2'b01 :                      //Write                                 
		   begin 
		    if(Wr_Enable && !Rd_Enable )
			  reg_file[Address] = Wr_Data;
			  Rd_Data = reg_file[Address];
		   end
			
		   2'b10 :                     //Read                                  
		   begin 
		    if( Rd_Enable && !Wr_Enable )
			  reg_file[Address] = 16'b111011;
			end
		   
		   2'b11 :                   //Read                                
		   begin 
		    if( Rd_Enable && !Wr_Enable )
			  reg_file[Address] = 16'b0011;
			end
		   
	endcase 
		
end 	


always @ (posedge CLK or negedge RST) 

	begin
	  
	    if(!RST)
		 begin 
			  reg_file[0] <= 16'b0;
			  reg_file[1] <= 16'b0;
			  reg_file[2] <= 16'b0;
			  reg_file[3] <= 16'b0;
			  reg_file[4] <= 16'b0;
			  reg_file[5] <= 16'b0;
			  reg_file[6] <= 16'b0;
			  reg_file[7] <= 16'b0;
			  Rd_Data <= 0;
		 end
		 
       else if (Wr_Enable && !Rd_Enable)	 
	    
			reg_file[Address] <= Wr_Data;  
		  
		 
	   else 
	   
			Rd_Data <= reg_file[Address]; 
		     
		 		  
    end	




endmodule