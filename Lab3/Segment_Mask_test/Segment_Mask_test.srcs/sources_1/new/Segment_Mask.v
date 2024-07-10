`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/07/10 11:52:50
// Design Name:
// Module Name: Segment_Mask
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


module Segment#(
    parameter MAX_VALUE = 32'd249_999
  )(
    input                   clk,
    input                   rst,
    input       [31 :0]     output_data,
    input       [7:0]       output_valid,

    output reg  [3:0]       seg_data,
    output reg  [2:0]       seg_an

  );

  reg [31:0]      counter;
  always @(posedge clk)
  begin
    if (rst)
    begin
      counter <= 0;
    end

    else if(counter >= MAX_VALUE)
    begin
      counter <= 0;
    end

    else
    begin
      counter <= counter + 1'b1;
    end

  end

  wire pulse_400hz;
  assign  pulse_400hz = (counter == MAX_VALUE);
  reg [2:0] seg_id;

  always @(posedge clk)
  begin
    if (rst)
    begin
      seg_id <= 0;
    end

    else
    begin
      if(seg_id > 3'd7)
      begin
        seg_id <= 0;
      end
      else
      begin
        if(pulse_400hz)
        begin
          seg_id <= seg_id + 1'b1;
        end
      end
    end

  end


  always @(seg_an)
  begin
    seg_data <= output_data[3:0];
    seg_an = seg_id;

    case(seg_an)
      3'd0:
        seg_data <= output_data [3:0];
      3'd1:
        if (output_valid[seg_an])
        begin
          seg_data <= output_data [7:4];
        end
        else seg_an = 0;
      3'd2:
        if (output_valid[seg_an])
        begin
          seg_data <= output_data [11:8];
        end
        else seg_an = 0;

      3'd3:
        if (output_valid[seg_an])
        begin
          seg_data <= output_data [15:12];
        end
        else seg_an = 0;

      3'd4:
        if (output_valid[seg_an])
        begin
          seg_data <= output_data [19:16];
        end
        else seg_an = 0;


      3'd5:
        if (output_valid[seg_an])
        begin
          seg_data <= output_data [23:20];
        end
        else seg_an = 0;


      3'd6:
        if (output_valid[seg_an])
        begin
          seg_data <= output_data [27:24];
        end
        else seg_an = 0;


      3'd7:
        if (output_valid[seg_an])
        begin
          seg_data <= output_data [31:28];
        end
        else seg_an = 0;
        


    endcase
  end
endmodule

module Top(
    input                   clk,
    input                   btn,
    input  [7:0]            sw,
    output [2:0]            seg_an,
    output [3:0]            seg_data
  );
  Segment segment(
            .clk(clk),
            .rst(btn),
            .output_data(32'h22111234),     // <- 改为你学号中的 8 位数字
            .seg_data(seg_data),
            .output_valid(sw),
            .seg_an(seg_an)
          );
endmodule
