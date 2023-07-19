package top

import chisel3._
import chisel3.util._
import chisel3.stage._

import fsm._

class top extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(1.W))
    val out = Output(UInt(1.W))
  })
  
  val fsm = Module(new FSM)

  fsm.io.in := io.in
  io.out := fsm.io.out

}

object topMain extends App {
  (new ChiselStage).emitVerilog(new top, args)
}
