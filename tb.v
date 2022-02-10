`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2021 11:52:49 PM
// Design Name: 
// Module Name: tb
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

/**********************************************************************************************************************
*                    -------         -------         -------         -------
*    input_i[7:0] -> | PE0 |---------| PE1 |---------| PE2 |  ...... | PE15|
*                    -------         -------         -------         -------
*                       |               |               |               |
*                       |               |               |               |
*                    -------         -------         -------         -------
*   input_i[15:8] -> | PE16|---------| PE17|---------| PE18|  ...... | PE31|
*                    -------         -------         -------         -------
*                       |               |               |               |
*                       .               .               .               .
*                       .               .               .               .
*                       .               .               .               .
*                       |               |               |               |
*                    -------         -------         -------         -------
*input_i[127:120] -> |PE240|---------|PE241|---------|PE242|  ...... |PE255|
*                    -------         -------         -------         -------
*                       |               |               |               |
*                result_o[15:0] result_o[31:16] result_o[47:32]  result_o[255:240]
*
*
* Note:
* 1. The size of the systolic array is 16*16.
* 2. The data width of inputs and weights are 8 bit and the outputs are 16 bit.
* 3. Cascade the input of PEs and output of PEs to input_i and result_o repectively.
* TODO:
* 1. Construct a systolic array with size of 16*16 PEs.
* 2. Your top module should be named "Systolic_array", and the I/O port should be same as it is instantiated in the bottom of this file. 
* 3. Run each layer seperately.
* 4. Use data_generator.c to generate weight.mem and input.mem
* 5. Modify the `define on the top of this file to fit the parameter of the two convolution layer.
* 6. If you use vivado, result.txt would be stored in <project_name>.sim/sim_1/behav/xsim/
* 7. Check if your result is same as the provided example result.txt
* 8. We will use other testcases to test your implementation.
*************************************************************************************************************************/
module tb;
    // Your top module should be instatiated like this!!

    reg clk, reset_n, en;
    reg [8*`ARRAY_SIZE*`ARRAY_SIZE-1:0] weight_i;
    reg [8*`ARRAY_SIZE-1:0] input_i;
    wire [16*`ARRAY_SIZE-1:0] result_o;
    
    reg [7:0] weight_data [0:`ARRAY_SIZE*`ARRAY_SIZE-1];
    reg [7:0] input_data [0:`ARRAY_SIZE*((`INPUT_SIZE-`KERNEL_SIZE+1)*(`INPUT_SIZE-`KERNEL_SIZE+1)+(`ARRAY_SIZE-1))-1];
    
    reg [31:0] count;
    wire result_en;
    
    integer i;
    integer handle;
    initial begin
        $readmemh("weight.mem", weight_data);
        $readmemh("input.mem", input_data);
        handle = $fopen("result.txt","w");
        reset_n = 0;
        clk = 0;
        en = 0;
        #40 reset_n = 1; en = 1;
        #6000; $fclose(handle);
        $finish;
    end
    
    always #10 clk = ~clk;
    
    // read weight from weight_data and set weight_i
    always@(posedge clk) begin
        for(i=0;i<`ARRAY_SIZE*`ARRAY_SIZE;i=i+1)begin
            weight_i[8*i+:8] <= weight_data[i];    
        end
    end
    
    //read input from input data and set input_i every cycle
    always@(posedge clk) begin
        if(~en)begin
            count <= 0;
            input_i <= 0;
        end
        else begin
            if(count<(`INPUT_SIZE-`KERNEL_SIZE+1)*(`INPUT_SIZE-`KERNEL_SIZE+1)+(`ARRAY_SIZE-1)) begin
                for(i=0;i<`ARRAY_SIZE;i=i+1)begin
                    input_i[8*i+:8] <= input_data[count*`ARRAY_SIZE+i];
                end
            end
            else begin
                input_i <= 0;
            end
            count <= count + 1;
        end
    end
    
    //the output coms out at the 16 cycle after the input be fed into systolic array.  
    assign result_en = count > `ARRAY_SIZE && count <= (`INPUT_SIZE-`KERNEL_SIZE+1)*(`INPUT_SIZE-`KERNEL_SIZE+1)+(`ARRAY_SIZE-1)+`ARRAY_SIZE;
    
    // At each cycle, if result_en, write the output of PE array to the output file.
    always@(posedge clk) begin
        if(result_en)begin
            $fdisplay(handle, "%64x", result_o);
        end
    end
        Systolic_array sa(
        .clk(clk),
        .reset_n(reset_n),
        .enable(en),
        .weight_i(weight_i),
        .input_i(input_i),
        .result_o(result_o)
    );  
endmodule
