/*
Disclaimer: I do not own this code, it was adopted from the reference book: 
Digital Design: An Embedded Systems Approach Using Verilog by Peter J. Ashenden.
*/

module mux2 (output y, input i0, i1, sel1);
  assign y = sel1 ? i1 : i0;
endmodule
