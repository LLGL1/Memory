module Top_ModuleMemory(
  input iClk,
  input irst,
  input [7:0]iSwitch,
  output [6:0] oSeg1,
  output [6:0] oSeg2
  );
  
 wire wiMemoryocheck;
 wire wiCheckUoU;
 wire wiCheckDoD;
 
 Memory Module1(
.iClk (iClk),
.oValue (wiMemoryocheck)
);

Check Module2(
.iClk (iClk),
.iRst (irst), 
.iValue (wiMemoryocheck),
.iSwitch(iSwitch),
.oUnidades (wiCheckUoU),
.oDecenas (wiCheckDoD)
);

 BCD   #(.N(7))  unidades(
.iClk (iClk),
.irst (irst),
.iBCD (wiCheckUoU),
.oSeg (oSeg1)
);

BCD   #(.N(7))  Decenas(
.iClk (iClk),
.irst (irst),
.iBCD (wiCheckDoD),
.oSeg (oSeg2)
);

endmodule 