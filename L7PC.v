module L7PC (Pcout, jmpa, jmpen, clk);
	output reg [6:0] Pcout;
	input [6:0] jmpa;
	input jmpen,clk;


	always @ (posedge clk) begin
		if (jmpen == 1'b1) begin
			Pcout = jmpa;
		end
		if (jmpen ==1'b0) begin
			Pcout = (Pcout + 32'd4);
		end
	end

endmodule
