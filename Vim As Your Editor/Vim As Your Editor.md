## Vim As Your Editor (1/6): The Basic Vim Movements

https://www.youtube.com/watch?v=H3o4l4GVLW0

本节内容：

w b h j k l y p d v V :w <esc>

退出insert模式也可以用ctrl-[ 或者ctrl-c

yw 复制当前单词

yj 复制当前行



## Vim As Your Editor (2/6): Foundation for Speed

o/O 在下一行/上一行进入插入模式

P 粘贴到光标前

a 在光标后进入插入模式

A 行尾插入

I 行首插入



/ 查找

n/N 正向/反向遍历查找结果



*向前搜索光标下的单词

#向后搜索光标下的单词



## Vim As Your Editor (3/6): Horizontal Speed

本章内容：行内操作

fx                  跳转到下一个为 x 的字符，2f/ 可以找到第二个斜杆
Fx                  跳转到上一个为 x 的字符
tx                  跳转到下一个为 x 的字符前
Tx                  跳转到上一个为 x 的字符前

;                   跳到下一个 f/t 搜索的结果
,                   跳到上一个 f/t 搜索的结果

s 删除当前光标所在字符并进入插入模式

dw  cw dt) 等等

vf) 选中光标处到)内容

bvt) 选中()中内容

**ct) 删除光标到)内容 不包括)**

**D  删除到行末（同 d$）**

**C   删除到行末并进入insert模式（同c$）**

**S    删除当前行，并进入插入模式，前可接数量**



## Vim As Your Editor (4/6): Vertical Domination

本章内容：垂直移动

number+j/k 向上/向下移动n行

{  } 移动到上一个/下一个空行

[  ] 移动到上一个/下一个函数

ctrl-u/d 上/下移一个段落

% 跳转到匹配的括号

d2i) 删除外两层括号中的内容  （层级删除）

```python
# 删除前 假设光标在最内部的小括号中
change_history = (round((close / float(row[header_dict['开始跟踪时价位']])), 4) - 1) * 100
# 删除后
change_history = (round((), 4) - 1) * 100
```

cip 删除段落并插入

va) 选择括号以及括号中内容



## Vim As Your Editor (5/6): Going Full Vim - File Movements, Buffers, Splits

默认访问文件方式：

:e 文件路径  访问文件

:Ex 打开文件列表

### 或者用fzf ：

**ctrl-p 调出界面**

**ctrl-^ 在最近访问的两个文件间跳转**

**ctrl-o/i 跳转到上一个/下一个所在位置**



### marks：

分为local marks和global marks

local marks在当前工作目录下起作用。

m+char(小写)：增加local标签  mh就是设置一个快捷键为h的标签

m+CHAR(大写)：增加global标签 mH

'char/CHAR：跳转到对应标签



### splits：

ctrl-w ctrl-o 只显示当前窗口

ctrl-w ctrl-s 水平分割

ctrl-w ctrl-v 垂直分割

ctrl-w ctrl-r 翻转上下两个窗口

ctrl-w H 水平分割转为垂直分割

:resize 10 高度设置为10

:vertical resize 10 宽度设置为10

ctrl-w = 恢复默认布局设置

**<leader>pv 调出文件列表并设置宽度为30（.vimrc中设置的快捷键）**



## Vim As Your Editor (6/6): Vim Long and Prosper

determination.

If you've just been at a place in life where you've lost that passion,I hope you can find it back.Because work may never make you happy,it may never solve all your problems,but there is satisfaction in trying tu be great at something and I hope that you can kind of take that in yourself.   ——ThePrimeagen



:h 帮助命令 例如:h g  :h mark

 