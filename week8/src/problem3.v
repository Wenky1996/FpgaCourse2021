/*
 author  :       Wenky Jong
 Date    :       2021.05.16
 Address :       MianYang SWSUT
 Revision:       1st
 Description:   automatic frequency measurement with decimal digital
 Contact:        wenkyjong1996@gmail.com
 */


 module problem3 (
   input   wire    clk_50m,
   input   wire    clk_measure,
   input   wire    rst_n,
   output    reg   overrange,
   output    reg   [13:0]measuring_frequency
   );

//flag time high level for 1 second
reg [25:0]cnt;
reg flag;
always @ (posedge clk_50m or negedge rst_n) begin
  if (!rst_n) begin
    flag<=1'b0;
    cnt<=1'b0;
  end else begin
    if (cnt>=26'd49_999_999) begin
      cnt<=1'b0;
      flag<=~flag;
    end else begin
      cnt<=cnt+1'b1;
      flag<=flag;
    end
  end
end


//clk measure Edge detection circuit
reg clk_measure_d1;
reg clk_measure_d2;
wire clk_measure_posedge;
always @ (posedge clk_50m or negedge rst_n) begin
  if (!rst_n) begin
    clk_measure_d1<=1'b0;
    clk_measure_d2<=1'b0;
  end else begin
    clk_measure_d1<=clk_measure;
    clk_measure_d2<=clk_measure_d1;
  end
end

assign clk_measure_posedge=clk_measure_d1&~clk_measure_d2;


// Signal flag edge detection
reg flag_d1;
reg flag_d2;
wire flage_negedge;
always @ (posedge clk_50m or negedge rst_n) begin
  if (!rst_n) begin
    flag_d1<=1'b0;
    flag_d2<=1'b0;
  end else begin
    flag_d1<=flag;
    flag_d2<=flag_d1;
  end
end

assign flage_negedge=~flag_d1&flag_d2;

//
reg [24:0]measuring_cnt;
always @ (posedge clk_50m or negedge rst_n) begin
  if (!rst_n) begin
    measuring_cnt<=1'b0;
  end else begin
    if (flag==1'b1) begin
      if (clk_measure_posedge) begin
        measuring_cnt<=measuring_cnt+1'b1;
      end else begin
        measuring_cnt<=measuring_cnt;
      end
    end else begin
      if (flage_negedge) begin
        measuring_cnt<=1'b0;
      end else begin
        measuring_cnt<=measuring_cnt;
      end
    end
  end
end


always @ (posedge clk_50m or negedge rst_n) begin
  if (!rst_n) begin
    measuring_frequency<=1'b0;
  end else begin
    if (flage_negedge) begin
      measuring_frequency<=measuring_cnt;
    end else begin
      measuring_frequency<=measuring_frequency;
    end
  end
end

always @ (posedge clk_50m or negedge rst_n) begin
  if (!rst_n) begin
    overrange<=1'b0;
  end else begin
    if (measuring_cnt>=25'd9999) begin
        overrange<=1'b1;
    end else begin
        overrange<=1'b0;
    end
  end
end

 endmodule // problem3
