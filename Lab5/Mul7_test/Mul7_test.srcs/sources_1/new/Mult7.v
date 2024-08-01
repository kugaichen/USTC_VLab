`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/18 18:27:57
// Design Name: 
// Module Name: Mult7
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


module Mult7(
    input               clk,
    input               rst,
    input  [31:0]       src,
    input               src_valid,     //表明输入是否有效
    output reg          ready,         //表面是否正在检测
    output reg          res,           //输出结果
    output reg          res_valid      //表明输出结果是否有效
    );

    localparam IDLE = 2'b00;
    localparam CALCULATE = 2'b01;
    localparam DONE = 2'b10;

    reg [2:0] current_state,next_state;
    reg [31:0] valid_src;

    reg [3:0] remainder;    //余数寄存器，范围在000-110之间
    reg [5:0] cycle_count;  //计数器，计算时钟周期,需要在32个时钟周期内检测完

    always @(posedge clk) begin
        if (rst) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end      
    end

    always @(*) begin
        next_state = current_state;
        ready = 0;
        res_valid = 0;
        res = 0;

        case (current_state)
            IDLE: begin
                ready = 1;
                res_valid = 0;
                if (src_valid) begin
                    valid_src = src;
                    next_state = CALCULATE;
                end
            end 
            
            CALCULATE: begin
                ready = 0;
                res_valid = 0;
                if (cycle_count == 32) begin
                    if (remainder == 0) begin
                        res = 1;
                    end

                    else begin
                        res = 0;
                    end
                    res_valid = 1;
                    next_state = DONE;
                end
            end

            DONE: begin
                ready = 0;
                res_valid = 0;
                cycle_count = 0;
                valid_src = 0;
                if (src_valid) begin
                    next_state = IDLE;
                end
            end
        endcase

    end

    always @(posedge clk) begin
        if (rst) begin
            remainder <=0;
            cycle_count <=0;
        end

        else if(current_state == CALCULATE) begin
            if ((remainder * 2 + valid_src[31 - cycle_count]) >= 7) begin
                remainder <= remainder * 2 + valid_src[31 - cycle_count] - 7;
            end

            else begin
                remainder <= remainder * 2 + valid_src[31 - cycle_count];
            end
          

            cycle_count <= cycle_count + 1;
        end

        else begin
            remainder <= 0;
            cycle_count <=0;
        end
            
    end

    // always @(*) begin
    //     if (current_state == CALCULATE) begin
    //         remainder <= remainder * 2 + valid_src[31 - cycle_count];

    //         if (remainder >= 7) begin
    //             remainder <= remainder - 7;
    //         end

    //     end
    // end


endmodule