module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic c4, c8, c12;
	  logic PG0, PG4, PG8, PG12;
	  logic GG0, GG4, GG8, GG12;
	  
	  // inputs: cin, A[3:0], B[3:0] outputs: s[3:0], cout, p, g
	  fourbit_la fbla1 (.Cin(cin), .A(A[3:0]), .B(B[3:0]), .Sum(S[3:0]), .PG(PG0), .GG(GG0), .Cout());
	  assign c4 = GG0 | (cin & PG0); 
	  fourbit_la fbla2 (.Cin(c4), .A(A[7:4]), .B(B[7:4]), .Sum(S[7:4]), .PG(PG4), .GG(GG4), .Cout());
	  assign c8 = GG4 | (GG0 & PG4) |  (cin & PG0 & PG4);
	  fourbit_la fbla3 (.Cin(c8), .A(A[11:8]), .B(B[11:8]), .Sum(S[11:8]), .PG(PG8), .GG(GG8), .Cout());
	  assign c12 = GG8 | (GG4 & PG8) | (GG0 & PG8 & PG4) | (cin & PG4 & PG0);
	  fourbit_la fbla4 (.Cin(c12), .A(A[15:12]), .B(B[15:12]), .Sum(S[15:12]), .PG(PG12), .GG(GG12), .Cout(cout));
	  

endmodule
