module L7ID (Iout, RS1,RS2,RD,imm, Iin);
output [31:0] Iout;
output [4:0] RS1,RS2,RD;
output reg [19:0] imm;

input [31:0] Iin;


wire [6:0] opcode;

// opcode, funct7, and funct3, determine whitch instruction, and as such what controll lines
//opcode is allways bits 6 to 0
assign opcode = Iin [6:0];

assign Iout = Iin;
//all the fields that come from each instruction, not all will be valid

//registers
assign RS1 = Iin[19:15];
assign RS2 = Iin[24:20];
assign RD = Iin[11:7];


//determining controll lines only base integer instruction set
always @ (opcode) begin
	case (opcode)
		7'b0110011: imm = 12'd0; //r typ arithmatic instruction
		7'b0010011: imm = Iin[31:20]; //I type arithmatic instructions
		7'b0000011: imm = Iin[31:20]; //I type load instructions
		7'b0100011: imm = {Iin[31:25],Iin[11:7]}; //S type instructions
		7'b1100011: imm = {Iin[31],Iin[7],Iin[30:25],Iin[11:8],1'b0}; //B type branch instructions
		7'b1101111: imm = {Iin[31],Iin[19:12],Iin[20],Iin[30:21],1'b0}; //JAL, J-type instruction
		7'b1100111: imm = Iin[31:20]; // JALR, I type instruction
		7'b0110111: imm = Iin[31:12]; // LUI, I type instruction
		7'b0010111: imm = Iin[31:12]; // AUIPC, Itype instruction
		7'b1110111: imm = Iin[31:12]; // Environmental instruction, I type 
		default: imm = 20'hxxxxx;
		endcase
		
	end
endmodule
