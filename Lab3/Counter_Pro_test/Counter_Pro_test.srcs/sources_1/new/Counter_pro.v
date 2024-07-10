`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/09 15:59:54
// Design Name: 
// Module Name: Counter_pro
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

// ¼ÆÊý·ÖÆµ
module Counter_pro #(
    parameter   MAX_VALUE = 26'd49_999_999
)(
    input                   clk,
    output reg [7:0]        led
);

reg [25:0] counter;
wire pulse_1m;
wire rst;

always @(posedge clk) begin
    if (rst)
        counter <= 0;
    else begin
        if (counter >= MAX_VALUE)
            counter <= 0;
        else
            counter <= counter + 8'b1;
    end
end

assign pulse_1m = (counter == MAX_VALUE);

always @(posedge clk) begin
    if (rst) begin
        led <= 8'b0;   
    end

    else if(pulse_1m) begin
        led <= ~led;
    end
    
end



endmodule


