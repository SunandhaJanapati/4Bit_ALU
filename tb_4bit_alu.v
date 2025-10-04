`timescale 1ns/1ps
module tb_4bit_alu;

reg [3:0] A, B;
reg [2:0] ALU_Sel;
wire [4:0] ALU_Out;

alu4 uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out)
);

initial begin
    // Apply test cases
    A = 4'b0101; B = 4'b0011; ALU_Sel = 3'b000; #10; // 5+3
    ALU_Sel = 3'b001; #10; // 5-3
    ALU_Sel = 3'b010; #10; // 5 & 3
    ALU_Sel = 3'b011; #10; // 5 | 3
    ALU_Sel = 3'b100; #10; // 5 ^ 3
    ALU_Sel = 3'b101; #10; // ~5
    ALU_Sel = 3'b110; #10; // 5 << 1
    ALU_Sel = 3'b111; #10; // 5 >> 1

    $stop; // stop simulation
end

endmodule
