from dosql import *
import json

def index(req):
    x = doSql()
    rets = x.execqry("select * from get_restoMenu_List();", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
