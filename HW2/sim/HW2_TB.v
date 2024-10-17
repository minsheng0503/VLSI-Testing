`timescale 1ns / 1ps
module fault_simulation_test;
	reg A,B,C,D,E,SA,En;
	reg [3:0] counter;
	wire FT,FF,result;
	
	top U1(.A(A),.B(B),.C(C),.D(D),.E(E),.counter(counter),.SA(SA),.En(En),.FT(FT),.FF(FF),.result(result));
	
	initial begin
		// initialization
		A=0; B=0; C=0; D=0; E=0; En=0; counter=4'b0000; SA=0;
		#10;

		// insert 1st pattern {10101}
		A=1; B=0; C=1; D=0; E=1; En=0;
		#20;
		while(counter <= 4'd12) begin
			En=1;
			repeat(2) begin
				#10;
				SA = ~SA;
			end
			counter = counter + 1'b1;
		end

		// insert 2nd pattern {10010}
		A=0; B=0; C=0; D=0; E=0; En=0; counter=4'b0000; SA=0;
		#10;
		A=1; B=0; C=0; D=1; E=0; En=0;
		#20;
		while(counter <= 4'd12) begin
			En=1;
			repeat(2) begin
				#10;
				SA = ~SA;
			end
			counter = counter + 1'b1;
		end

		// insert 3rd pattern {00010}
		A=0; B=0; C=0; D=0; E=0; En=0; counter=4'b0000; SA=0;
		#10;
		A=0; B=0; C=0; D=1; E=0; En=0;
		#20;
		while(counter <= 4'd12) begin
			En=1;
			repeat(2) begin
				#10;
				SA = ~SA;
			end
			counter = counter + 1'b1;
		end

		// insert 4th pattern {10100}
		A=0; B=0; C=0; D=0; E=0; En=0; counter=4'b0000; SA=0;
		#10;
		A=1; B=0; C=1; D=0; E=0; En=0;
		#20;
		while(counter <= 4'd12) begin
			En=1;
			repeat(2) begin
				#10;
				SA = ~SA;
			end
			counter = counter + 1'b1;
		end

		// finish simulation
		#10 $finish;
	end

	initial begin
		$fsdbDumpfile("HW2.fsdb");
		$fsdbDumpvars();
	end		 
endmodule






   






