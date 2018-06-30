`timescale 1ns / 1ps

module NODE_2(
input signed [35:0] A,
input [5:0] step,
input CLK,
input ENABLE,
input RST,
output reg signed [39:0] OUT //16-bit output
    );
    
reg signed [39:0] accumulator = 40'd0; //store the matrix mult here
reg signed [8:0] weights [63:0]; //store the weights here
reg signed [7:0] bias; //store node bias here

initial begin
   weights[0]<=9'b110100111;
   weights[1]<=9'b111110100;
   weights[2]<=9'b111110010;
   weights[3]<=9'b001000011;
   weights[4]<=9'b000011010;
   weights[5]<=9'b111101111;
   weights[6]<=9'b111010100;
   weights[7]<=9'b000011000;
   weights[8]<=9'b000010000;
   weights[9]<=9'b111011111;
   weights[10]<=9'b111111000;
   weights[11]<=9'b111110001;
   weights[12]<=9'b111111100;
   weights[13]<=9'b000000110;
   weights[14]<=9'b000000101;
   weights[15]<=9'b000000101;
   weights[16]<=9'b111111100;
   weights[17]<=9'b111101000;
   weights[18]<=9'b000000010;
   weights[19]<=9'b000001011;
   weights[20]<=9'b000010010;
   weights[21]<=9'b110011010;
   weights[22]<=9'b000010101;
   weights[23]<=9'b110111110;
   weights[24]<=9'b111110111;
   weights[25]<=9'b000110100;
   weights[26]<=9'b000001001;
   weights[27]<=9'b111111001;
   weights[28]<=9'b111100000;
   weights[29]<=9'b000010010;
   weights[30]<=9'b000011011;
   weights[31]<=9'b000100001;
   weights[32]<=9'b000101011;
   weights[33]<=9'b000110011;
   weights[34]<=9'b110100110;
   weights[35]<=9'b111101111;
   weights[36]<=9'b000011000;
   weights[37]<=9'b111011110;
   weights[38]<=9'b111001110;
   weights[39]<=9'b000001000;
   weights[40]<=9'b000000111;
   weights[41]<=9'b000010000;
   weights[42]<=9'b000001000;
   weights[43]<=9'b000011111;
   weights[44]<=9'b111001100;
   weights[45]<=9'b111001110;
   weights[46]<=9'b111101101;
   weights[47]<=9'b000011111;
   weights[48]<=9'b000000110;
   weights[49]<=9'b000001110;
   weights[50]<=9'b000001011;
   weights[51]<=9'b111111110;
   weights[52]<=9'b111101110;
   weights[53]<=9'b111101011;
   weights[54]<=9'b000100111;
   weights[55]<=9'b000001011;
   weights[56]<=9'b111110010;
   weights[57]<=9'b111110010;
   weights[58]<=9'b000001111;
   weights[59]<=9'b111101001;
   weights[60]<=9'b111111100;
   weights[61]<=9'b111100010;
   weights[62]<=9'b000000111;
   weights[63]<=9'b110111000;
   bias<=8'b00001101;
 end
 
 always @ ( posedge CLK )
 begin
    if( ENABLE == 1 && RST == 0 )
    begin
        if ( step == 0 )
        begin
            accumulator <=  A * weights[step];
        end
        else if( step == 63 )
        begin
            OUT <= accumulator + bias + A * weights[step];
        end else accumulator <=  A * weights[step] + accumulator;
    end
 end

endmodule
