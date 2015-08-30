#ujvmstap 
在systemtap中得到java的调用栈，可以在java程序和libc等、linux内核之间架起一座桥梁，对于java程序的调试调优具有重要的意义。使用systemtap分析的优点有：
1. 不依赖于java版本，任何版本都可以。
2. 被测程序不需要添加额外的启动参数，可以在任何时候接入调试。

ujvmstap是我开发的tapset，提供了得到java调用栈的函数。
icedtea项目也包含一个得到java调用栈的tapset，但是因为下列原因导致我重新开发了一个tapset：
1. 首先说最重要的原因，由于icedtea的tapset，只能处理当前pc（指令寄存器）在解释器、jit编译的代码中的情况，当pc在native代码中时，将得不到java调用栈，即架不起libc、内核到java之间的桥梁，基本上没有什么实用价值。
2. 对于在C2编译代码中调用stub的栈，无法得到调用栈，在得到程序热点时，就会有些不精确。
3. 不能打印java程序的行号。
4. 返回值等不能满足我调优的需求。

##原理
请参考我的技术博客文章[SYSTEMTAP中得到java调用栈](http://jangzq.info/2015/08/30/jstack/)

##systemtap patch
我已经将修改的systemtap代码提交了patch，在没有被合并进去之前，请自行打补丁，补丁地址：


##安装
将ujvmstack.stp拷贝到systemtap安装目录的share/systemtap/tapset目录下。




##Copyright and License
This software is licensed under the BSD license.

Copyright (C) 2015, by Zhang Zq (Jangzq)

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 



