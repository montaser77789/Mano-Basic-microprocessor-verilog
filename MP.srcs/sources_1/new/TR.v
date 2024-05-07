`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2024 08:59:43 PM
// Design Name: 
// Module Name: TR
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


module TR(
input R    ,
input T0   ,
input CLK  ,
input [7:0] TR_in  ,
output reg [7:0] TR   );

wire E ;
assign E  = R & T0 ;

initial begin 
TR = 8'h00 ;
end

always @(posedge CLK )
begin
if (E == 1)
     begin
 TR <=  TR_in  ;  // Load Data
     end 
else 
     begin
 TR <= TR     ;  // Hold Data
     end 
end

endmodule
