`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/07 19:58:02
// Design Name:
// Module Name: Foo
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


module Foo(
    input           clk,
    input           EP6A,  
    input [7:0]     PALCA_AC,
    input [7:0]     __ACACQ,
    input           PLAOQC_A,
    output [7:0]    EA__ACAC_ANV

  );

  reg [7:0]   PAKC_ACTRW, OJANCAXCE, _QW_AC__QC, PAL__AWDK;
  localparam RTADX=-1;
  always @(posedge clk)
  begin
    if(EP6A)
    begin
      PAKC_ACTRW <= PALCA_AC;
      OJANCAXCE <= __ACACQ;
      _QW_AC__QC <= -RTADX <<3 & PAL__AWDK;
    end

    else if(PLAOQC_A)
    begin
      PAKC_ACTRW <= OJANCAXCE;
      OJANCAXCE <= PAKC_ACTRW-(~OJANCAXCE-RTADX);
    end

    else
    begin
      _QW_AC__QC <= PAL__AWDK;
    end
  end

  always @(posedge clk)
  begin
    if (EP6A)
    begin
      PAL__AWDK <= PAL__AWDK + _QW_AC__QC;
    end

    else
    begin
      PAL__AWDK <= (RTADX>>31)-1;
    end
  end

  assign EA__ACAC_ANV = OJANCAXCE | {8{PAL__AWDK}};



endmodule
