module Instruction_Memory(rst,A,RD);

  input rst;
  input [31:0]A;
  output [31:0]RD;

  reg [31:0] mem [1023:0];
  
  assign RD = (~rst) ? {32{1'b0}} : mem[A[31:2]];

//   initial begin
//     $readmemh("memfile.hex",mem);
//   end

initial begin
    mem[0] = 32'h00330313;   // ADDI  x6, x6, 3
    mem[1] = 32'h00430893;   // ADDI  x17, x6, 4
    mem[2] = 32'h011306B3;   // ADD   x13, x6, x17
    mem[3] = 32'h0113A733;   // SLT   x14, x7, x17
    mem[4] = 32'h011347B3;   // XOR   x15, x6, x17
    mem[5] = 32'h00D3C633;   // OR    x12, x7, x13
    mem[6] = 32'h00C3E5B3;   // AND   x11, x7, x12
    mem[7] = 32'h00D6A423;   // SW    x13, 8(x13)
    mem[8] = 32'h0006A583;   // LW    x11, 0(x13)
end


  endmodule