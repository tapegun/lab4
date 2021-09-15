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

	full_adder_la la1 (.A(A[0]), .B(B[0]), .Cin(C[0]), .S(Sum[0]), .C(), P(.P[0]), G(.G[0]));
	full_adder_la la2 (.A(A[1]), .B(B[1]), .Cin(C[1]), .S(Sum[1]), .C(), P(.P[1]), G(.G[1]));
	full_adder_la la3 (.A(A[2]), .B(B[2]), .Cin(C[2]), .S(Sum[2]), .C(), P(.P[2]), G(.G[2]));
	full_adder_la la4 (.A(A[3]), .B(B[3]), .Cin(C[3]), .S(Sum[3]), .C(), P(.P[3]), G(.G[3]));
	
	assign Cout = (Cin & P[0] & P[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (G[1] & P[2] & P[3]) | (G[2] & P[3]) | G[3];
	
	assign PP = P[0] & P[1] & P[2] & P[3]
	assign PG = (G[3] | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]))




endmodule