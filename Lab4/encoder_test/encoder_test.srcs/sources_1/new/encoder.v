`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/13 14:26:26
// Design Name: 
// Module Name: encoder
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


module encoder(
    input           [3:0]       I,
    output reg      [1:0]       Y,
    output reg                  en
    );

    always @(*) begin
        case (I)
            4'b1000: begin
                Y = 2'b11;
                en = 1;
            end
            4'b0100: begin 
                Y = 2'b10;
                en = 1;
            end
            4'b0010: begin
                Y = 2'b01;
                en = 1;
            end
            4'b0001: begin
                Y = 2'b00;
                en = 1;
            end
            default : begin
                Y = 2'b00;
                en = 0;  
            end 
        
        endcase
        
    end

endmodule

module Top (
    input   [3:0]       sw,
    output   [7:0]       led
);

encoder encoder_inst(
    .I(sw),
    .Y(led[1:0]),
    .en(led[7])
);

endmodule //Top
