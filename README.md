## Hardware Monitor - shell scripts - XFCE4

_"Plugins" to monitor the hardware in your system._ 

![widget_toolbar.png](readme_previews/widgets_panel.png?raw=true "Title")

There are 4 widgets in total and each has a panel that appears after hovering:

- CPU
- GPU
- Memory
- Fans

#### 1. Widgets

_On hover:_

![widget_toolbar.png](readme_previews/cpu_hover.png?raw=true "Title")
![widget_toolbar.png](readme_previews/gpu_hover.png?raw=true "Title")
![widget_toolbar.png](readme_previews/ram_hover.png?raw=true "Title")
![widget_toolbar.png](readme_previews/fans_hover.png?raw=true "Title")

_Panel view:_

 &nbsp;&nbsp;&nbsp;&nbsp; ![widget_toolbar.png](readme_previews/cpu_panel.png?raw=true "Title")
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![widget_toolbar.png](readme_previews/gpu_panel.png?raw=true "Title")
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![widget_toolbar.png](readme_previews/ram_panel.png?raw=true "Title")
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ![widget_toolbar.png](readme_previews/fans_panel.png?raw=true "Title")

#### 2. How to use

To get started you need the XFCE panel `xfce4-panel` and the Generic Monitor plugin `xfce4-genmon-plugin`. Additionally, you will need `lm-sensors` for the CPU temperature and the fans. To make use of the GPU monitor you need `nvidia-smi` which is installed with the CUDA driver for NVIDIA graphics card. Unfortunately, this script won't work on AMD GPUs, however by taking a look at how I have the NVIDIA tracker set up should be pretty easy to configure of AMD as well.

To install, clone this repository `git clone https://github.com/kvidelov/hardware-monitor-xfce.git`. Next, for each plugin you want to use, you need to copy the absolute path of that shell script (`hardware-monitor-xfce\widgets\`) and add to a horizontal Generic Monitor `bash /absolute/path/to/widget.sh`. Then you can adjust font size, font and the period of how often you want the widget to get refreshed, personally I use 1-2 seconds for all widgets with Waree Bold 10.

#### 3. Adjustments

Check `lm-sensors` and see how your components are labeled, it is possible that you have different chipset and thus different labels. Usually, the fans are just labeled as `fan x` and fan 2 is the CPU Cooler, if you have more fans than me feel free to add those. For the CPU temperature, I use the `SMBUSMASTER` temperature because it provides the most reliable values directly from the processor. 

Lastly, as long as you have `nvidia-smi` the GPU tracker should work properly without the need for any adjustments.


_**I decided to make the "plugins" after getting inspired by seeing this repository `xfce4-genmon-scripts`.**_
