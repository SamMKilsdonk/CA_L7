module L7_PC_ID(Iout, Rs1,Rs2,RD,IMM,PCout,clk,jmpa,jmpen);

input clk;

output [31:0] Iout;
output [4:0] Rs1,Rs2,RD;
output [19:0] IMM;
output [6:0]PCout;

wire [31:0] Iin;

input[6:0] jmpa;
input jmpen;


L7PC PC (PCout, jmpa, jmpen, clk);

//rom from lab 6 output is instructions, address is program counter
Lab_6 ROM (Iin, PCout, 1'b1);


L7ID ID (Iout, Rs1,Rs2,RD,IMM, Iin);


endmodule
