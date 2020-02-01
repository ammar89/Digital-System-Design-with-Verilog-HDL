# Introduction to Verilog and Xilinx Vivado

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
