module top(A,B,C,D,E,En,SA,counter,FF,FT,result);

    input A,B,C,D,E,En,SA;  //En use to control demux
                            //SA use to decide stuck at fault
    input[3:0] counter;
    output FF,FT,result;
    wire result;
    wire [12:0] selector;
    wire w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;

    //implement the faulty circuit
    mux mux0(SA,A,w0,w14);    //mux for each test node, # of node = 5+6+2=13
    mux mux1(SA,B,w1,w15);
    mux mux2(SA,C,w2,w16);
    mux mux3(SA,D,w3,w17);
    mux mux4(SA,E,w4,w18);
    nor nor0(w19,w16,w17);
    mux mux5(SA,w19,w5,w20);
    not inv0(w21,w18);
    mux mux6(SA,w21,w6,w22);
    and and0(w23,w15,w20);
    mux mux7(SA,w23,w7,w24);
    mux mux8(SA,w24,w8,w25);
    mux mux9(SA,w24,w9,w26);
    nor nor1(w27,w14,w25);
    mux mux10(SA,w27,w10,w28);
    and and1(w29,w26,w22);
    mux mux11(SA,w29,w11,w30);
    or  or0(w31,w28,w30);
    mux mux12(SA,w31,w12,FT);

    //TPG with demux
    demux D0(En,counter,selector);
    assign {w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12} = selector;

    //call  the fault-free circuit
    circuit C1(A,B,C,D,E,FF);

    //XOR FF and FT to get final result
    assign result = FF ^ FT;


endmodule

//mux
module mux(A,B,S,Y);
    input A,B,S;
    output Y;

    assign Y = (S) ? A : B;

endmodule

//implement TPG with demux
module demux(En,counter,out);
    input En;
    input [3:0] counter;
    output reg [12:0] out;

    always@(*)begin
        if(En)begin
            out = 13'b0000000000000;
            out[12-counter] = 1'b1;
        end
        else
            out = 13'b0000000000000;
    end

endmodule

//implement the original fault-free circuit
module circuit(A,B,C,D,E,F);
    input A,B,C,D,E;
    output F;

    nor (w1,C,D);
    and (w2,w1,B);
    nor (w3,w2,A);
    not (w4,E);
    and (w5,w4,w2);
    or  (F,w5,w3);

endmodule