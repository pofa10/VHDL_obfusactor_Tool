import re
from obfuscated_signal import obfuscated_signal
import os
from pathlib import Path
import argparse

# parser = argparse.ArgumentParser(description="Please determine source and destination directory of VHDL files")
# parser.add_argument("SRC", type=str, help="PLEASE SET SOURCE FILES DIRECTROY")
# parser.add_argument("DIST", type=str, help="PLEASE SET DISTINATION FILES DIRECTROY")
# args = parser.parse_args()

# SRC_Dir = args.SRC
# DIST_Dir = args.DIST


SRC_Dir = "..\Example\input"
DIST_Dir = "..\Example\output"



source_to_obfusacte = []

size_obfuscation = 30

# Search files in subdirectory
def list_All_Vhd_Files(path):
    for path, subdirs, files in os.walk(SRC_Dir):
        for name in files:
            if (name.endswith(".vhd")):
                # print(os.path.join(path, name))
                file_path = Path(path) / name
                # print(file_path)
                # source_to_obfusacte.append(os.path.join(path, name))
                source_to_obfusacte.append(file_path)
    return source_to_obfusacte


def get_token(files_list):
    signals = []
    for line in files_list:
        # Get path of the next file to analyze
        next_file = line
        with open(next_file, "rt") as file_to_obfuscate:
            # Read all the file
            text_file = file_to_obfuscate.read()
            # Remove comments
            text_file = re.sub(re.compile("--.*?\n" ) ,"\n" ,text_file) 

            # ----------- Get all its tokens
            # select signal, constant, variable
            SigDefinePattern = r"(?:signal|constant|variable)\s+(\w+)"
            Sig_file = re.findall(SigDefinePattern, text_file, re.IGNORECASE)
            # select types
            TypePattern = r'TYPE\s+(\w+)\s+is'
            type_file = re.findall(TypePattern, text_file, re.IGNORECASE)
            # select input, output ports
            inoutDefinePattern = r"(\w+)\s*:\s*(?:in|out|inout)\s+\w+"
            inout_file = re.findall(inoutDefinePattern, text_file, re.IGNORECASE)
            # select generic
            # GenericPattern = r'generic\s*\(\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*:\s*[^;]*;'
            # # GenericPattern = r'generic\s*\(\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*:\s*[a-zA-Z_][a-zA-Z0-9_]*\s*(?::=\s*[^;]*)?\s*\)'
            # Generic_file = re.findall(GenericPattern, text_file)

            generic_block_pattern = r'generic\s*\(\s*([\s\S]*?)\s*\)'
            generic_block = re.search(generic_block_pattern, text_file)
            if generic_block:
                generic_block = generic_block.group(1)

                # Pattern to match individual generic parameter names
                parameter_pattern = r'([a-zA-Z_][a-zA-Z0-9_]*)\s*:\s*[a-zA-Z_][a-zA-Z0-9_]*'
                Generic_file = re.findall(parameter_pattern, generic_block)

            tokens_file = Sig_file + inout_file + type_file + Generic_file
            # Put all the tokens in lowercase
            tokens_lowercase = [token.lower() for token in tokens_file]
            # Consider tokens which are no keywords and not numeric
            for token in tokens_lowercase:
                signals.append(token)
            # Remove dupicated signals
            signals = list(dict.fromkeys(signals))
    return signals


def Obfuscation_files(SRC_Dir, DIST_Dir, source_to_obfusacte, obfuscated_signals):
    # # Change all the files
    i = 0
    for next_file_input in source_to_obfusacte:
        # output file
        relative_path = next_file_input.relative_to(SRC_Dir)
        next_file_output = DIST_Dir / relative_path
        next_file_output.parent.mkdir(parents=True, exist_ok=True)

        i = i + 1
        with open(next_file_input, "rt") as file_input:
            with open(next_file_output, "wt") as file_output:
                # Modify each line of the input file and write it back to the output file
                print(next_file_input)
                print(str(i) + "/" + str(len(source_to_obfusacte)) + " Files obfusated")
                for line_input in file_input:
                    # print(line_input)
                    # Remove trailing comments (starting from --)
                    line_input = re.sub(re.compile("--.*?\n" ) ,"\n" ,line_input) 
                    for obf in obfuscated_signals:
                        regex = r"\b" + obf.signal + r"\b"
                        insenstive_regex = re.compile(regex, re.IGNORECASE)
                        line_input = insenstive_regex.sub(obf.obfuscated_signal, line_input)
                    file_output.write(line_input)
                    # print(line_input)

def Write_dumpfile(DIST_Dir,obfuscated_signals):
    # Dump json containing the old and new signals in out_directory/dump.txt
    # The result is an array of objects like {original_signal : "...", obfuscated_signal: "..."}
    with open(DIST_Dir + "dump.txt", "wt") as file_dump:
        file_dump.write("[\n")
        for obf in obfuscated_signals:
            line = f"\t{{\n\t\t\"original_signal\": \"{obf.signal}\",\n\t\t\"obfuscated_signal\" : \"{obf.obfuscated_signal}\"\n\t}},\n"
            file_dump.write(line)
        file_dump.write("]")



if (os.path.exists(SRC_Dir)):
    signals = get_token(list_All_Vhd_Files(SRC_Dir))
    # Generate an obfuscated version for each string
    obfuscated_signals = [obfuscated_signal(signal, size_obfuscation) for signal in signals]
    Obfuscation_files(SRC_Dir, DIST_Dir, source_to_obfusacte, obfuscated_signals)
    Write_dumpfile(DIST_Dir,obfuscated_signals)
    print('--------------- Job Done Successfully!')
else:
    print("ERROR: Source folder doesn't exist")