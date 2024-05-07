`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2024 05:50:00 PM
// Design Name: 
// Module Name: PC
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


module PC(
input T1  ,
input T2  ,
input T4  ,
input D4  ,
input R   ,
input CLK ,
input [3:0] PC_in   ,
output reg [3:0] PC    );

wire E   ;
wire MR  ;
wire INC ;

assign E   = D4 & T4 ;
assign MR  = R & T1  ;
assign INC = (~R & T1)|(R & T2) ;

initial begin
PC = 8'h0 ;
end

always @(posedge CLK or posedge MR) begin
if (MR == 1)          
     begin            
PC <= 4'h0  ;         // Clear Data
     end              
else if (E == 1)      
     begin            
PC <= PC_in ;         // Load Data
     end              
else if (INC == 1)    
     begin            
PC <= PC + 1 ;       // Increment Data
    end
else
    begin
PC <= PC     ;      // Hold Data
    end
end 
 
endmodule
