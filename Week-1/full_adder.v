module full_adder (S, C_out, A, B, C_in); // This module represents a full adder.
  
  input A, B, C_in;
  output S, C_out;
    
    wire W1, W2, W3;
    
    xor xor1(W1, A, B);
    xor xor2(S, W1, C_in);
    
    and and1(W2, W1, C_in);
    and and2(W3, A, B);
    
    or or1(C_out, W2, W3);
    
endmodule
