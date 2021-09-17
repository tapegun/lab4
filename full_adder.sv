module full_adder(
	input logic A, B, Cin,
	output logic S, C
);

	assign S = A^B^Cin;
	assign C = (A&B)|(A&Cin)|(B&Cin);

endmodule 