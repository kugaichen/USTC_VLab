`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/07 20:21:38
// Design Name: 
// Module Name: FindMode
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


module FindMode(
    input               clk,
    input               rst,
    input               next,
    input [7:0]         number,
    output reg [7:0]    out

    );
    reg [7:0] now_number;
    reg [7:0] all_count;
    reg [7:0] max_count;

    always @(posedge clk) begin
        if (rst) begin
            // out <= 8'b0;
            all_count <= 8'b0;
            max_count <= 8'b0;
        end

        else if (next) begin
            all_count <= all_count + 1'd1;
            if (all_count == 1'd1) begin
                now_number <= number;
                max_count <= 1'd1;
            end

            else begin
                if (max_count > 1'b0) begin
                    if (now_number == number) begin
                        max_count <= max_count + 1'd1;
                    end
    
                    else begin
                        max_count <= max_count - 1'd1;
                    end
                end
                
                else begin
                    now_number <= number;
                    max_count <= 1'd1;
                end
            end
            // out <= now_number;
        end    
        
    end

    // assign out = now_number;
    always @(*) begin
        out = now_number;
    end
   
endmodule
