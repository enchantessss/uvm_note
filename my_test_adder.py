# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0
# Simple tests for an adder module
import random
from ctypes import *

so_file = "../../my_functions.so"

from adder_model import adder_model

import cocotb
from cocotb.triggers import Timer
from cocotb.triggers import FallingEdge
from cocotb.triggers import RisingEdge

my_functions = CDLL(so_file)

async def reset_dut(dut):
    dut.rst_n.value = 0
    dut.A.value = 0
    dut.B.value = 0
    await Timer(10, units="ns")
    dut.rst_n.value = 1
    await Timer(10, units="ns")
    #reset_n.log.debug("Reset complete")

async def generate_clock(dut):
    """Generate clock pulses."""

    for cycle in range(4000):
        dut.clk.value = 0
        await Timer(1, units="ns")
        dut.clk.value = 1
        await Timer(1, units="ns")



@cocotb.test()
async def adder_basic_test(dut):

    await cocotb.start(generate_clock(dut))
    await cocotb.start(reset_dut(dut))
    #await Timer(100, units="ns")
    #await FallingEdge(dut.clk)
    #await RisingEdge(dut.clk)
    await RisingEdge(dut.rst_n)
    #await RisingEdge(dut.clk)



    """Test for 5 + 10"""
    A = 10
    B = 10
    my_functions.square(16)

    dut.A.value = A
    dut.B.value = B

    await Timer(2, units="ns")

    assert dut.X.value == adder_model(
        A, B
    ), "Adder result is incorrect: {dut.X.value} != addr_model(A, B)"

    await Timer(2000, units="ns")


@cocotb.test()
async def adder_randomised_test(dut):
    """Test for adding 2 random numbers multiple times"""
    await cocotb.start(generate_clock(dut))
    await cocotb.start(reset_dut(dut))
    await RisingEdge(dut.rst_n)

    for i in range(1000):

        A = random.randint(0, 15)
        B = random.randint(0, 15)

        await RisingEdge(dut.clk)
        dut.A.value = A
        dut.B.value = B

        await Timer(2, units="ns")

        assert dut.X.value == adder_model(
            A, B
        ), "Randomised test failed with: {A} + {B} = {X}".format(
            A=dut.A.value, B=dut.B.value, X=dut.X.value
        )


