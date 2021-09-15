module fourbit_s(
	input logic [3:0] A,
	input logic [3:0] B,
	input logic Cin,
	output logic [3:0] Sum,
	output logic Cout
);


	logic [3:0] S_high;
	logic [3:0] S_low;
	logic C_high, C_low;

	fourbit_rp CarryHigh(.A(A), .B(B), .Cin(1'b1), .S(S_high), .Cout(C_high));
	fourbit_rp CarryLow(.A(A), .B(B), .Cin(1'b0), .S(S_low), .Cout(C_low));
	
	two_to_one_mux outMux(S_high, S_low, Cin, Sum);
	assign Cout = (Cin & C_high) | C_low;
	
endmodule