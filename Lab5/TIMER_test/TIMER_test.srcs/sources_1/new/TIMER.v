`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/16 14:14:18
// Design Name: 
// Module Name: TIMER
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

module TIMER(
    input               clk,rst,
    output wire  [3:0]   out,
    output wire  [2:0]   select
    );

    reg [3:0]   outH;
    reg [3:0]   outM1;
    reg [3:0]   outM2;
    reg [3:0]   outS1;
    reg [3:0]   outS2;
    reg [39:0]  count;
    reg [39:0]  counter_S2;
    reg [39:0]  counter_S1;
    reg [39:0]  counter_M2;
    reg [39:0]  counter_M1;
    reg [39:0]  counter_H;

    initial begin
        outH = 4'H1;
        outM1 = 4'H2;
        outM2 = 4'H3;
        outS1 = 4'H4;
        outS2 = 4'H5;
        count = 40'H1;
        counter_H = 40'd120000000001;
        counter_M1 = 40'd30000000001;
        counter_M2 = 40'd4000000001;
        counter_S1 = 40'd500000001;
        counter_S2 = 40'd60000001;
    end

    always @(posedge clk) begin
        if (rst) begin
            count <= 40'H1;
            counter_H <= 40'd120000000001;   //360000000000
            counter_M1 <= 40'd30000000001;  //60000000000
            counter_M2 <= 40'd4000000001;   //6000000000
            counter_S1 <= 40'd500000001;    //1000000000
            counter_S2 <= 40'd60000001;     //100000000
        end

        else begin
            if (count != 40'D360000000000) begin
                count <= count + 40'H1;
            end

            else begin
                count <= 40'H1;
            end

            if (counter_H != 40'D360000000000) begin
                counter_H <= counter_H + 40'H1;
            end

            else begin
                counter_H <= 40'H1;
            end

            if (counter_M1 != 40'D60000000000) begin
                counter_M1 <= counter_M1 + 40'H1;
            end

            else begin
                counter_M1 <= 40'H1;
            end
                
            if (counter_M2 != 40'D6000000000) begin
                counter_M2 <= counter_M2 + 40'H1;
            end

            else begin
                counter_M2 <= 40'H1;
            end

            if (counter_S1 != 40'D1000000000) begin
                counter_S1 <= counter_S1 + 40'H1;
            end

            else begin
                counter_S1 <= 40'H1;
            end

            if (counter_S2 != 40'D100000000) begin
                counter_S2 <= counter_S2 + 40'H1;
            end

            else begin
                counter_S2 <= 40'H1;
            end

        end
    end

    Segment Segment_inst(
        .clk(clk),
        .rst(rst),
        .output_data({outH,outM1,outM2,outS1,outS2}),
        .output_valid(8'HFF),
        .seg_data(out),
        .seg_an(select)
    );

    always @(posedge clk) begin
        if (rst) begin
            outH <= 4'D1;
            outM1 <= 4'D2;
            outM2 <= 4'D3;
            outS1 <= 4'D4;
            outS2 <= 4'D5;

        end

        else begin
            if (counter_S2 == 40'D100000000) begin
                if (outS2 != 4'd9) begin
                    outS2 <= outS2 + 1;
                end
                
                else begin
                    outS2 <= 4'd0;
                end
                    
            end

            if (counter_S1 == 40'D1000000000) begin
                if (outS1 != 4'd5) begin
                    outS1 <= outS1 + 1; 
                end

                else begin
                    outS1 <= 4'd0;
                end
            end

            if (counter_M2 == 40'D6000000000) begin
                if (outM2 != 4'd9) begin
                    outM2 <= outM2 + 1;
                end

                else begin
                    outM2 <= 4'd0;
                end
            end

            if (counter_M1 == 40'D60000000000) begin
                if (outM1 != 4'd5) begin
                    outM1 <= outM1 + 1;
                end

                else begin
                    outM1 <= 4'd0;
                end            
            end
            
            if (counter_H == 40'D360000000000) begin
                if (outH != 4'd9) begin
                    outH <= outH + 1;
                end

                else begin
                    outH <= 4'd0;
                end
            end
        end
            
    end

endmodule

module Top (
    input           clk,
    input           rst,
    output  [3:0]   out,
    output  [2:0]   select
);

TIMER TIMER_inst(
    .clk(clk),
    .rst(rst),
    .out(out),
    .select(select)
);
endmodule //Top