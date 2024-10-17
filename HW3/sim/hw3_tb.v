//testbench for good circuit
`timescale 1ns/1ps

`define CYCLE_TIME 10

module hw3_tb;

//signal declaration
reg x1,x2,x3,x4,sa0,clk,rst;
wire f,s0,s1,s2,s3,out;

real CYCLE = `CYCLE_TIME;

initial clk = 0;
always #((CYCLE)/2) clk = ~clk;

top U0(.x1(x1), .x2(x2), .x3(x3), .x4(x4), .sa0(sa0), .clk(clk), .rst(rst),
       .f(f), .s0(s0), .s1(s1), .s2(s2), .s3(s3), .out(out));

initial begin
    rst = 0;
    sa0 = 1;
    x1 = 0;
    x2 = 0;
    x3 = 0;
    x4 = 0;

    repeat(2) #(CYCLE);
    rst = 1;
    repeat(2) #(CYCLE);
    rst = 0;
    repeat(1) #(CYCLE);
    
    @(negedge clk) begin
        x1 = 0;
        x2 = 0;
        x3 = 0;
        x4 = 1;
    end

    @(negedge clk) begin
        x1 = 1;
        x2 = 1;
        x3 = 0;
        x4 = 0;
    end

    @(negedge clk) begin
        x1 = 0;
        x2 = 1;
        x3 = 1;
        x4 = 0;
    end

    @(negedge clk) begin
        x1 = 0;
        x2 = 0;
        x3 = 1;
        x4 = 1;
    end

    @(negedge clk) begin
        x1 = 1;
        x2 = 1;
        x3 = 0;
        x4 = 1;
    end

    @(negedge clk) begin
        x1 = 1;
        x2 = 0;
        x3 = 1;
        x4 = 0;
    end

    @(negedge clk) begin
        x1 = 0;
        x2 = 1;
        x3 = 0;
        x4 = 1;
    end

    @(negedge clk) begin
        x1 = 1;
        x2 = 1;
        x3 = 1;
        x4 = 0;
    end

    @(negedge clk) begin
        x1 = 0;
        x2 = 1;
        x3 = 1;
        x4 = 1;
    end

    @(negedge clk) begin
        x1 = 1;
        x2 = 1;
        x3 = 1;
        x4 = 1;
    end

    @(negedge clk) begin
        x1 = 1;
        x2 = 0;
        x3 = 1;
        x4 = 1;
    end

    @(negedge clk) begin
        x1 = 1;
        x2 = 0;
        x3 = 0;
        x4 = 1;
    end

    @(negedge clk) begin
        x1 = 1;
        x2 = 0;
        x3 = 0;
        x4 = 0;
    end

    @(negedge clk) begin
        x1 = 0;
        x2 = 1;
        x3 = 0;
        x4 = 0;
    end

    @(negedge clk) begin
        x1 = 0;
        x2 = 0;
        x3 = 1;
        x4 = 0;
    end

    repeat(20) #(CYCLE); $finish;
end

//gen waveform file
initial begin
    $fsdbDumpfile("wave.fsdb");
    $fsdbDumpvars();
end

endmodule