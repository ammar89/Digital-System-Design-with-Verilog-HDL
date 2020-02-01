# Introduction to Verilog and Xilinx Vivado

From Wikipedia, 
> Verilog, standardized as IEEE 1364, is a hardware description language (HDL) used to model electronic systems. It is most commonly used in the design and verification of digital circuits at the register-transfer level of abstraction.

Similar to programming languages, designing digital systems with Verilog is done by creating and editing text files. These text files contain a description of the **structure** or **behavior** of a digital system.

The file/s are then processed by software to verify and/or synthesize (*more on this later*) the design.

In Verilog a digital system is divided into entities called modules, the system can be composed of one or more modlues depending on complexity.

The sytax for a module is as shown,
```
module name_of_module ()

endmodule
```
