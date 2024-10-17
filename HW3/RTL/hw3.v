module top(x1,x2,x3,x4,sa0,clk,rst,f,s0,s1,s2,s3,out);
input x1,x2,x3,x4,sa0,clk,rst;
output f,s0,s1,s2,s3,out;
circuit c0(f,x1,x2,x3,x4,sa0);
LFSR    l0(out,f,clk,rst,s0,s1,s2,s3);
endmodule

//design for circuit
module circuit(f,x1,x2,x3,x4,sa0);
input x1,x2,x3,x4,sa0;
output f;
wire x1_n,x2_n,x3_n,x4_n;

not(x1_n,x1);
not(x2_n,x2);
not(x3_n,x3);
not(x4_n,x4);

and4 a0(w1,x1,x2_n,x3_n,x4_n);
and4 a1(w2,x1_n,x2_n,x3,x4_n);
and4 a2(w3,x1,x2,x3_n,x4);
and4 a3(w4,x1_n,x2,x3_n,x4_n);
and4 a4(w5,x1_n,x2,x3,x4);
and4 a5(w6,x1,x2,x3_n,x4);

or(w7,w1,w2);
or4 o0(w8,w3,w4,w5,w6);

assign w9 = sa0? 0 : w8;

or(f,w7,w9);
endmodule

//design for 4 input AND gate
module and4(e,a,b,c,d);
input a,b,c,d;
output e;
and(w1,a,b);
and(w2,c,d);
and(e,w1,w2);
endmodule

//design for 4 input OR gate
module or4(e,a,b,c,d);
input a,b,c,d;
output e;
or(w1,a,b);
or(w2,c,d);
or(e,w1,w2);
endmodule

//design for D flip-flop
module DFF(d,q,clk,rst);
input d,clk,rst;
output reg q;
always@(posedge clk)begin
    if(rst)begin
        q <= 0;
    end
    else begin
        q <= d;
    end
end
endmodule

//design for LFSR
module LFSR(out,f,clk,rst,s0,s1,s2,s3);
input f,clk,rst;
output s0,s1,s2,s3,out;
wire w1, w2;

xor(w1,out,f);
DFF D0(w1,s0,clk,rst);
xor(w2,out,s0);
DFF D1(w2,s1,clk,rst);
DFF D2(s1,s2,clk,rst);
DFF D3(s2,s3,clk,rst);
assign out = s3;
endmodule