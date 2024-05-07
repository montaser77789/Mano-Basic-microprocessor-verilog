`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2024 05:51:45 PM
// Design Name: 
// Module Name: AR
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


module AR(
input D7  ,
input I   ,
input R   , 
input T0  ,
input T2  ,
input T3  ,
input CLK ,
input [3:0] AR_in ,
output reg [3:0] AR   );

wire E  ;
wire MR ;

assign E = (~D7&I&T3)|(~R&(T0|T2));
assign MR = R&T0 ;

initial begin
AR = 4'h0 ;
end

always @(posedge CLK or posedge MR)
begin
 if (MR == 1)      // Clear Data
     begin
AR <= 4'h0 ;
     end  
 else if (E == 1)
     begin
AR <= AR_in ;      // Load Data
     end
  else
     begin
AR <= AR ;         // HOLD Data
     end              
end

endmodule
