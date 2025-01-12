其实没多少要写的,我这里就不放源代码了
就是把`demo_x.c`里面的`XC_umbrella`换成别的icon,至于要换成哪一个都可以
如果不知道有哪些可以换的,可以这样子:
1. 用VSCode连接上wsl/linux(用ssh)
2. 找到`XC_umbrella`,左手按住`ctrl`,右手鼠标点一下`XC_umbrella`
3. 就会进入到这个icon的定义文件,在这里你会看到更多其他icon的定义
   ```C
   #define XC_top_tee 140
   #define XC_trek 142
   #define XC_ul_angle 144
   #define XC_umbrella 146
   #define XC_ur_angle 148
   #define XC_watch 150
   #define XC_xterm 152
   ```
以上仅是一小部分,同时我们也得知了定义icon图标的文件是在`/usr/include/X11/cursorfont.h`,如果没有VSCode/懒得弄ssh的同学可以通过直接打开这个文件来查看icon定义(其实这个头文件都在.c文件里include了)

然后还需要注意的一点是ssh默认不会转发X window的流量,因此在运行ssh时要加上-X的选项,启动X window的转发,否则会出现打不开window的情况