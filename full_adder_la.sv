module full_adder_la (
	input logic A, B, Cin,
	output logic S, C, P, G);

	assign S = A^B^Cin;
	assign C = (A&B)|(A&Cin)|(B&Cin);
	assign P = A ^ B;				// we will use P and G to determine the Cin of the next bit
	assign G = A & B;

endmodule