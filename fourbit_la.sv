module fourbit_la(
	input logic [3:0] A,
	input logic [3:0] B,
	input logic Cin,
	output logic [3:0] Sum,
	output logic Cout, PG, GG
);

	logic [3:0] C; // store our Cin for each bit
	logic [3:0] G; // holds output of G for each FA
	logic [3:0] P; // holds output of P for each FA

	assign C[0] = Cin;
	assign C[1] = (Cin&P[0])|G[0];
	assign C[2] = (Cin&P[0]&P[1])|(G[0]& P[1])|G[1];
	assign C[3] = (Cin&P[0]&P[1]&P[2])|(G[0]&P[1]&P[2])|(G[1]&P[2])|G[2];

	full_adder_la rp1 (.A(A[0]), .B(B[0]), .cin(C[0]), .S(S[0]), .C(), .P[0], .G[0]);
	full_adder_la rp1 (.A(A[1]), .B(B[1]), .cin(C[1]), .S(S[1]), .C(), .P[1], .G[1]);
	full_adder_la rp1 (.A(A[2]), .B(B[2]), .cin(C[2]), .S(S[2]), .C(), .P[2], .G[2]);
	full_adder_la rp1 (.A(A[3]), .B(B[3]), .cin(C[3]), .S(S[3]), .C(), .P[3], .G[3]);
	
	assign Cout = (Cin & P[0] & P[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[2] & P[3]) | G[3];
	
	assign PP = P[0] & P[1] & P[2] & P[3]
	assign PG = (G[3] | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]))




endmodule