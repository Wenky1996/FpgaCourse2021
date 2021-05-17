/*
 author  :       Wenky Jong
 Date    :       2021.05.16
 Address :       MianYang SWSUT
 Revision:       1st
 Description:    according to the schematic write the verilog program
 Contact:        wenkyjong1996@gmail.com
 */
module problem1 (
input   wire    clk,
input   wire    xin,
output  wire   yout
  );

reg DFF1=0;
reg DFF2=0;

always @ (posedge clk) begin
  DFF1<=DFF2;
end

wire    temp1=DFF1|xin;

always @ (posedge clk) begin
  DFF2<=temp1;
end

assign yout=DFF2;

endmodule // problem
