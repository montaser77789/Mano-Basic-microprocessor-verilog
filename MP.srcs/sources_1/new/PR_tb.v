`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 01:05:34 PM
// Design Name: 
// Module Name: PR_tb
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


module PR_tb ;
reg CLK  = 0     ;   
reg HD           ;
reg [7:0] INPR   ;
wire R           ;
wire T0          ;
wire T1          ;
wire T2          ;
wire T3          ;
wire T4          ;
wire T5          ;
wire T6          ;
wire T7          ;
wire FGI         ;
wire FGO         ;
wire E           ;
wire [7:0] MEM   ;
wire [3:0] AR    ;
wire [3:0] PC    ;
wire [7:0] IR    ;
wire [7:0] DR    ;
wire [7:0] AC    ;
wire [7:0] OUTPR ;
wire [7:0] TR    ;

// instantiate Processor (top module)
Processor Pr (
.CLK   (CLK   ) ,
.HD    (HD    ) ,
.INPR  (INPR  ) ,
.R     (R     ) ,
.T0    (T0    ) ,
.T1    (T1    ) ,
.T2    (T2    ) ,
.T3    (T3    ) ,
.T4    (T4    ) ,
.T5    (T5    ) ,
.T6    (T6    ) ,
.T7    (T7    ) ,
.FGI   (FGI   ) ,
.FGO   (FGO   ) ,
.E     (E     ) ,
.MEM   (MEM   ) ,
.AR    (AR    ) ,
.PC    (PC    ) ,
.IR    (IR    ) ,
.DR    (DR    ) ,
.AC    (AC    ) ,
.OUTPR (OUTPR ) ,
.TR    (TR    ) 

);

always #0.2 CLK = ~CLK ;

initial 
  begin 
HD   = 0      ;   // HLT Deactivate is  not active
INPR = 8'h02  ;
  #30 ;
HD   = 1      ;  
INPR = 8'h02  ;   // HLT Deactivate is active
  #10 ;
HD   = 0      ;   // HLT Deactivate is  not active
INPR = 8'h02  ;
  #30 ;

$finish ;
  end

endmodule
