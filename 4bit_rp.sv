module fourbit_rp 
	(input [3:0] A,B,
	 input cin,
	 output logic [3:0] S,
	 output logic cout);
	 
	 logic c0, c1, c2;
	 
	 //(full_adder) inputs: .A, .B, .cin outputs: .S, .C
	 full_adder f1 (.A(A[0]), .B(B[0], .Cin(cin), .S(S[0]), .C(c0));
	 full_adder f2 (.A(A[1]), .B(B[1], .Cin(co), .S(S[1]), .C(c1));
	 full_adder f3 (.A(A[2]), .B(B[2], .Cin(c1), .S(S[2]), .C(c2));
	 full_adder f4 (.A(A[3]), .B(B[3], .Cin(c2), .S(S[3]), .C(c3));
	 
endmodule 