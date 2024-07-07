`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/07 16:25:52
// Design Name: 
// Module Name: Counter
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


module Counter #(
    parameter   MAX_VALUE = 8'd100,
    parameter   MIN_VALUE = 8'd0
)
(
    input   clk,
    input   rst,
    input   enable,
    output  out
    );

    reg [7:0] counter;
    always @(posedge clk) begin
        
        if (rst) begin
            counter <= 0;
        end
        else begin
            if (enable) begin
                if (counter >= MAX_VALUE)  begin
                    counter <= MIN_VALUE;
                end

                else if(counter < MIN_VALUE) begin
                    counter <= MIN_VALUE;
                end

                else begin
                    counter <= counter + 8'd1;
                end
            end

            else begin
                counter <= 0;
            end            
            
        end
   
    end

    assign out = (counter == MAX_VALUE);

endmodule
