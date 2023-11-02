`timescale 1ns / 1ps
module HM1(LED,clk,rst);
output [7:0] LED;
input clk,rst;
wire divclk;

divclk divclk (divclk,clk,rst);
counter counter(LED,divclk,rst); 

endmodule

module divclk(divclk,clk,rst);
output divclk;
input clk,rst;
reg [30:0] cnt;

assign divclk = cnt[24];

always@(posedge clk or negedge rst)
begin
    if(rst)
        cnt <= 'd0;
    else
        cnt <= cnt+1;     
end
endmodule

module counter(LED,clk,rst);
output reg [7:0] LED;
input clk,rst;

always@(posedge clk or negedge rst)
begin
    if(rst)
        LED <= 8'd0;
    else
        LED <= LED+1; 
end 
endmodule
