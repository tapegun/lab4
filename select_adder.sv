module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] Sum,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	logic [2:0] C;
	fourbit_s SA0(.A(A[3:0]), .B(B[3:0]), .Cin(1'b0), .Cout(C[0]), .S(Sum[3:0]));
	fourbit_s SA1(.A(A[7:4]), .B(B[7:4]), .Cin(C[0]), .Cout(C[1]), .S(Sum[7:4]));
	fourbit_s SA2(.A(A[11:8]), .B(B[11:8]), .Cin(C[1]), .Cout(C[2]), .S(Sum[11:8]));
	fourbit_s SA3(.A(A[15:12]), .B(B[15:12]), .Cin(C[2]), .Cout(CO), .S(Sum[15:12]));

endmodule
