module Memory (
	input iClk,
	output [7:0] oValue
	);
	
reg [7:0] ex1_memory [99:0];

reg [7:0] rMemory_Q;
reg [7:0] rMemory_D;

reg [6:0] rCounter_Q;//7 bits cuentan del 0 al 100 
reg [6:0] rCounter_D;

assign oValue = rCounter_Q;

initial 
begin
   $readmemh("ex1.mem.txt", ex1_memory);
end 

always @ (posedge iClk)
begin 
rMemory_Q <= rMemory_D;
rCounter_Q <= rCounter_Q;
end 

always @* 
begin 
rMemory_D = ex1_memory[rCounter_Q];
rCounter_D = rCounter_Q + 7'd1;
end 

endmodule 