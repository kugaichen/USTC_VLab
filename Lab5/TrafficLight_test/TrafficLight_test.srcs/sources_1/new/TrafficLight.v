`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/01 20:51:22
// Design Name: 
// Module Name: TrafficLight
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


module TrafficLight(
    input           clk,
    input           rst,
    output          is_red,
    output          is_green,
    output          is_yellow

    );

    reg [5:0] count_green;
    reg [5:0] count_yellow;
    reg [5:0] count_red;

    reg [1:0] current_state, next_state;
    localparam RED = 2'd0;
    localparam YELLOW = 2'd1;
    localparam GREEN = 2'd2;

    always @(posedge clk) begin
        if (rst) begin
            current_state <= GREEN;
            count_green <= 0;
            count_red <= 0;
            count_yellow <= 0;
        end

        else begin
            current_state <= next_state;
        end

    end

    always @(*) begin
        next_state = current_state;
        case (current_state)
            GREEN: begin
                if(count_green == 6'd35) begin
                    next_state <= YELLOW;
                    // count <= 0;
                end
                else begin
                    next_state = GREEN;
                    // count <= count + 1;
                end
                    
            end

            RED: begin
                if (count_red == 6'd40) begin
                    next_state = GREEN;
                    // count <= 0;
                end
                else begin
                    next_state = RED;
                    // count <= count + 1;
                end
                    
            end

            YELLOW: begin
                if (count_yellow == 6'd5) begin
                    next_state = RED;
                end
                else begin
                    next_state = YELLOW;
                    // count <= count + 1;
                end
            end
        endcase
    end

    always @(posedge clk) begin
        if (current_state == GREEN) begin
            count_green <= count_green + 1;
            if (count_green == 6'd35) begin
                count_green <= 0;
            end
        end

        else if(current_state == RED) begin
            count_red <= count_red + 1;
            if (count_red == 6'd40) begin
                count_red <= 0;
            end
        end

        else if(current_state == YELLOW) begin
            count_yellow <= count_yellow + 1;
            if (count_yellow == 6'd5) begin
                count_yellow <= 0;
            end
        end
    end



    assign is_red = current_state == RED;
    assign is_green = current_state == GREEN;
    assign is_yellow = current_state == YELLOW;


endmodule
