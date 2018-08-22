
module RISE.SDVP.Internal.RControllStationComm
  ( rcscConnectTcp,
    rcscDisconnectTcp,
    rcscSetDebugLevel,
    rcscHasError,
    rcscLastError,
    rcscClearRoute,
    rcscSetAutopilotActive,
    rcscRcControl ) where 

import RISE.SDVP.Internal.CarState 
   
#include <rcontrolstationcomm_wrapper.h>

-- Marshalling 
alloc3 = allocaArray 3

peek3 d = peekarray 3 d 
  
-- C Bindings 
{# fun rcsc_connectTcp as ^ { `String', `Int' } -> `Bool' #} 

{# fun rcsc_disconnectTcp as ^ {  } -> `()' #}

{# fun rcsc_setDebugLevel as ^ { `Int' } -> `()' #}

{# fun rcsc_hasError as ^ { } -> `Bool' #}

{# fun rcsc_lastError as ^ { } -> `String' #}

-- Assumes (for now) the Ptr is allocated and has enough room for a CAR_STATE
{# fun rcsc_getState as ^ { `Int' , `Ptr ()' , `Int' } -> `Bool' #}

-- Assumes that the memory Ptr points to contains enough doubles
-- TODO: FIX!
{# fun rcsc_getEnuRef as ^ { `Int' , `Bool' , alloc3- `[Double]' peek3 , `Int' } -> `Bool' #}

-- TODO: FIX!
{# fun rcsc_setEnuRef as ^ { `Int' , with* `[Double]' , `Int' } -> `Bool' #}

-- TODO: FIX! 
{# fun rcsc_addRoutePoints as ^ { `Int' , `Ptr ()' , `Int' , `Bool' , `Bool' , `Int' , `Int' } -> `Bool' #}
--                                car      RPs       len    replace  mapOnly  mapRoute  timeout

{# fun rcsc_clearRoute as ^ { `Int' , `Int' , `Int' } -> `Bool' #} 

{# fun rcsc_setAutopilotActive as ^ { `Int' , `Bool', `Int' } -> `Bool' #}  

{# fun rcsc_rcControl as ^ { `Int' , `Int' , `Double' , `Double' } -> `Bool' #}

{- 
bool rcsc_getRoutePoints(int car, ROUTE_POINT *route, int *len,
                         int maxLen, int mapRoute, int timeoutMs);
bool rcsc_sendTerminalCmd(int car, char *cmd, char *reply, int timeoutMs);
-} 
