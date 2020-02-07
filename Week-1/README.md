# Introduction to Verilog and Xilinx Vivado

## Introduction to Verilog

From Wikipedia, 
> Verilog, standardized as IEEE 1364, is a hardware description language (HDL) used to model electronic systems. It is most commonly used in the design and verification of digital circuits at the register-transfer level of abstraction.

Similar to programming languages, designing digital systems with Verilog is done by creating and editing text files. These text files contain a description of the **structure** or **behavior** of a digital system.

The file/s are then processed by software to verify and/or synthesize (*more on this later*) the design.

In Verilog a digital system is divided into entities called modules, the system can be composed of one or more modules depending on complexity.

The module starts with a the keyword `module` and ends with the keyword `endmodule`, each module must have a name right next to the `module` keyword, as seen in the code block bellow: 

```verilog
module name_of_module ();

endmodule
```
Each module must interact with its surrondings with ports, it is ncessary to enter the ports between the brackets `()` next to the `module` keyword, for example let us make a module that has the name `full_adder`, has inputs `A`, `B` and `C_in` and has outputs `S` and `C_out`.

```verilog
module full_adder (S, C_out, A, B, C_in);
  
  input A, B, C_in;
  output S, C_out;

endmodule
```

*You must have noticed by now that every line in Verilog ends with a semi-colon `;` similar to programming languages like C and C++, so don't forget that.*

Inputs are indicated with the `input` keyword and outputs with the `output` keyword.

So far, we created a module that does not do any thing, it just has a name, input ports and output ports, but from its name you can tell that we want to build a [full adder](https://www.geeksforgeeks.org/full-adder-in-digital-logic/) which is a simple combinational circuit.

Let us write that down on the module as a comment,

```verilog
  /*
  Desinger's name: Ammar Kurd
  Date: 01/02/2020
  */
module full_adder (S, C_out, A, B, C_in); // This module represents a full adder.
  input A, B, C_in;
  output S, C_out;

endmodule
```
Now you know how to add comments to a verilog code, a single-line comments are added by using `//`  and multi-line comments are added between `/*` and `*/`.

It is useful to visualize the module as a black box as seen in the figure below:

![full adder](/images/full_adder_2.png) 

To describe the internals of the black box we will be using what is called *primitive modules* these primitives are basic logic gates that can be **instantiated** directly into the design, but, 
what is instantiation you ask? Well... instantiation is similar to the concept of calling a function in a programming language when you instantiate a module inside your design you are copying it into the design, for example, say you would like to instantiate `full_adder` into another module let us say `four_bit_adder` you can do that in this manner: 

```verilog 
module four_bit_adder( 
output [3:0] S, 
output C_out, 
input [3:0] A, 
input [3:0] B, 
input C_in ); 

wire carry0, carry1, carry2; 

full_adder fa0(S[0], carry0, A[0], B[0], C_in); 
full_adder fa1(S[1], carry1, A[1], B[1], carry0); 
full_adder fa2(S[2], carry2, A[2], B[2], carry1); 
full_adder fa3(S[3], C_out, A[3], B[3], carry2); 

endmodule 
``` 
The previous module contains new structures, but don't worry we will discuss them in due time, now I just want you to pay attention to this line `full_adder fa0(S[0], carry0, A[0], B[0], C_in);` in here we made an instance of the module `full_adder` named `fa0` where we connected its inputs and outputs with inputs, outputs and wires of `full_adder`.

Now, let us get back to `full_adder`, the logic of the full adder should be known to you from the **Logic Design** course, if you want a refresh your memory on full adders then read [this](https://www.geeksforgeeks.org/full-adder-in-digital-logic/), below is a diagram depecting the full adder logic.

![Full adder logic](/images/full_adder.bmp)

The verilog code for this logic is as follows,

```verilog

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
```

By observing the code you can notice a one-one equivalence between the code and diagram.

The `wire` keyword is what is known as a *net type* in verilog, it is used to model physical wires, the inputs and outputs are wires by deafult.

## Introduction to Vivado

Now that you have a basic idea about Verilog let us take a quick tour in Xilinx Vivado the tool that you will be using to verify and simulate your logic designs.

**Run Vivado** by clicking on its icon on the desktop

![Vivado icon](/images/vivado_icon.jpg)

