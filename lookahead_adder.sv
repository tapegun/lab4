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
	  logic [3:0] s0, s1, s2, s3;
	  logic c4, c8, c12;
	  logic PG0, PG4, PG8, PG12;
	  logic GG0, GG4, GG8, GG12;
	  
	  // inputs: cin, A[3:0], B[3:0] outputs: s[3:0], cout, p, g
	  fourbit_la fbla1 (.cin(cin), .A(A[3:0]), .B(B[3:0]), .S(s0), .P(PG0), .G(GG0), .cout());
	  c4 = GG0 | (cin & PG0); 
	  fourbit_la fbla2 (.cin(c4), .A(A[7:4]), .B(B[7:4]), .S(s1), .P(PG4), .G(GG4), .cout());
	  c8 = GG4 | (GG0 & PG4) |  (cin & PG0 & PG4);
	  fourbit_la fbla3 (.cin(c8), .A(A[11:8]), .B(B[11:8]), .S(s2), .P(PG8), .G(GG8), .cout());
	  c12 = GG8 | (GG4 & PG8) | (GG0 & PG8 & PG4) | (cin & PG4 & PG0);
	  fourbit_la fbla4 (.cin(c12), .A(A[15:12]), .B(B[15:12]), .S(s3), .p(PG12), .G(GG12), .cout(cout));
	  
	  S = {s3, s2, s1, s0}

endmodule
