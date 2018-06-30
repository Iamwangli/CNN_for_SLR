`timescale 1ns / 1ps

module NODE_0(
input signed [35:0] A,
input [5:0] step,
input CLK,
input ENABLE,
input RST,
output reg signed [39:0] OUT, //128-bit output
output reg DONE
    );

reg signed [39:0] accumulator = 40'd0; //store the matrix mult here
reg signed [8:0] weights [63:0]; //store the weights here
reg signed [7:0] bias; //store node bias here

initial begin
   weights[0]<=9'b111001101;
   weights[1]<=9'b111011100;
   weights[2]<=9'b000000110;
   weights[3]<=9'b000011101;
   weights[4]<=9'b000100100;
   weights[5]<=9'b001010000;
   weights[6]<=9'b000100101;
   weights[7]<=9'b000010010;
   weights[8]<=9'b111101100;
   weights[9]<=9'b000000010;
   weights[10]<=9'b111011011;
   weights[11]<=9'b001010010;
   weights[12]<=9'b111000111;
   weights[13]<=9'b000111000;
   weights[14]<=9'b111101101;
   weights[15]<=9'b111010100;
   weights[16]<=9'b111010101;
   weights[17]<=9'b000000101;
   weights[18]<=9'b111111100;
   weights[19]<=9'b111111111;
   weights[20]<=9'b000111010;
   weights[21]<=9'b111010100;
   weights[22]<=9'b000000001;
   weights[23]<=9'b111011111;
   weights[24]<=9'b000000001;
   weights[25]<=9'b000101010;
   weights[26]<=9'b000011110;
   weights[27]<=9'b000000001;
   weights[28]<=9'b001000110;
   weights[29]<=9'b000010101;
   weights[30]<=9'b000000010;
   weights[31]<=9'b000001000;
   weights[32]<=9'b110011110;
   weights[33]<=9'b000001010;
   weights[34]<=9'b000100011;
   weights[35]<=9'b000010011;
   weights[36]<=9'b111101101;
   weights[37]<=9'b111011110;
   weights[38]<=9'b000010110;
   weights[39]<=9'b111110011;
   weights[40]<=9'b111100001;
   weights[41]<=9'b111110001;
   weights[42]<=9'b000000001;
   weights[43]<=9'b111110110;
   weights[44]<=9'b000100101;
   weights[45]<=9'b000100101;
   weights[46]<=9'b000010101;
   weights[47]<=9'b000000010;
   weights[48]<=9'b111011100;
   weights[49]<=9'b000100001;
   weights[50]<=9'b111101011;
   weights[51]<=9'b000110110;
   weights[52]<=9'b000001011;
   weights[53]<=9'b111001000;
   weights[54]<=9'b000101010;
   weights[55]<=9'b111111001;
   weights[56]<=9'b000001100;
   weights[57]<=9'b000010001;
   weights[58]<=9'b000010001;
   weights[59]<=9'b111111000;
   weights[60]<=9'b111110100;
   weights[61]<=9'b111111001;
   weights[62]<=9'b111010100;
   weights[63]<=9'b000100001;
   bias<=8'b11111010;
   end


 //MAIN SYNCHRONOUS ACCUMULATION BLOCK
 always @ ( posedge CLK )
 begin
    if( ENABLE == 1 && RST == 0 )
    begin
        if ( step == 0 )
        begin
            accumulator <=  A * weights[step];
            DONE <= 0;
        end
        else if( step == 63 )
        begin
            OUT <= accumulator + bias + A * weights[step];
            DONE <= 1;
        end else accumulator <=  A * weights[step] + accumulator;
    end
 end

endmodule
