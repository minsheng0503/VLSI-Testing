`timescale 1 ps/ 1 ps
module BIST_FA16_TB();

reg c0;
reg clk;
reg en;
reg rst;
reg test;
reg [15:0] x;
reg [15:0] y;
                                             
wire carry_out;
wire pf;
wire [15:0] sum;

                    
BIST_FA16 i1 (
	.c0(c0),
	.carry_out(carry_out),
	.clk(clk),
	.en(en),
	.pf(pf),
	.rst(rst),
	.sum(sum),
	.test(test),
	.x(x),
	.y(y)
);

always#5
begin
	clk = ~clk;
end

initial begin
	#0	rst = 0; clk = 0; c0 = 0; en = 0; test = 1;
	#2 rst = 1;
	#5 rst = 0;
	#8 x = 16'b0001_1011_0101_1110; y = 16'b0110_1111_0000_0111;
	   en = 1; 
	#10 x = 16'b1100_0000_1110_0001; y = 16'b0001_1111_1111_0000;
	    c0 = 0;
	#100 test = 0;
	#10 x = 0; y = 0;
	#10 x = 16'd387; y = 16'd1212;
	#10 x = 16'd520; y = 16'd1268; c0 = 1;
	#10 x = 16'd698; y = 16'd8787; c0 = 0;
	#10 x = 16'd503; y = 16'd915; c0 = 1;
	#10 test = 1;
	#100 test = 0;
	#20 $finish;
end



initial begin
	$fsdbDumpfile("BIST_FA16.fsdb");
	$fsdbDumpvars();
	$fsdbDumpMDA();
end
endmodule

