`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 05:35:50 PM
// Design Name: 
// Module Name: Systolic_array
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
`define ARRAY_SIZE 16
`define CHANNEL 4
`define INPUT_SIZE 16
`define KERNEL_SIZE 2

module Systolic_array(
    input clk,
    input reset_n,
    input enable,
    input [8*`ARRAY_SIZE*`ARRAY_SIZE-1:0] weight_i,
    input [8*`ARRAY_SIZE-1:0] input_i,
    output reg [16*`ARRAY_SIZE-1:0] result_o
);
    reg [15:0] zero = 4'h0000;
    
    //// GENERATE
    /*wire [7:0] right [3:0][3:0];
    wire [7:0] down [3:0][3:0];
    generate
        genvar r, c; //row
        for(r = 1; r <=16; r=r+1)
        
    //           for(c = 1; c <= 16; c=c+1)
               
    //                if(c == 1)
    //                    pe pe_i (.up_i(zero), .left_i(input_i[7:0]), .weight(weight_i[7:0]),.right_o(right1_1), .down_o(down1_1));
               
        
    endgenerate */
    ///// GENERATE
     //    Row1
    wire [7:0] right1_1, right1_2, right1_3, right1_4, right1_5, right1_6, right1_7, right1_8, right1_9, right1_10, right1_11, right1_12, right1_13, right1_14, right1_15, right1_16;
    wire [15:0] down1_1, down1_2, down1_3, down1_4, down1_5, down1_6, down1_7, down1_8, down1_9, down1_10, down1_11, down1_12, down1_13, down1_14, down1_15, down1_16;
    pe pe1_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(input_i[7:0]), .weight(weight_i[7:0]), .right_o(right1_1), .down_o(down1_1));
    pe pe1_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_1), .weight(weight_i[15:8]), .right_o(right1_2), .down_o(down1_2));
    pe pe1_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_2), .weight(weight_i[23:16]), .right_o(right1_3), .down_o(down1_3));
    pe pe1_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_3), .weight(weight_i[31:24]), .right_o(right1_4), .down_o(down1_4));
    pe pe1_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_4), .weight(weight_i[39:32]), .right_o(right1_5), .down_o(down1_5));
    pe pe1_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_5), .weight(weight_i[47:40]), .right_o(right1_6), .down_o(down1_6));
    pe pe1_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_6), .weight(weight_i[55:48]), .right_o(right1_7), .down_o(down1_7));
    pe pe1_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_7), .weight(weight_i[63:56]), .right_o(right1_8), .down_o(down1_8));
    pe pe1_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_8), .weight(weight_i[71:64]), .right_o(right1_9), .down_o(down1_9));
    pe pe1_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_9), .weight(weight_i[79:72]), .right_o(right1_10), .down_o(down1_10));
    pe pe1_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_10), .weight(weight_i[87:80]), .right_o(right1_11), .down_o(down1_11));
    pe pe1_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_11), .weight(weight_i[95:88]), .right_o(right1_12), .down_o(down1_12));
    pe pe1_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_12), .weight(weight_i[103:96]), .right_o(right1_13), .down_o(down1_13));
    pe pe1_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_13), .weight(weight_i[111:104]), .right_o(right1_14), .down_o(down1_14));
    pe pe1_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_14), .weight(weight_i[119:112]), .right_o(right1_15), .down_o(down1_15));
    pe pe1_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(zero), .left_i(right1_15), .weight(weight_i[127:120]), .right_o(right1_16), .down_o(down1_16));
    
    //    Row2
    wire [7:0] right2_1, right2_2, right2_3, right2_4, right2_5, right2_6, right2_7, right2_8, right2_9, right2_10, right2_11, right2_12, right2_13, right2_14, right2_15, right2_16;
    wire [15:0] down2_1, down2_2, down2_3, down2_4, down2_5, down2_6, down2_7, down2_8, down2_9, down2_10, down2_11, down2_12, down2_13, down2_14, down2_15, down2_16;
    pe pe2_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_1), .left_i(input_i[15:8]), .weight(weight_i[135:128]), .right_o(right2_1), .down_o(down2_1));
    pe pe2_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_2), .left_i(right2_1), .weight(weight_i[143:136]), .right_o(right2_2), .down_o(down2_2));
    pe pe2_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_3), .left_i(right2_2), .weight(weight_i[151:144]), .right_o(right2_3), .down_o(down2_3));
    pe pe2_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_4), .left_i(right2_3), .weight(weight_i[159:152]), .right_o(right2_4), .down_o(down2_4));
    pe pe2_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_5), .left_i(right2_4), .weight(weight_i[167:160]), .right_o(right2_5), .down_o(down2_5));
    pe pe2_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_6), .left_i(right2_5), .weight(weight_i[175:168]), .right_o(right2_6), .down_o(down2_6));
    pe pe2_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_7), .left_i(right2_6), .weight(weight_i[183:176]), .right_o(right2_7), .down_o(down2_7));
    pe pe2_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_8), .left_i(right2_7), .weight(weight_i[191:184]), .right_o(right2_8), .down_o(down2_8));
    pe pe2_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_9), .left_i(right2_8), .weight(weight_i[199:192]), .right_o(right2_9), .down_o(down2_9));
    pe pe2_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_10), .left_i(right2_9), .weight(weight_i[207:200]), .right_o(right2_10), .down_o(down2_10));
    pe pe2_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_11), .left_i(right2_10), .weight(weight_i[215:208]), .right_o(right2_11), .down_o(down2_11));
    pe pe2_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_12), .left_i(right2_11), .weight(weight_i[223:216]), .right_o(right2_12), .down_o(down2_12));
    pe pe2_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_13), .left_i(right2_12), .weight(weight_i[231:224]), .right_o(right2_13), .down_o(down2_13));
    pe pe2_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_14), .left_i(right2_13), .weight(weight_i[239:232]), .right_o(right2_14), .down_o(down2_14));
    pe pe2_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_15), .left_i(right2_14), .weight(weight_i[247:240]), .right_o(right2_15), .down_o(down2_15));
    pe pe2_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down1_16), .left_i(right2_15), .weight(weight_i[255:248]), .right_o(right2_16), .down_o(down2_16));
    
    //  Row3 
    wire [7:0] right3_1, right3_2, right3_3, right3_4, right3_5, right3_6, right3_7, right3_8, right3_9, right3_10, right3_11, right3_12, right3_13, right3_14, right3_15, right3_16;
    wire [15:0] down3_1, down3_2, down3_3, down3_4, down3_5, down3_6, down3_7, down3_8, down3_9, down3_10, down3_11, down3_12, down3_13, down3_14, down3_15, down3_16;
    pe pe3_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_1), .left_i(input_i[23:16]), .weight(weight_i[263:256]), .right_o(right3_1), .down_o(down3_1));
    pe pe3_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_2), .left_i(right3_1), .weight(weight_i[271:264]), .right_o(right3_2), .down_o(down3_2));
    pe pe3_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_3), .left_i(right3_2), .weight(weight_i[279:272]), .right_o(right3_3), .down_o(down3_3));
    pe pe3_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_4), .left_i(right3_3), .weight(weight_i[287:280]), .right_o(right3_4), .down_o(down3_4));
    pe pe3_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_5), .left_i(right3_4), .weight(weight_i[295:288]), .right_o(right3_5), .down_o(down3_5));
    pe pe3_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_6), .left_i(right3_5), .weight(weight_i[303:296]), .right_o(right3_6), .down_o(down3_6));
    pe pe3_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_7), .left_i(right3_6), .weight(weight_i[311:304]), .right_o(right3_7), .down_o(down3_7));
    pe pe3_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_8), .left_i(right3_7), .weight(weight_i[319:312]), .right_o(right3_8), .down_o(down3_8));
    pe pe3_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_9), .left_i(right3_8), .weight(weight_i[327:320]), .right_o(right3_9), .down_o(down3_9));
    pe pe3_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_10), .left_i(right3_9), .weight(weight_i[335:328]), .right_o(right3_10), .down_o(down3_10));
    pe pe3_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_11), .left_i(right3_10), .weight(weight_i[343:336]), .right_o(right3_11), .down_o(down3_11));
    pe pe3_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_12), .left_i(right3_11), .weight(weight_i[351:344]), .right_o(right3_12), .down_o(down3_12));
    pe pe3_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_13), .left_i(right3_12), .weight(weight_i[359:352]), .right_o(right3_13), .down_o(down3_13));
    pe pe3_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_14), .left_i(right3_13), .weight(weight_i[367:360]), .right_o(right3_14), .down_o(down3_14));
    pe pe3_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_15), .left_i(right3_14), .weight(weight_i[375:368]), .right_o(right3_15), .down_o(down3_15));
    pe pe3_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down2_16), .left_i(right3_15), .weight(weight_i[383:376]), .right_o(right3_16), .down_o(down3_16));
    
    //Row4
    wire [7:0] right4_1, right4_2, right4_3, right4_4, right4_5, right4_6, right4_7, right4_8, right4_9, right4_10, right4_11, right4_12, right4_13, right4_14, right4_15, right4_16;
    wire [15:0] down4_1, down4_2, down4_3, down4_4, down4_5, down4_6, down4_7, down4_8, down4_9, down4_10, down4_11, down4_12, down4_13, down4_14, down4_15, down4_16;
    pe pe4_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_1), .left_i(input_i[31:24]), .weight(weight_i[391:384]), .right_o(right4_1), .down_o(down4_1));
    pe pe4_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_2), .left_i(right4_1), .weight(weight_i[399:392]), .right_o(right4_2), .down_o(down4_2));
    pe pe4_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_3), .left_i(right4_2), .weight(weight_i[407:400]), .right_o(right4_3), .down_o(down4_3));
    pe pe4_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_4), .left_i(right4_3), .weight(weight_i[415:408]), .right_o(right4_4), .down_o(down4_4));
    pe pe4_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_5), .left_i(right4_4), .weight(weight_i[423:416]), .right_o(right4_5), .down_o(down4_5));
    pe pe4_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_6), .left_i(right4_5), .weight(weight_i[431:424]), .right_o(right4_6), .down_o(down4_6));
    pe pe4_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_7), .left_i(right4_6), .weight(weight_i[439:432]), .right_o(right4_7), .down_o(down4_7));
    pe pe4_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_8), .left_i(right4_7), .weight(weight_i[447:440]), .right_o(right4_8), .down_o(down4_8));
    pe pe4_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_9), .left_i(right4_8), .weight(weight_i[455:448]), .right_o(right4_9), .down_o(down4_9));
    pe pe4_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_10), .left_i(right4_9), .weight(weight_i[463:456]), .right_o(right4_10), .down_o(down4_10));
    pe pe4_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_11), .left_i(right4_10), .weight(weight_i[471:464]), .right_o(right4_11), .down_o(down4_11));
    pe pe4_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_12), .left_i(right4_11), .weight(weight_i[479:472]), .right_o(right4_12), .down_o(down4_12));
    pe pe4_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_13), .left_i(right4_12), .weight(weight_i[487:480]), .right_o(right4_13), .down_o(down4_13));
    pe pe4_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_14), .left_i(right4_13), .weight(weight_i[495:488]), .right_o(right4_14), .down_o(down4_14));
    pe pe4_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_15), .left_i(right4_14), .weight(weight_i[503:496]), .right_o(right4_15), .down_o(down4_15));
    pe pe4_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down3_16), .left_i(right4_15), .weight(weight_i[511:504]), .right_o(right4_16), .down_o(down4_16));
    
    //ROW5
    wire [7:0] right5_1, right5_2, right5_3, right5_4, right5_5, right5_6, right5_7, right5_8, right5_9, right5_10, right5_11, right5_12, right5_13, right5_14, right5_15, right5_16;
    wire [15:0] down5_1, down5_2, down5_3, down5_4, down5_5, down5_6, down5_7, down5_8, down5_9, down5_10, down5_11, down5_12, down5_13, down5_14, down5_15, down5_16;
    pe pe5_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_1), .left_i(input_i[39:32]), .weight(weight_i[519:512]), .right_o(right5_1), .down_o(down5_1));
    pe pe5_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_2), .left_i(right5_1), .weight(weight_i[527:520]), .right_o(right5_2), .down_o(down5_2));
    pe pe5_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_3), .left_i(right5_2), .weight(weight_i[535:528]), .right_o(right5_3), .down_o(down5_3));
    pe pe5_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_4), .left_i(right5_3), .weight(weight_i[543:536]), .right_o(right5_4), .down_o(down5_4));
    pe pe5_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_5), .left_i(right5_4), .weight(weight_i[551:544]), .right_o(right5_5), .down_o(down5_5));
    pe pe5_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_6), .left_i(right5_5), .weight(weight_i[559:552]), .right_o(right5_6), .down_o(down5_6));
    pe pe5_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_7), .left_i(right5_6), .weight(weight_i[567:560]), .right_o(right5_7), .down_o(down5_7));
    pe pe5_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_8), .left_i(right5_7), .weight(weight_i[575:568]), .right_o(right5_8), .down_o(down5_8));
    pe pe5_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_9), .left_i(right5_8), .weight(weight_i[583:576]), .right_o(right5_9), .down_o(down5_9));
    pe pe5_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_10), .left_i(right5_9), .weight(weight_i[591:584]), .right_o(right5_10), .down_o(down5_10));
    pe pe5_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_11), .left_i(right5_10), .weight(weight_i[599:592]), .right_o(right5_11), .down_o(down5_11));
    pe pe5_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_12), .left_i(right5_11), .weight(weight_i[607:600]), .right_o(right5_12), .down_o(down5_12));
    pe pe5_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_13), .left_i(right5_12), .weight(weight_i[615:608]), .right_o(right5_13), .down_o(down5_13));
    pe pe5_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_14), .left_i(right5_13), .weight(weight_i[623:616]), .right_o(right5_14), .down_o(down5_14));
    pe pe5_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_15), .left_i(right5_14), .weight(weight_i[631:624]), .right_o(right5_15), .down_o(down5_15));
    pe pe5_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down4_16), .left_i(right5_15), .weight(weight_i[639:632]), .right_o(right5_16), .down_o(down5_16));

    //ROW6
    wire [7:0] right6_1, right6_2, right6_3, right6_4, right6_5, right6_6, right6_7, right6_8, right6_9, right6_10, right6_11, right6_12, right6_13, right6_14, right6_15, right6_16;
    wire [15:0] down6_1, down6_2, down6_3, down6_4, down6_5, down6_6, down6_7, down6_8, down6_9, down6_10, down6_11, down6_12, down6_13, down6_14, down6_15, down6_16;
    pe pe6_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_1), .left_i(input_i[47:40]), .weight(weight_i[647:640]), .right_o(right6_1), .down_o(down6_1));
    pe pe6_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_2), .left_i(right6_1), .weight(weight_i[655:648]), .right_o(right6_2), .down_o(down6_2));
    pe pe6_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_3), .left_i(right6_2), .weight(weight_i[663:656]), .right_o(right6_3), .down_o(down6_3));
    pe pe6_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_4), .left_i(right6_3), .weight(weight_i[671:664]), .right_o(right6_4), .down_o(down6_4));
    pe pe6_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_5), .left_i(right6_4), .weight(weight_i[679:672]), .right_o(right6_5), .down_o(down6_5));
    pe pe6_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_6), .left_i(right6_5), .weight(weight_i[687:680]), .right_o(right6_6), .down_o(down6_6));
    pe pe6_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_7), .left_i(right6_6), .weight(weight_i[695:688]), .right_o(right6_7), .down_o(down6_7));
    pe pe6_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_8), .left_i(right6_7), .weight(weight_i[703:696]), .right_o(right6_8), .down_o(down6_8));
    pe pe6_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_9), .left_i(right6_8), .weight(weight_i[711:704]), .right_o(right6_9), .down_o(down6_9));
    pe pe6_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_10), .left_i(right6_9), .weight(weight_i[719:712]), .right_o(right6_10), .down_o(down6_10));
    pe pe6_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_11), .left_i(right6_10), .weight(weight_i[727:720]), .right_o(right6_11), .down_o(down6_11));
    pe pe6_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_12), .left_i(right6_11), .weight(weight_i[735:728]), .right_o(right6_12), .down_o(down6_12));
    pe pe6_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_13), .left_i(right6_12), .weight(weight_i[743:736]), .right_o(right6_13), .down_o(down6_13));
    pe pe6_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_14), .left_i(right6_13), .weight(weight_i[751:744]), .right_o(right6_14), .down_o(down6_14));
    pe pe6_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_15), .left_i(right6_14), .weight(weight_i[759:752]), .right_o(right6_15), .down_o(down6_15));
    pe pe6_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down5_16), .left_i(right6_15), .weight(weight_i[767:760]), .right_o(right6_16), .down_o(down6_16));
    
    wire [7:0] right7_1, right7_2, right7_3, right7_4, right7_5, right7_6, right7_7, right7_8, right7_9, right7_10, right7_11, right7_12, right7_13, right7_14, right7_15, right7_16;
    wire [15:0] down7_1, down7_2, down7_3, down7_4, down7_5, down7_6, down7_7, down7_8, down7_9, down7_10, down7_11, down7_12, down7_13, down7_14, down7_15, down7_16;
    pe pe7_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_1), .left_i(input_i[55:48]), .weight(weight_i[775:768]), .right_o(right7_1), .down_o(down7_1));
    pe pe7_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_2), .left_i(right7_1), .weight(weight_i[783:776]), .right_o(right7_2), .down_o(down7_2));
    pe pe7_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_3), .left_i(right7_2), .weight(weight_i[791:784]), .right_o(right7_3), .down_o(down7_3));
    pe pe7_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_4), .left_i(right7_3), .weight(weight_i[799:792]), .right_o(right7_4), .down_o(down7_4));
    pe pe7_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_5), .left_i(right7_4), .weight(weight_i[807:800]), .right_o(right7_5), .down_o(down7_5));
    pe pe7_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_6), .left_i(right7_5), .weight(weight_i[815:808]), .right_o(right7_6), .down_o(down7_6));
    pe pe7_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_7), .left_i(right7_6), .weight(weight_i[823:816]), .right_o(right7_7), .down_o(down7_7));
    pe pe7_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_8), .left_i(right7_7), .weight(weight_i[831:824]), .right_o(right7_8), .down_o(down7_8));
    pe pe7_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_9), .left_i(right7_8), .weight(weight_i[839:832]), .right_o(right7_9), .down_o(down7_9));
    pe pe7_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_10), .left_i(right7_9), .weight(weight_i[847:840]), .right_o(right7_10), .down_o(down7_10));
    pe pe7_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_11), .left_i(right7_10), .weight(weight_i[855:848]), .right_o(right7_11), .down_o(down7_11));
    pe pe7_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_12), .left_i(right7_11), .weight(weight_i[863:856]), .right_o(right7_12), .down_o(down7_12));
    pe pe7_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_13), .left_i(right7_12), .weight(weight_i[871:864]), .right_o(right7_13), .down_o(down7_13));
    pe pe7_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_14), .left_i(right7_13), .weight(weight_i[879:872]), .right_o(right7_14), .down_o(down7_14));
    pe pe7_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_15), .left_i(right7_14), .weight(weight_i[887:880]), .right_o(right7_15), .down_o(down7_15));
    pe pe7_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down6_16), .left_i(right7_15), .weight(weight_i[895:888]), .right_o(right7_16), .down_o(down7_16));

    wire [7:0] right8_1, right8_2, right8_3, right8_4, right8_5, right8_6, right8_7, right8_8, right8_9, right8_10, right8_11, right8_12, right8_13, right8_14, right8_15, right8_16;
    wire [15:0] down8_1, down8_2, down8_3, down8_4, down8_5, down8_6, down8_7, down8_8, down8_9, down8_10, down8_11, down8_12, down8_13, down8_14, down8_15, down8_16;
    pe pe8_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_1), .left_i(input_i[63:56]), .weight(weight_i[903:896]), .right_o(right8_1), .down_o(down8_1));
    pe pe8_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_2), .left_i(right8_1), .weight(weight_i[911:904]), .right_o(right8_2), .down_o(down8_2));
    pe pe8_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_3), .left_i(right8_2), .weight(weight_i[919:912]), .right_o(right8_3), .down_o(down8_3));
    pe pe8_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_4), .left_i(right8_3), .weight(weight_i[927:920]), .right_o(right8_4), .down_o(down8_4));
    pe pe8_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_5), .left_i(right8_4), .weight(weight_i[935:928]), .right_o(right8_5), .down_o(down8_5));
    pe pe8_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_6), .left_i(right8_5), .weight(weight_i[943:936]), .right_o(right8_6), .down_o(down8_6));
    pe pe8_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_7), .left_i(right8_6), .weight(weight_i[951:944]), .right_o(right8_7), .down_o(down8_7));
    pe pe8_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_8), .left_i(right8_7), .weight(weight_i[959:952]), .right_o(right8_8), .down_o(down8_8));
    pe pe8_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_9), .left_i(right8_8), .weight(weight_i[967:960]), .right_o(right8_9), .down_o(down8_9));
    pe pe8_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_10), .left_i(right8_9), .weight(weight_i[975:968]), .right_o(right8_10), .down_o(down8_10));
    pe pe8_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_11), .left_i(right8_10), .weight(weight_i[983:976]), .right_o(right8_11), .down_o(down8_11));
    pe pe8_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_12), .left_i(right8_11), .weight(weight_i[991:984]), .right_o(right8_12), .down_o(down8_12));
    pe pe8_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_13), .left_i(right8_12), .weight(weight_i[999:992]), .right_o(right8_13), .down_o(down8_13));
    pe pe8_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_14), .left_i(right8_13), .weight(weight_i[1007:1000]), .right_o(right8_14), .down_o(down8_14));
    pe pe8_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_15), .left_i(right8_14), .weight(weight_i[1015:1008]), .right_o(right8_15), .down_o(down8_15));
    pe pe8_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down7_16), .left_i(right8_15), .weight(weight_i[1023:1016]), .right_o(right8_16), .down_o(down8_16));
    
    wire [7:0] right9_1, right9_2, right9_3, right9_4, right9_5, right9_6, right9_7, right9_8, right9_9, right9_10, right9_11, right9_12, right9_13, right9_14, right9_15, right9_16;
    wire [15:0] down9_1, down9_2, down9_3, down9_4, down9_5, down9_6, down9_7, down9_8, down9_9, down9_10, down9_11, down9_12, down9_13, down9_14, down9_15, down9_16;
    pe pe9_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_1), .left_i(input_i[71:64]), .weight(weight_i[1031:1024]), .right_o(right9_1), .down_o(down9_1));
    pe pe9_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_2), .left_i(right9_1), .weight(weight_i[1039:1032]), .right_o(right9_2), .down_o(down9_2));
    pe pe9_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_3), .left_i(right9_2), .weight(weight_i[1047:1040]), .right_o(right9_3), .down_o(down9_3));
    pe pe9_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_4), .left_i(right9_3), .weight(weight_i[1055:1048]), .right_o(right9_4), .down_o(down9_4));
    pe pe9_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_5), .left_i(right9_4), .weight(weight_i[1063:1056]), .right_o(right9_5), .down_o(down9_5));
    pe pe9_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_6), .left_i(right9_5), .weight(weight_i[1071:1064]), .right_o(right9_6), .down_o(down9_6));
    pe pe9_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_7), .left_i(right9_6), .weight(weight_i[1079:1072]), .right_o(right9_7), .down_o(down9_7));
    pe pe9_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_8), .left_i(right9_7), .weight(weight_i[1087:1080]), .right_o(right9_8), .down_o(down9_8));
    pe pe9_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_9), .left_i(right9_8), .weight(weight_i[1095:1088]), .right_o(right9_9), .down_o(down9_9));
    pe pe9_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_10), .left_i(right9_9), .weight(weight_i[1103:1096]), .right_o(right9_10), .down_o(down9_10));
    pe pe9_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_11), .left_i(right9_10), .weight(weight_i[1111:1104]), .right_o(right9_11), .down_o(down9_11));
    pe pe9_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_12), .left_i(right9_11), .weight(weight_i[1119:1112]), .right_o(right9_12), .down_o(down9_12));
    pe pe9_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_13), .left_i(right9_12), .weight(weight_i[1127:1120]), .right_o(right9_13), .down_o(down9_13));
    pe pe9_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_14), .left_i(right9_13), .weight(weight_i[1135:1128]), .right_o(right9_14), .down_o(down9_14));
    pe pe9_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_15), .left_i(right9_14), .weight(weight_i[1143:1136]), .right_o(right9_15), .down_o(down9_15));
    pe pe9_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down8_16), .left_i(right9_15), .weight(weight_i[1151:1144]), .right_o(right9_16), .down_o(down9_16));
    
    wire [7:0] right10_1, right10_2, right10_3, right10_4, right10_5, right10_6, right10_7, right10_8, right10_9, right10_10, right10_11, right10_12, right10_13, right10_14, right10_15, right10_16;
    wire [15:0] down10_1, down10_2, down10_3, down10_4, down10_5, down10_6, down10_7, down10_8, down10_9, down10_10, down10_11, down10_12, down10_13, down10_14, down10_15, down10_16;
    pe pe10_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_1), .left_i(input_i[79:72]), .weight(weight_i[1159:1152]), .right_o(right10_1), .down_o(down10_1));
    pe pe10_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_2), .left_i(right10_1), .weight(weight_i[1167:1160]), .right_o(right10_2), .down_o(down10_2));
    pe pe10_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_3), .left_i(right10_2), .weight(weight_i[1175:1168]), .right_o(right10_3), .down_o(down10_3));
    pe pe10_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_4), .left_i(right10_3), .weight(weight_i[1183:1176]), .right_o(right10_4), .down_o(down10_4));
    pe pe10_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_5), .left_i(right10_4), .weight(weight_i[1191:1184]), .right_o(right10_5), .down_o(down10_5));
    pe pe10_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_6), .left_i(right10_5), .weight(weight_i[1199:1192]), .right_o(right10_6), .down_o(down10_6));
    pe pe10_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_7), .left_i(right10_6), .weight(weight_i[1207:1200]), .right_o(right10_7), .down_o(down10_7));
    pe pe10_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_8), .left_i(right10_7), .weight(weight_i[1215:1208]), .right_o(right10_8), .down_o(down10_8));
    pe pe10_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_9), .left_i(right10_8), .weight(weight_i[1223:1216]), .right_o(right10_9), .down_o(down10_9));
    pe pe10_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_10), .left_i(right10_9), .weight(weight_i[1231:1224]), .right_o(right10_10), .down_o(down10_10));
    pe pe10_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_11), .left_i(right10_10), .weight(weight_i[1239:1232]), .right_o(right10_11), .down_o(down10_11));
    pe pe10_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_12), .left_i(right10_11), .weight(weight_i[1247:1240]), .right_o(right10_12), .down_o(down10_12));
    pe pe10_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_13), .left_i(right10_12), .weight(weight_i[1255:1248]), .right_o(right10_13), .down_o(down10_13));
    pe pe10_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_14), .left_i(right10_13), .weight(weight_i[1263:1256]), .right_o(right10_14), .down_o(down10_14));
    pe pe10_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_15), .left_i(right10_14), .weight(weight_i[1271:1264]), .right_o(right10_15), .down_o(down10_15));
    pe pe10_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down9_16), .left_i(right10_15), .weight(weight_i[1279:1272]), .right_o(right10_16), .down_o(down10_16));
    
    wire [7:0] right11_1, right11_2, right11_3, right11_4, right11_5, right11_6, right11_7, right11_8, right11_9, right11_10, right11_11, right11_12, right11_13, right11_14, right11_15, right11_16;
    wire [15:0] down11_1, down11_2, down11_3, down11_4, down11_5, down11_6, down11_7, down11_8, down11_9, down11_10, down11_11, down11_12, down11_13, down11_14, down11_15, down11_16;
    pe pe11_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_1), .left_i(input_i[87:80]), .weight(weight_i[1287:1280]), .right_o(right11_1), .down_o(down11_1));
    pe pe11_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_2), .left_i(right11_1), .weight(weight_i[1295:1288]), .right_o(right11_2), .down_o(down11_2));
    pe pe11_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_3), .left_i(right11_2), .weight(weight_i[1303:1296]), .right_o(right11_3), .down_o(down11_3));
    pe pe11_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_4), .left_i(right11_3), .weight(weight_i[1311:1304]), .right_o(right11_4), .down_o(down11_4));
    pe pe11_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_5), .left_i(right11_4), .weight(weight_i[1319:1312]), .right_o(right11_5), .down_o(down11_5));
    pe pe11_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_6), .left_i(right11_5), .weight(weight_i[1327:1320]), .right_o(right11_6), .down_o(down11_6));
    pe pe11_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_7), .left_i(right11_6), .weight(weight_i[1335:1328]), .right_o(right11_7), .down_o(down11_7));
    pe pe11_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_8), .left_i(right11_7), .weight(weight_i[1343:1336]), .right_o(right11_8), .down_o(down11_8));
    pe pe11_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_9), .left_i(right11_8), .weight(weight_i[1351:1344]), .right_o(right11_9), .down_o(down11_9));
    pe pe11_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_10), .left_i(right11_9), .weight(weight_i[1359:1352]), .right_o(right11_10), .down_o(down11_10));
    pe pe11_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_11), .left_i(right11_10), .weight(weight_i[1367:1360]), .right_o(right11_11), .down_o(down11_11));
    pe pe11_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_12), .left_i(right11_11), .weight(weight_i[1375:1368]), .right_o(right11_12), .down_o(down11_12));
    pe pe11_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_13), .left_i(right11_12), .weight(weight_i[1383:1376]), .right_o(right11_13), .down_o(down11_13));
    pe pe11_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_14), .left_i(right11_13), .weight(weight_i[1391:1384]), .right_o(right11_14), .down_o(down11_14));
    pe pe11_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_15), .left_i(right11_14), .weight(weight_i[1399:1392]), .right_o(right11_15), .down_o(down11_15));
    pe pe11_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down10_16), .left_i(right11_15), .weight(weight_i[1407:1400]), .right_o(right11_16), .down_o(down11_16));
    
    wire [7:0] right12_1, right12_2, right12_3, right12_4, right12_5, right12_6, right12_7, right12_8, right12_9, right12_10, right12_11, right12_12, right12_13, right12_14, right12_15, right12_16;
    wire [15:0] down12_1, down12_2, down12_3, down12_4, down12_5, down12_6, down12_7, down12_8, down12_9, down12_10, down12_11, down12_12, down12_13, down12_14, down12_15, down12_16;
    pe pe12_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_1), .left_i(input_i[95:88]), .weight(weight_i[1415:1408]), .right_o(right12_1), .down_o(down12_1));
    pe pe12_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_2), .left_i(right12_1), .weight(weight_i[1423:1416]), .right_o(right12_2), .down_o(down12_2));
    pe pe12_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_3), .left_i(right12_2), .weight(weight_i[1431:1424]), .right_o(right12_3), .down_o(down12_3));
    pe pe12_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_4), .left_i(right12_3), .weight(weight_i[1439:1432]), .right_o(right12_4), .down_o(down12_4));
    pe pe12_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_5), .left_i(right12_4), .weight(weight_i[1447:1440]), .right_o(right12_5), .down_o(down12_5));
    pe pe12_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_6), .left_i(right12_5), .weight(weight_i[1455:1448]), .right_o(right12_6), .down_o(down12_6));
    pe pe12_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_7), .left_i(right12_6), .weight(weight_i[1463:1456]), .right_o(right12_7), .down_o(down12_7));
    pe pe12_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_8), .left_i(right12_7), .weight(weight_i[1471:1464]), .right_o(right12_8), .down_o(down12_8));
    pe pe12_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_9), .left_i(right12_8), .weight(weight_i[1479:1472]), .right_o(right12_9), .down_o(down12_9));
    pe pe12_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_10), .left_i(right12_9), .weight(weight_i[1487:1480]), .right_o(right12_10), .down_o(down12_10));
    pe pe12_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_11), .left_i(right12_10), .weight(weight_i[1495:1488]), .right_o(right12_11), .down_o(down12_11));
    pe pe12_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_12), .left_i(right12_11), .weight(weight_i[1503:1496]), .right_o(right12_12), .down_o(down12_12));
    pe pe12_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_13), .left_i(right12_12), .weight(weight_i[1511:1504]), .right_o(right12_13), .down_o(down12_13));
    pe pe12_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_14), .left_i(right12_13), .weight(weight_i[1519:1512]), .right_o(right12_14), .down_o(down12_14));
    pe pe12_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_15), .left_i(right12_14), .weight(weight_i[1527:1520]), .right_o(right12_15), .down_o(down12_15));
    pe pe12_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down11_16), .left_i(right12_15), .weight(weight_i[1535:1528]), .right_o(right12_16), .down_o(down12_16));
    
    wire [7:0] right13_1, right13_2, right13_3, right13_4, right13_5, right13_6, right13_7, right13_8, right13_9, right13_10, right13_11, right13_12, right13_13, right13_14, right13_15, right13_16;
    wire [15:0] down13_1, down13_2, down13_3, down13_4, down13_5, down13_6, down13_7, down13_8, down13_9, down13_10, down13_11, down13_12, down13_13, down13_14, down13_15, down13_16;
    pe pe13_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_1), .left_i(input_i[103:96]), .weight(weight_i[1543:1536]), .right_o(right13_1), .down_o(down13_1));
    pe pe13_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_2), .left_i(right13_1), .weight(weight_i[1551:1544]), .right_o(right13_2), .down_o(down13_2));
    pe pe13_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_3), .left_i(right13_2), .weight(weight_i[1559:1552]), .right_o(right13_3), .down_o(down13_3));
    pe pe13_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_4), .left_i(right13_3), .weight(weight_i[1567:1560]), .right_o(right13_4), .down_o(down13_4));
    pe pe13_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_5), .left_i(right13_4), .weight(weight_i[1575:1568]), .right_o(right13_5), .down_o(down13_5));
    pe pe13_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_6), .left_i(right13_5), .weight(weight_i[1583:1576]), .right_o(right13_6), .down_o(down13_6));
    pe pe13_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_7), .left_i(right13_6), .weight(weight_i[1591:1584]), .right_o(right13_7), .down_o(down13_7));
    pe pe13_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_8), .left_i(right13_7), .weight(weight_i[1599:1592]), .right_o(right13_8), .down_o(down13_8));
    pe pe13_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_9), .left_i(right13_8), .weight(weight_i[1607:1600]), .right_o(right13_9), .down_o(down13_9));
    pe pe13_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_10), .left_i(right13_9), .weight(weight_i[1615:1608]), .right_o(right13_10), .down_o(down13_10));
    pe pe13_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_11), .left_i(right13_10), .weight(weight_i[1623:1616]), .right_o(right13_11), .down_o(down13_11));
    pe pe13_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_12), .left_i(right13_11), .weight(weight_i[1631:1624]), .right_o(right13_12), .down_o(down13_12));
    pe pe13_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_13), .left_i(right13_12), .weight(weight_i[1639:1632]), .right_o(right13_13), .down_o(down13_13));
    pe pe13_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_14), .left_i(right13_13), .weight(weight_i[1647:1640]), .right_o(right13_14), .down_o(down13_14));
    pe pe13_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_15), .left_i(right13_14), .weight(weight_i[1655:1648]), .right_o(right13_15), .down_o(down13_15));
    pe pe13_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down12_16), .left_i(right13_15), .weight(weight_i[1663:1656]), .right_o(right13_16), .down_o(down13_16));
    
    wire [7:0] right14_1, right14_2, right14_3, right14_4, right14_5, right14_6, right14_7, right14_8, right14_9, right14_10, right14_11, right14_12, right14_13, right14_14, right14_15, right14_16;
    wire [15:0] down14_1, down14_2, down14_3, down14_4, down14_5, down14_6, down14_7, down14_8, down14_9, down14_10, down14_11, down14_12, down14_13, down14_14, down14_15, down14_16;
    pe pe14_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_1), .left_i(input_i[111:104]), .weight(weight_i[1671:1664]), .right_o(right14_1), .down_o(down14_1));
    pe pe14_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_2), .left_i(right14_1), .weight(weight_i[1679:1672]), .right_o(right14_2), .down_o(down14_2));
    pe pe14_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_3), .left_i(right14_2), .weight(weight_i[1687:1680]), .right_o(right14_3), .down_o(down14_3));
    pe pe14_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_4), .left_i(right14_3), .weight(weight_i[1695:1688]), .right_o(right14_4), .down_o(down14_4));
    pe pe14_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_5), .left_i(right14_4), .weight(weight_i[1703:1696]), .right_o(right14_5), .down_o(down14_5));
    pe pe14_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_6), .left_i(right14_5), .weight(weight_i[1711:1704]), .right_o(right14_6), .down_o(down14_6));
    pe pe14_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_7), .left_i(right14_6), .weight(weight_i[1719:1712]), .right_o(right14_7), .down_o(down14_7));
    pe pe14_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_8), .left_i(right14_7), .weight(weight_i[1727:1720]), .right_o(right14_8), .down_o(down14_8));
    pe pe14_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_9), .left_i(right14_8), .weight(weight_i[1735:1728]), .right_o(right14_9), .down_o(down14_9));
    pe pe14_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_10), .left_i(right14_9), .weight(weight_i[1743:1736]), .right_o(right14_10), .down_o(down14_10));
    pe pe14_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_11), .left_i(right14_10), .weight(weight_i[1751:1744]), .right_o(right14_11), .down_o(down14_11));
    pe pe14_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_12), .left_i(right14_11), .weight(weight_i[1759:1752]), .right_o(right14_12), .down_o(down14_12));
    pe pe14_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_13), .left_i(right14_12), .weight(weight_i[1767:1760]), .right_o(right14_13), .down_o(down14_13));
    pe pe14_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_14), .left_i(right14_13), .weight(weight_i[1775:1768]), .right_o(right14_14), .down_o(down14_14));
    pe pe14_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_15), .left_i(right14_14), .weight(weight_i[1783:1776]), .right_o(right14_15), .down_o(down14_15));
    pe pe14_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down13_16), .left_i(right14_15), .weight(weight_i[1791:1784]), .right_o(right14_16), .down_o(down14_16));
    
    wire [7:0] right15_1, right15_2, right15_3, right15_4, right15_5, right15_6, right15_7, right15_8, right15_9, right15_10, right15_11, right15_12, right15_13, right15_14, right15_15, right15_16;
    wire [15:0] down15_1, down15_2, down15_3, down15_4, down15_5, down15_6, down15_7, down15_8, down15_9, down15_10, down15_11, down15_12, down15_13, down15_14, down15_15, down15_16;
    pe pe15_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_1), .left_i(input_i[119:112]), .weight(weight_i[1799:1792]), .right_o(right15_1), .down_o(down15_1));
    pe pe15_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_2), .left_i(right15_1), .weight(weight_i[1807:1800]), .right_o(right15_2), .down_o(down15_2));
    pe pe15_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_3), .left_i(right15_2), .weight(weight_i[1815:1808]), .right_o(right15_3), .down_o(down15_3));
    pe pe15_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_4), .left_i(right15_3), .weight(weight_i[1823:1816]), .right_o(right15_4), .down_o(down15_4));
    pe pe15_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_5), .left_i(right15_4), .weight(weight_i[1831:1824]), .right_o(right15_5), .down_o(down15_5));
    pe pe15_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_6), .left_i(right15_5), .weight(weight_i[1839:1832]), .right_o(right15_6), .down_o(down15_6));
    pe pe15_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_7), .left_i(right15_6), .weight(weight_i[1847:1840]), .right_o(right15_7), .down_o(down15_7));
    pe pe15_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_8), .left_i(right15_7), .weight(weight_i[1855:1848]), .right_o(right15_8), .down_o(down15_8));
    pe pe15_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_9), .left_i(right15_8), .weight(weight_i[1863:1856]), .right_o(right15_9), .down_o(down15_9));
    pe pe15_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_10), .left_i(right15_9), .weight(weight_i[1871:1864]), .right_o(right15_10), .down_o(down15_10));
    pe pe15_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_11), .left_i(right15_10), .weight(weight_i[1879:1872]), .right_o(right15_11), .down_o(down15_11));
    pe pe15_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_12), .left_i(right15_11), .weight(weight_i[1887:1880]), .right_o(right15_12), .down_o(down15_12));
    pe pe15_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_13), .left_i(right15_12), .weight(weight_i[1895:1888]), .right_o(right15_13), .down_o(down15_13));
    pe pe15_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_14), .left_i(right15_13), .weight(weight_i[1903:1896]), .right_o(right15_14), .down_o(down15_14));
    pe pe15_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_15), .left_i(right15_14), .weight(weight_i[1911:1904]), .right_o(right15_15), .down_o(down15_15));
    pe pe15_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down14_16), .left_i(right15_15), .weight(weight_i[1919:1912]), .right_o(right15_16), .down_o(down15_16));
    
    wire [7:0] right16_1, right16_2, right16_3, right16_4, right16_5, right16_6, right16_7, right16_8, right16_9, right16_10, right16_11, right16_12, right16_13, right16_14, right16_15, right16_16;
    wire [15:0] out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16;
    pe pe16_1(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_1), .left_i(input_i[127:120]), .weight(weight_i[1927:1920]), .right_o(right16_1), .down_o(out1));
    pe pe16_2(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_2), .left_i(right16_1), .weight(weight_i[1935:1928]), .right_o(right16_2), .down_o(out2));
    pe pe16_3(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_3), .left_i(right16_2), .weight(weight_i[1943:1936]), .right_o(right16_3), .down_o(out3));
    pe pe16_4(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_4), .left_i(right16_3), .weight(weight_i[1951:1944]), .right_o(right16_4), .down_o(out4));
    pe pe16_5(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_5), .left_i(right16_4), .weight(weight_i[1959:1952]), .right_o(right16_5), .down_o(out5));
    pe pe16_6(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_6), .left_i(right16_5), .weight(weight_i[1967:1960]), .right_o(right16_6), .down_o(out6));
    pe pe16_7(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_7), .left_i(right16_6), .weight(weight_i[1975:1968]), .right_o(right16_7), .down_o(out7));
    pe pe16_8(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_8), .left_i(right16_7), .weight(weight_i[1983:1976]), .right_o(right16_8), .down_o(out8));
    pe pe16_9(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_9), .left_i(right16_8), .weight(weight_i[1991:1984]), .right_o(right16_9), .down_o(out9));
    pe pe16_10(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_10), .left_i(right16_9), .weight(weight_i[1999:1992]), .right_o(right16_10), .down_o(out10));
    pe pe16_11(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_11), .left_i(right16_10), .weight(weight_i[2007:2000]), .right_o(right16_11), .down_o(out11));
    pe pe16_12(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_12), .left_i(right16_11), .weight(weight_i[2015:2008]), .right_o(right16_12), .down_o(out12));
    pe pe16_13(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_13), .left_i(right16_12), .weight(weight_i[2023:2016]), .right_o(right16_13), .down_o(out13));
    pe pe16_14(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_14), .left_i(right16_13), .weight(weight_i[2031:2024]), .right_o(right16_14), .down_o(out14));
    pe pe16_15(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_15), .left_i(right16_14), .weight(weight_i[2039:2032]), .right_o(right16_15), .down_o(out15));
    pe pe16_16(.clk(clk), .rst_n(reset_n), .en(enable), .up_i(down15_16), .left_i(right16_15), .weight(weight_i[2047:2040]), .right_o(right16_16), .down_o(out16));
    
    always @*
    begin
        result_o[15:0] = out1;
        result_o[31:16] = out2;
        result_o[47:32] = out3;
        result_o[63:48] = out4;
        result_o[79:64] = out5;
        result_o[95:80] = out6;
        result_o[111:96] = out7;
        result_o[127:112] = out8;
        result_o[143:128] = out9;
        result_o[159:144] = out10;
        result_o[175:160] = out11;
        result_o[191:176] = out12;
        result_o[207:192] = out13;
        result_o[223:208] = out14;
        result_o[239:224] = out15;
        result_o[255:240] = out16;
    end
endmodule
