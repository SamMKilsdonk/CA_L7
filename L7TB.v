module L7TB ();

reg clk,jmpen;
reg [6:0] jmpa;
wire [31:0] Iout;
wire [4:0] Rs1,Rs2,RD;
wire [19:0] IMM;
wire [6:0] PCout;


L7_PC_ID MUT (Iout, Rs1,Rs2,RD,IMM,PCout,clk,jmpa,jmpen);

initial begin
clk = 1'b0;
jmpen = 1'b1;
jmpa = 7'd0;
end

always begin
#5
clk = !clk;
end

initial begin
#10
jmpen = 1'b0; //wait one clock before clearing jmp en to reset PC.
#200
$stop;
end


endmodule
