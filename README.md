# chisel-template
自建 chisel 工程模板

# 概述

本模板适用于编写 chisel 并使用 Verilator 进行仿真的电路设计。在 Makefile 中指定了 Chisel 转 Verilog，编译仿真文件，执行仿真文件，编译并执行仿真文件等目标，使用 mill 工具进行 Chisel 工程的构建。可以方便的实现 Chisel 工程的练习。

本模板编写了一个使用 `MuxLookup` 实现的 38 译码器。

# 运行工程

## 获取代码

```bash
git clone https://github.com/light-ly/chisel-template
```

## 运行工程

### 编译仿真目标并运行：

```bash
# 编译并运行
make srun
```

或者：

```bash
## 只编译不运行
make sim
## 运行编译好的仿真文件
make run
```

### 带仿真波形文件（vcd）的仿真

```bash
make vcd=1 srun
```

或

```bash
make vcd=1 sim
make run
```

查看仿真文件

```bash
gtkwave logs/top.vcd
```

### Chisel 转 Verilog

```bash
make verilog
```

生成的 Verilog 文件和编译出的可执行仿真文件都会在 build 目录中，mill 的输出会生成在 out 文件夹中，verilator 编译的中间结果在 build/OBJ_DIR 中，仿真波形会输出在 logs 文件夹中。

## 清理仿真文件

```bash
# 删除 build，out，logs 目录
make clean_all

# 删除 build，logs，保留 out。即删除 verilator 输出的仿真文件和 verilog 文件，保留 mill 构建的输出
make clean

# 删除 mill 构建的输出 out
make clean_mill
```

# 编写自己的工程

请移步到：
- [我的博客，Chisel 工程框架搭建（mill + verilator）](https://light-liuyi.top:2001/2023/06/29/chisel-template)
- [我的知乎，Chisel 工程框架搭建（mill + verilator）](https://zhuanlan.zhihu.com/p/642588946)
