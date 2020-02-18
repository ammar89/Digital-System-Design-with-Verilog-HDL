# Students Q&A

Below is a list of questions asked by students during lectures or LAB sessions, some of the questions are imaginary others are actual questions asked by the students.

**Q - 1** What is the expected outcome of this course?

**A - 1** At the end of this course you should be able to:
  1. Understand what are digital systems and how are they designed.
  2. Understand the different implementation options for digital systems.
  3. Be able to use a hardware description language (Verilog) to design simple to moderate digital systems.
  4. Be able to verify digital systems functionality by writing test-benches.
  5. Understand timing constraints for digital systems.
  6. Understand finite state machines.
  7. Understand what is meant by datapaths and control units.
  8. Understand IO and IO-controllers.
  

**Q - 2** How can I succeed in the course?

**A - 2** Here is some advice that can help you succeed in this course:
  1. Don't miss the class and LAB sessions.
  2. Ask questions when you don't understand something, you can send your questions to https://groups.google.com/forum/#!forum/dsd-with-verilog-hdl
  3. Do the reading and solve the homework assignments.
  4. Practice writing Verilog codes regularly.
  
**Q - 3** Can I use the knowledge I gain in this course to build a product such as a mobile phone or a TV set?

**A - 3** No, these are finished products that require knowledge beyond the scope of this course, these products are usually built by teams of engineers and designers with a diverse backgrounds and expertise.
What you can build using the knowledge gained from this course are prototypes and digital subsystems that might be part of a final product,
to get an idea of what you can build using Verilog visit: https://opencores.org/projects.

**Q - 4** Is writing Verilog codes the same as programming an Arduino or a microcontroller?

**A - 4** No, these are two different things, Verilog is not a sequential [programming language](https://en.wikipedia.org/wiki/Programming_language),
but it is a [Hardware Description Language](https://en.wikipedia.org/wiki/Hardware_description_language). Microcontrollers or 
boards based on microcontrollers such as Arduino are processors that perform instructions loaded to their memory. Verilog is used to
build hardware either in an [ASIC](https://en.wikipedia.org/wiki/Application-specific_integrated_circuit) or [FPGA](https://en.wikipedia.org/wiki/Field-programmable_gate_array) technology.
To know more about the differnces check [here](https://www.ourpcb.com/fpga-vs-microcontroller.html) and [here](https://stackoverflow.com/questions/5121679/why-is-verilog-not-considered-a-programming-language).

**Q - 5** In example 1.2 in the reference book (*Digital Design by Peter J. Ashenden*) won't the value of S be the same as S1 and S2 because the clock will enable both ff1 and ff2 at the same time?

**A - 5** You are confusing the operation of the flip-flop with that of the latch, the flip-flop acts only on the rising edge of the clock, not the value of the clock, which leaves a small window to capture the changes at the input to the output, combine this with propagation delay of the flip-flop this leads to the operation of the circuit as it is demonstrated in the example.

**Q - 6** After the simulation is done on Vivado, how can I know that the result matches the desired function?

**A - 6** Well, we start with the relation between the input and output, so the result should match the outcome you are expecting, but, in larger designs is can be problematic since there will be a large number of inputs and outputs to check, however, there are verification methodologies that can be used to verify the circuit functionality such as [Universal Verification Methodology UVM](https://en.wikipedia.org/wiki/Universal_Verification_Methodology) and [Open Verification Methodology OVM](https://en.wikipedia.org/wiki/Open_Verification_Methodology), but they are beyond the scope of this course.

**Q - 7** How can I transform a problem written in English (*or any other language*) into logical statements and then into a Verilog code?

**A - 7** This skill should have been established in the previous course *Logic Design*, but in case you are still not equipped with this skill, then you must know that the logic that we use in this course is based on a number of basic logical operations (*i.e gates*) which are:
- NOT gate.
- AND gate.
- OR gate.
- XOR gate.

Now if you are not familiar with those operations or gate and their behavior, then it is time to review them, to map a statement into those logical operations you have to search for certain the conjunctions in that statement and what they imply, for example:

- Either sensor S_1 or S_2 can turn the alarm on, *here **either** and **or** implies a logical **OR gate**.
- If sensor A is on and either sensor B or C is on the alarm will go on, *here **if**, **and**, **either** and **or** implies an **OR gate** between C and B and an **AND gate** between A and **B or C**.

This topic goes deeper mathematically, but you only need to get the big picture, so any revision on logic design such as [Computer Logic on Wikiversity](https://en.wikiversity.org/wiki/Computer_Logic) should be sufficient.
