module Data_Memory(clk,rst,WE,WD,A,RD);

    input clk,rst,WE;
    input [31:0]A,WD;
    output [31:0]RD;

    reg [31:0] mem [0:1023];

always @ (posedge clk) begin
    if (WE)
        mem[A[11:2]] <= WD;
end

assign RD = (~rst) ? 32'd0 : mem[A[11:2]];


    initial begin
        // Kh?i t?o giá tr? c? th? cho b? nh?
        //mem[10] = 32'h12345678;  // Ph?c v? l?nh LW x11, 0(x13)
        //mem[18] = 32'h00000000;  // N?i l?u giá tr? c?a l?nh SW x13, 8(x13)
 
        mem[2] = 32'h12345678;  // Địa chỉ byte 10 ánh xạ thành mem[2]
        mem[4] = 32'h00000000;  // Địa chỉ byte 18 ánh xạ thành mem[4]
end

endmodule
