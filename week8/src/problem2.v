/*
 author  :       Wenky Jong
 Date    :       2021.05.16
 Address :       MianYang SWSUT
 Revision:       1st
 Description:    using verilog design a five-frequency divider circuit
 Contact:        wenkyjong1996@gmail.com
 */

module problem2 (
  input   wire    in_clk,
  input   wire    reset,
  output    reg   out_clk
  );

reg [2:0]cnt_div_up;
reg [2:0]cnt_div_down;


always @ (posedge in_clk or posedge reset) begin
  if (reset) begin
    cnt_div_up<=1'b0;
  end else begin
    if (cnt_div_up==3'd4) begin
        cnt_div_up<=1'b0;
    end else begin
        cnt_div_up<=cnt_div_up+1'b1;
    end
  end
end


always @ (negedge in_clk or posedge reset) begin
  if (reset) begin
    cnt_div_down<=1'b0;
  end else begin
    if (cnt_div_down==3'd4) begin
      cnt_div_down<=1'b0;
    end else begin
      cnt_div_down<=cnt_div_down+1'b1;
    end
  end
end

always @ ( * ) begin
  if (reset) begin
    out_clk<=1'b0;
  end else begin
    if (cnt_div_up==3'd4) begin
        out_clk<=1'b1;
    end else begin
      if (cnt_div_down==3'd2) begin
          out_clk<=1'b0;
      end else begin
          out_clk<=out_clk;
      end
    end
  end
end


endmodule // problem2
