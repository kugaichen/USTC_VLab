`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/01 19:53:04
// Design Name: 
// Module Name: CoinMachine
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


module CoinMachine(
    input       clk,
    input       rst,
    input       A,      // A=1表示投了5分钱
    input       B,      // B=1表示投了10分钱
    output      Y,      // Y=1表示弹出饮料 
    output      Z       // Z=1表示需要找零
    );

    reg current_state, next_state;
    localparam S0 = 1'd0;
    localparam S1 = 1'd1;

    always @(posedge clk) begin
        if (rst) begin
            current_state <= S0;
        end

        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        next_state = current_state;
        case (current_state)
            S0: begin
                if (A == 0 && B == 0) begin
                    next_state = S0;
                
                end
                else if(A == 0 && B == 1) begin
                    next_state = S0;
                   
                end      
                else if(A == 1 && B == 1) begin
                    next_state = S0;
                    
                end 
                else if(A == 1 && B ==0) begin
                    next_state = S1;
                    
                end
                
            end 
            
            S1:begin
                if (A == 0 && B == 0) begin
                    next_state = S1;
                end
                else if(A == 0 && B == 1) begin
                    next_state = S0;
                end
                else if(A == 1 && B == 1) begin
                    next_state = S0;
                end
                else if(A == 1 && B == 0) begin
                    next_state = S0;
                end
            end
        endcase
        
    end


    assign Y = (A == 1'b0 && B == 1'b1) || (current_state == S1 && A == 1'b1 && B == 1'b0);
    assign Z = (current_state == S1 && A == 1'b0 && B == 1'b1);
    
            





endmodule
