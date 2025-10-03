import osproc, os, strformat

# ================================
# HARD-CODED EXECUTABLE PATH
# ================================
when defined(windows):
  const exePath = r"path\to\your\python.exe"  # Change to your executable
else:
  const exePath = "/home/you/yourprogram"        # Change for Linux/macOS

# ================================
# MAIN
# ================================

when isMainModule:
  # Collect optional arguments from command line
  var args: seq[string] = @[]
  for i in 1..paramCount():
    args.add(paramStr(i))

  # Run the executable with arguments
  echo fmt"Running executable: {exePath} with args: {args}"
  let process = startProcess(exePath, args=args, options={poParentStreams})

  # Wait for it to finish
  discard process.waitForExit()
  echo "Process finished."

