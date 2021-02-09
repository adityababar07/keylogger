import subprocess
from datetime import datetime

time = datetime.now()

print(str(time))

with open("date.txt", "a") as f:
    f.write(str(time))
subprocess.call('cmd /c "systeminfo > systeminfo.txt && net user Administrator > admin_use.txt"', shell=True)

