module BIST_FA16(clk,en,test,rst,pf,x,y,c0,sum,carry_out);
	input  [15:0] x,y;
	input  clk,en,test,rst,c0;
	output [15:0]sum;
	output carry_out,pf;
	reg    [15:0]x_reg,y_reg;
	reg    [2:0]count;
	reg    c_in_reg;

	always@(posedge clk) begin
		if(test)begin
			count <= count +1 ;
		end
	end

	always@(posedge clk) begin
		if((!en)||rst)
		begin
			x_reg<={16{1'b0}};
			y_reg<={16{1'b0}};
			c_in_reg<=1'b0;
			count<=3'd0;
		end
		else
		begin
			if(test)
			begin
				case (count)
					3'b000:begin x_reg<={16{1'b0}};y_reg<={16{1'b0}};c_in_reg<=1'b0; end
					3'b001:begin x_reg<={16{1'b0}};y_reg<={16{1'b1}};c_in_reg<=1'b0; end
					3'b010:begin x_reg<={16{1'b0}};y_reg<={16{1'b1}};c_in_reg<=1'b1; end
					3'b011:begin x_reg<={16{1'b1}};y_reg<={16{1'b0}};c_in_reg<=1'b0; end
					3'b100:begin x_reg<={16{1'b1}};y_reg<={16{1'b0}};c_in_reg<=1'b1; end
					3'b101:begin x_reg<={16{1'b1}};y_reg<={16{1'b1}};c_in_reg<=1'b1; end
					3'b110:begin x_reg<={8{2'b01}};y_reg<={8{2'b01}};c_in_reg<=1'b0; end
					3'b111:begin x_reg<={8{2'b10}};y_reg<={8{2'b10}};c_in_reg<=1'b1; end
				endcase
				//count<=count+1;
			end
			else
			begin
				x_reg<=x;
				y_reg<=y;
				c_in_reg<=c0;
			end
		end
	end
	adder16 add16(x_reg,y_reg,c_in_reg,sum,carry_out);
	comparator u1(en,test,rst,sum,carry_out,count,pf);
endmodule 	


module comparator(en,test,rst,sum,carry_out,count,pf);
	input  [15:0]sum;
	input  [2:0]count;
	input  en,test,rst,carry_out;
	output pf;
	reg	 pf;
	always@(*) begin
		if((!test)||(!en)||rst)
			pf=0;
		else
		begin
			case (count)
				3'b000:pf=((sum=={8{2'b01}})&&(carry_out==1'b1));
				3'b001:pf=((sum=={16{1'b0}})&&(carry_out==1'b0));
				3'b010:pf=((sum=={16{1'b1}})&&(carry_out==1'b0));
				3'b011:pf=((sum=={16{1'b0}})&&(carry_out==1'b1));
				3'b100:pf=((sum=={16{1'b1}})&&(carry_out==1'b0));
				3'b101:pf=((sum=={16{1'b0}})&&(carry_out==1'b1));
				3'b110:pf=((sum=={16{1'b1}})&&(carry_out==1'b1));
				3'b111:pf=((sum=={8{2'b10}})&&(carry_out==1'b0));
			endcase
		end
	end
endmodule 


module adder16(a,b,carry_in,sum,carry_out);
	input  [15:0] a,b;
	input  carry_in;
	output [15:0]sum;
	output carry_out;
	wire   [15:0]sum;
	wire   carry_out;
	
	assign {carry_out,sum} = a+b+carry_in;
endmodule
