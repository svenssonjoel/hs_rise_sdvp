

#include <rcontrolstationcomm_wrapper.h>

{# fun rcsc_connectTcp as ^ { `String', `Int' } -> `Bool' #} 

{# fun rcsc_disconnectTcp as ^ {  } -> `()' #}

{# fun rcsc_setDebugLevel as ^ { `Int' } -> `()' #}

{# fun rcsc_hasError as ^ { } -> `Bool' #}

{# fun rcsc_lastError as ^ { } -> `String' #}

{-
bool rcsc_getState(int car, CAR_STATE *state, int timeoutMs);
bool rcsc_getEnuRef(int car, bool fromMap, double *llh, int timeoutMs);
bool rcsc_setEnuRef(int car, double *llh, int timeoutMs);
bool rcsc_addRoutePoints(int car, ROUTE_POINT *route, int len,
                         bool replace, bool mapOnly,
                         int mapRoute, int timeoutMs);
-}

{# fun rcsc_clearRoute as ^ { `Int' , `Int' , `Int' } -> `Bool' #} 

{# fun rcsc_setAutopilotActive as ^ { `Int' , `Bool', `Int' } -> `Bool' #}  

{# fun rcsc_rcControl as ^ { `Int' , `Int' , `Double' , `Double' } -> `Bool' #}

{- 
bool rcsc_getRoutePoints(int car, ROUTE_POINT *route, int *len,
                         int maxLen, int mapRoute, int timeoutMs);
bool rcsc_sendTerminalCmd(int car, char *cmd, char *reply, int timeoutMs);
-} 
