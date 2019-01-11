#var requireDebug 1
require sequencer,2.2.6
require ch8,,master
#require iocStats,ae5d083
#require recsync,1.3.0
#require autosave,5.9.0
#require MCoreUtils,1.2.1


epicsEnvSet(TOP, "$(E3_CMD_TOP)")
epicsEnvSet("IOCNAME", "example")

dbLoadRecords("dbExample1.db" "user=$(IOCNAME)")
dbLoadRecords("dbExample2.db" "user=$(IOCNAME), no=1, scan=1 second")
dbLoadRecords("dbExample2.db" "user=$(IOCNAME), no=2, scan=2 second")
dbLoadRecords("dbExample2.db" "user=$(IOCNAME), no=3, scan=5 second")

dbLoadRecords("dbSubExample.db", "user=$(IOCNAME)")

# need to define IOCNAME
# PV names
#loadIocsh("iocStats.iocsh", "IOCNAME=$(IOCNAME)")
#loadIocsh("recsync.iocsh",  "IOCNAME=$(IOCNAME)")
#loadIocsh("autosave.iocsh", "IOCNAME=$(IOCNAME), AS_TOP=$(TOP)")


iocInit()

## Start any sequence programs
seq sncExample, "user=$(IOCNAME)"

