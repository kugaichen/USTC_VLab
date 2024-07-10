`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 21:19:19
// Design Name: 
// Module Name: Segment
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
    output reg  [3:0]       seg_data,
    output reg  [2:0]       seg_an

    );

    reg [31:0]      counter;
    always @(posedge clk) begin
        if (rst) begin
            counter <= 0;
        end

        else if(counter >= MAX_VALUE) begin
            counter <= 0;
        end

        else begin
            counter <= counter + 1'b1;
        end
        
    end

    wire pulse_400hz;
    assign  pulse_400hz = (counter == MAX_VALUE);
    reg [2:0] seg_id;

    always @(posedge clk) begin
        if (rst) begin
            seg_id <= 0;
        end

        else begin
            if(seg_id > 3'd7) begin
                seg_id <= 0;  
            end
            else begin
                if(pulse_400hz) begin
                    seg_id <= seg_id + 1'b1;
                end
            end
        end 
        
    end

    
    always @(seg_an) begin
        seg_data = 0;
        seg_an = seg_id;

        case(seg_an)
            3'd0: seg_data <= output_data [3:0]; 
            3'd1: seg_data <= output_data [7:4];
            3'd2: seg_data <= output_data [11:8];   
            3'd3: seg_data <= output_data [15:12]; 
            3'd4: seg_data <= output_data [19:16]; 
            3'd5: seg_data <= output_data [23:20]; 
            3'd6: seg_data <= output_data [27:24]; 
            3'd7: seg_data <= output_data [31:28]; 
            
        endcase
    end
endmodule

module Top(
    input                   clk,
    input                   btn,
    output [2:0]            seg_an,
    output [3:0]            seg_data
);
Segment segment(
    .clk(clk),
    .rst(btn),
    .output_data(32'h22111234),     // <- 改为你学号中的 8 位数字
    .seg_data(seg_data),
    .seg_an(seg_an)
);
endmodule
