`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 05:01:59 PM
// Design Name: 
// Module Name: pe
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


module pe
    (
        input clk,
        input rst_n,
        input en,
        input [15:0] up_i,
        input [7:0] left_i,
        input [7:0] weight,
        output reg [7:0] right_o,
        output reg [15:0] down_o
    );
    
    always@ (posedge clk or negedge rst_n) 
    begin
        if(!rst_n) 
            begin
                right_o <= 8'h00;
                down_o <= 8'h00;
            end
        else if (en)
            begin
                down_o <= left_i * weight + up_i;
                right_o <= left_i;
            end
        else 
            begin
                right_o <= right_o;
                down_o <= down_o;
            end
    end
endmodule
