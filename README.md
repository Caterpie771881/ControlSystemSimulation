# 控制系统仿真资料整理

特指 "深圳大学机电与控制工程学院" 开设的课程 "控制系统仿真"

下面是我从课件以及实验报告中整理出的函数

函数的正确性是对照课堂练习及其参考答案检验的

## 已封装的函数列表

数学模型
- [ ] feedbacksym

连续系统仿真
- [x] RungeKuttaByss
- [x] RungeKuttaBypw
- [x] pw2ab
- [x] AugmentedMatri
- [x] Euler
- [x] Trapezoid

离散化
- [ ] sign1
- [x] saturation
- [x] deadzone
- [ ] backlash
- [x] DiscretizationSimulation

采样控制
- [x] puredelay
- [x] SamplingControlSimulation

## 使用方法

由于这门课是开卷上机考试, 所以我建议将该项目下载到本地, 然后打成压缩包拷贝到考场电脑

或者直接使用自己的电脑考试 (我们这届是允许的, 如果不允许就算了)

下载项目
```
git clone https://github.com/Caterpie771881/ControlSystemSimulation.git
```

上机考试过程中, 将要用的函数文件拷贝到 Matlab 的工作文件夹, 然后直接调用即可

对于标注了 "依赖项" 的函数, 记得将依赖的函数文件一并拷贝到 Matlab 工作文件夹

## 免责声明

该项目仅用作学习, 以及帮助没时间整理代码的同学快速封装好各种仿真方法

不清楚后续该门课程的考试形式是否会发生改变, 如有使用者被判定为 "作弊", 作者不负任何责任

不保证项目中封装的函数和整理的知识点是绝对正确的, 请使用者自行判定
