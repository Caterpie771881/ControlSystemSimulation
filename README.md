# 控制系统仿真资料整理

特指 "深圳大学机电与控制工程学院" 开设的课程 "控制系统仿真"

下面是我从课件以及实验报告中整理出的函数

函数的正确性是对照课堂练习及其参考答案检验的

## 已封装的函数列表

打勾✔表示经过了课堂练习的测试

数学模型
- [ ] feedbacksym

连续系统仿真
- [x] RungeKuttaByss
- [x] RungeKuttaBypw
- [x] pw2ab
- [x] AugmentedMatrix
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

辅助分析
- [ ] JudgeByEigenvalue
- [ ] JudgeByUcVo

辅助设计
- [ ] SeriesLead
- [ ] SeriesLag
- [ ] SeriesLagLead

## 使用方法

下载项目
```
git clone https://github.com/Caterpie771881/ControlSystemSimulation.git
```

将要用的函数文件拷贝到 Matlab 的工作文件夹, 然后直接调用即可

对于标注了 "依赖项" 的函数, 记得将依赖的函数文件一并拷贝到 Matlab 工作文件夹

或者使用 Matlab 的 "添加到路径" 功能, 将项目中的 "函数封装" 文件夹及其子文件夹添加到工作空间

## 免责声明

该项目仅用作学习, 以及帮助没时间整理代码的同学快速封装好各种仿真方法

本人不鼓励任何作弊行为, 请使用者自行判断使用场合是否合适

如果老师反对使用该项目, 请不要冒险, 如有使用者被判定为 "作弊", 作者不负任何责任

不保证项目中封装的函数和整理的知识点是绝对正确的, 请使用者自行判定
