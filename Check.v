module Check (
	input iClk,
	input iRst,
	input [7:0]iValue,
	input [7:0]iSwitch, 
	output [3:0]oUnidades,
	output [3:0]oDecenas
);

reg [3:0] rUnidades_D;
reg [3:0] rUnidades_Q;

reg [3:0] rDecenas_D;
reg [3:0] rDecenas_Q;

assign oUnidades = rUnidades_Q;
assign oDecenas = rDecenas_Q;

always @ (posedge iClk)
begin 
	rUnidades_Q <= rUnidades_D;
	rDecenas_Q <= rDecenas_D;
end 

always @* 
begin
	if (iSwitch == iValue)
		begin 
		rUnidades_D = rUnidades_Q + 4'd1;	
		end 
		if (rUnidades_Q == 4'd9)
		begin 
		rUnidades_D = 4'd0;
		rDecenas_D = rDecenas_Q + 4'd1 ;
	   end
	   else if (rDecenas_Q == 4'd9)
	   begin 
	   rDecenas_D =  4'd0;
	   end
		else if(iRst)
		begin 
		rUnidades_D = 4'd0; 
	   rDecenas_D = 4'd0;
		end 
	else 
	begin 
	rUnidades_D = rUnidades_Q; 
	rDecenas_D = rDecenas_Q;
	end 
end 

endmodule  
