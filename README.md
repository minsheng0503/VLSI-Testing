# VLSI Testing 
NCU EE Course lectured by PhD. Jin-Fu Li (2022 Fall)

## [VLSI_Testing HW 1](https://github.com/minsheng0503/VLSI-Testing/tree/main/HW1)
### Description
- BIST Circuit    
    Design **B**uilt-**I**n **S**elf-**T**est(**BIST**) circuit for an 16-bit ripple carray adder if the single cell fault is targeted. As the figure shown below, the additional test pins are in blue. Test is used to switch the circuit between normal mode and test mode. `En` is used to assert the embedded pattern generator and `P/F` is used to indicate the ripple carry adder is fault-free or faulty.     

![BIST](<https://github.com/minsheng0503/VLSI-Testing/blob/main/HW1/BIST.png> "BIST")   
    
## [VLSI_Testing HW 2](https://github.com/minsheng0503/VLSI-Testing/tree/main/HW2)
### Description
- Fault Simulation
    Implement a serial fault simulator for the circuit shown below. Then, use the fault simulator to evaluate the fault coverage of single stuck-at faults of the test patterns {10101, 10010, 00010, 10100}.

![Fault_Sim](<https://github.com/minsheng0503/VLSI-Testing/blob/main/HW2/fault_sim.png> "Fault_Sim")

## [VLSI_Testing HW 3](https://github.com/minsheng0503/VLSI-Testing/tree/main/HW3)
### Description
- Signature Analysis
    Suppose that a modular LFSR with a characteristic polynomial 1+X+X<sup>4</sup> is used as a signature analyzer for the circuit under test shown below. Please complete the following questions.
    1. Use Verilog code to realize the LFSR and simulate the signature of the good circuit.  
    2. Let line `a` have an SA0. Simulate the signature if the test sequence is 1,2,3,...,15.   

![Signature](<https://github.com/minsheng0503/VLSI-Testing/blob/main/HW3/signature.png> "Signature")
