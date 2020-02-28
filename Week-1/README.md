# Introduction to Verilog and Xilinx Vivado

## Introduction to Verilog

From Wikipedia, 
> Verilog, standardized as IEEE 1364, is a hardware description language (HDL) used to model electronic systems. It is most commonly used in the design and verification of digital circuits at the register-transfer level of abstraction.

Similar to programming languages, designing digital systems with Verilog is done by creating and editing text files. These text files contain a description of the **structure** or **behavior** of a digital system.

The file/s are then processed by software to verify and/or synthesize (*more on this later*) the design.

In Verilog a digital system is divided into entities called **modules**, the system can be composed of one or more modules depending on complexity.

The module starts with the keyword `module` and ends with the keyword `endmodule`, each module must have a name right next to the `module` keyword, as seen in the code block below: 

```verilog
module name_of_module ();

endmodule
```
Each module must interact with its surroundings with **ports**, so it is necessary to enter the ports between the brackets `()` next to the `module` keyword, for example, let us make a module that has the name `full_adder`, has inputs `A`, `B` and `C_in` and has outputs `S` and `C_out`.

```verilog
module full_adder (S, C_out, A, B, C_in);
  
  input A, B, C_in;
  output S, C_out;

endmodule
```

*You must have noticed by now that every line in Verilog ends with a semi-colon `;` similar to programming languages like C and C++, so don't forget that.*

Inputs are indicated with the `input` keyword and outputs with the `output` keyword.

So far, we created a module that does not do anything, it has a name, and input and output ports, but from its name, you can tell that we want to build a [full adder](https://www.geeksforgeeks.org/full-adder-in-digital-logic/) which is a simple combinational circuit.

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
Now you know how to add comments to a Verilog code, single-line comments are added by using `//`  and multi-line comments are added between `/*` and `*/`.

It is useful to visualize the module as a black box as seen in the figure below:

![full adder](/images/full_adder_2.png) 

To describe the internals of the black box we will be using what is called *primitive gates* these primitives are basic logic gates that can be **instantiated** directly into the design, but, 
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
The previous module contains new structures, but don't worry we will discuss them in due time, now I just want you to pay attention to this line `full_adder fa0(S[0], carry0, A[0], B[0], C_in);` in here we made an instance of the module `full_adder` named `fa0` where we connected its inputs and outputs with inputs, outputs, and wires of `full_adder`.

Now, let us get back to `full_adder`, the logic of the full adder should be known to you from the **Logic Design** course, if you want a refresh your memory on full adders then read [this](https://www.geeksforgeeks.org/full-adder-in-digital-logic/), below is a diagram depicting the full adder logic.

![Full adder logic](/images/full_adder.bmp)

The Verilog code for this logic is as follows,

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

By observing the code you can notice a one-to-one equivalence between the code and diagram.

The `wire` keyword is what is known as a *net type* in Verilog and it is used to model physical wires, note that inputs and outputs are wires by default.

## Introduction to Vivado

Now that you have a basic idea about Verilog let us take a quick tour in Xilinx Vivado the tool that you will be using to verify and simulate your logic designs.

**Run Vivado** by clicking on its icon on the desktop.

![Vivado icon](/images/vivado_icon.jpg)

**Create a new project** as you can see in the figure below, the main window of Vivado contains an option for creating a new project.

![Vivado's main window](/images/Vivado_main.JPG)

This will open up a wizard to help you create a new project, the first step is to enter the project **name** and **location**, as you can see on the figure below.

![New project wizard](/images/project_wizard_1.JPG)

**Select RTL project**, RTL stands for register transfer level which is as defined in Wikipedia
>is a design abstraction which models a synchronous digital circuit in terms of the flow of digital signals (data) between hardware registers, and the logical operations performed on those signals.

![RTL project](/images/project_wizard_2.JPG)

The next step is to **create design sources**, in our example, we have a single module, so create `full_adder` and make sure Verilog is selected as the design language.

![Create sources](/images/project_wizard_3.JPG)

You can skip the **Add Constraints** step for now because we are only interested in simulating and verifying the functionality of our systems, and this step is related to the implementation of the system in the FPGA.

In our lab, we will be using  **XC7a35tcpg236-1** as the main device but you are free to choose another device as well.

At the end of this process you will end up with a project that contains three folders as they appear in the **sources** window, the folders are **Design Sources**, **Constraints**, and **Simulation Sources** let us just ignore the **Constraints** folder for now and concentrate on the **Design Sources** folder and **Simulation Sources** folder.

In the **Design Sources**, you will find the Verilog module we created earlier as seen in the figure below.

![Desgin Sources](/images/Vivado_project1.JPG)

You can now edit the design source by editing the text file, enter the Verilog module of the full adder as seen in the figure below.

![Full adder design source in Vivado](/images/Vivado_project2.JPG)

To simulate the design you need to add another Verilog source in the **Simulation Sources** which is usually called a test-bench, to do so, right-click on the **Sources** area and select **Add Sources...** 

![Add sources](/images/Vivado_project3.JPG)

Create a new file and name it test_bench.

![Test-bench creation](/images/Vivado_project5.JPG)

The test-bench will not have any inputs or outputs so go ahead and click okay.

![The test-bench inputs and outputs](/images/project_wizard_6.JPG)

The test-bench code is as shown below, it is okay if you don't understand it now, just know that this code will test your design by driving its inputs and monitoring its outputs, then reports the results to you in the form of a timing diagram.

We will discuss the test-bench in more detail in lab2, for now, copy and paste the code below to the test_bench file you created.
```verilog
`timescale 1ns / 1ps
module test_bench(

    );
    reg A, B, C_in;
    wire S, C_out;
    
    full_adder fa1(S, C_out, A, B, C_in);
    
    initial
        begin
            A = 1'b0;
            B = 1'b0;
            C_in = 1'b0;
            #10 A = 1'b1;
            #10 B = 1'b1;
                A = 1'b0;
            #10 C_in = 1'b1;
                B = 1'b0;
            #10 B = 1'b1;
            #10 A= 1'b1;
            #10 $finish;
        end

endmodule
```
Just notice one thing now, the test-bench implements a certain simulation scenario between the **begin** and **end** keywords, try to follow this scenario, the **#10** means the passage of 10 units of time.

To verify the functionality of the full adder run the simulation.

![Run simulation](/images/Vivado_project7.JPG)

Finally, you will get the timing diagram that describes the relationship between the inputs and outputs of your module, as seen in the figure below.

![Timing diagram](/images/Vivado_project8.JPG)
