
# VHDL obfuscator Tool
This project uses Python3 to obfuscate VHDL files. It is fast and easy to use. You must specify the source location of the VHDL files along with the path of the output files


## Features

- Generating Random Name for `SIGNAL`, `CONSTANT`, `VARIABLE`, `GENERIC` Parameters and `input/output` ports 
- All obfuscation names have 30 characters in length and consist of alphabets and numbers
- Removing all comments in `.vhd` files
- Selection of all `.vhd` files between other file formats in all subdirectories automatically.
- Copy source structure in destination and generate obfuscation files into them.
- This is very fast and you can see the progress of the obfuscation process.
- both original and obfuscation names of parameters save into `dump.txt` file together. you can use it as a reference.


## Screenshots

![FirstPic](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


## How to use
1.Clone this repository or download from release page

2.install Python3 in your enviroment (windows, linux or mac)

3.Open `cmd` in windows or `terminal` in linux or mac.

4.`cd` to directory of downloaded files.

5.type `py VHDL_Obfuscator_Tool.py YOUR_SRC_FOLDER_PATH YOUR_DIST_FOLDER_PATH`

>**Note**:
>don't worry about your original files, this app never overwrites them.


## Notice

* Must use `entity.work` for declaration of ipcores instead of using component
* Don't use the same signal name as ipcores ports in all VHDL files
* May need to modify some files in conflict by ipcores or Verilog files
## Donate
if you enjoy it or you wanna help the author for more open-source projects, you can support them from here.

* BTC: `bc1qpprd4ug9s4ws66mwqx0xypdcx7e200jzfjkeum`
* ETH: `0xB9E09Ff8757C4233371C9Bf5109E528dAd9daE19`
* TRX: `TRAzJXsMbtF63Gqr2opSP6hnssMJnrJZs5`
* XRP: `rKE8XHE6GKHXzfC9qMERXXBvfcZU6RLVK5`
* DOGE: `DSSS3sLKjCMLSYzbSz4tfYmCFMsuS9haA2`

if you live in Iran 🇮🇷, can use the link below:

<a href="http://www.coffeete.ir/pofa10">
       <img src="http://www.coffeete.ir/images/buttons/lemonchiffon.png" style="width:260px;" />
</a>



## Feedback
if you find it useful star this repository 

if you have any suggestions and ideas or fixing bugs, please feel free to connect with me:
farrokhi.pourya@gmail.com



## Thanks
- Thanks to [pcineverdies](https://github.com/pcineverdies/VHDL-obfuscator) for writing this code based on his repository.
