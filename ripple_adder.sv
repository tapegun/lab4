module ripple_adder
(
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a ripple adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
	  logic c0, c1, c2;
	  
	  //(4bit_rp) inputs: A[3:0] B[3:0] cin outputs: S C
	  fourbit_rp rp1 (.A(A[3:0]), .B(B[3:0]), .cin(cin), .S(S[3:0]), .C(C0);
	  fourbit_rp rp2 (.A(A[7:4]), .B(B[7:4]), .cin(c0), .S(S[7:4]), .C(C1);
	  fourbit_rp rp3 (.A(A[11:8]), .B(B[11:8]), .cin(c1), .S(S[7:4]), .C(C2);
	  fourbit_rp rp4 (.A(A[15:12]), .B(B[15:12]), .cin(c2), .S(S[3:0]), .C(cout);
     
endmodule
