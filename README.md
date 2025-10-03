# runpythonvirtual
It’s a basic Nim wrapper to run Python scripts with a hardcoded interpreter in the same shell while forwarding arguments transparently.

# 📜 Description of the Current Program

This Nim program is a simple Python launcher:

### Hardcoded Executable Path

The path to the Python interpreter inside the virtual environment is written directly into the code.

```
Example (Windows):

const exePath = r"C:\Programs\PythonVirtualEnv\tuivirtual\Scripts\python.exe"
```

### Command-Line Argument Forwarding

When you run the Nim program with arguments, it forwards them to the Python executable.

```
Example:

runpython.exe myscript.py arg1 arg2
```

internally runs:
```
C:\Programs\PythonVirtualEnv\tuivirtual\Scripts\python.exe myscript.py arg1 arg2
```

### Process Execution in Current Shell

- It uses ```startProcess(exePath, args=args, options={poParentStreams})```.

- This runs the Python script inside the same shell session as the Nim program, sharing stdin/stdout/stderr.

- That means no new window/terminal is opened; it just executes inline.

### Output Handling

- Because {poParentStreams} is used, all Python output is visible in the same console window.

- The program waits for Python to finish, then prints "Process finished.".

### ⚡ Example Run
```
nim c -r runpython.nim myscript.py
```
