`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2024 09:09:50 PM
// Design Name: 
// Module Name: INPR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module INPR(
input CLK ,
input D7  ,
input I   ,
input T3  ,
input B3  ,
input [7:0] INPR_in ,
output reg  FGI     ,
output reg [7:0] INPR_out   );

wire J ;
wire K ;
reg CR ;
reg [7:0] Prev_in ;

assign J = CR ;
assign K = (D7 & I & T3 & B3) ;

initial begin 
Prev_in  = 8'h00 ;
INPR_out = 8'h00 ;
FGI = 1'b0 ;
end

always @(posedge CLK )
begin
// Logic for Main Register
if (K == 0 )
   begin
INPR_out <= INPR_in ;
   end
else
   begin 
INPR_out <= INPR_out ;
   end
 // Logic for Secondary Register   
if (CR == 1)
   begin
Prev_in <= INPR_out ;
   end
else
   begin
Prev_in <= Prev_in ;
   end
 // Logic for FGI JK flip flop  
case({K,J})
2'b00 : FGI <= FGI  ;
2'b01 : FGI <= 1'b1 ;
2'b10 : FGI <= 1'b0 ;
2'b11 : FGI <= ~FGI ;
endcase
end

always @(*) begin
 // Logic for comparator 
if( INPR_out != Prev_in )
   begin
CR <= 1'b1 ;
   end
else 
   begin
CR <= 1'b0 ;
   end
end

endmodule
