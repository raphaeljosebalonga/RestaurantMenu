from dosql import *
import cgi
import json

def index(req, table_id):
    table_id = cgi.escape(table_id)
    x = doSql()
    rets = x.execqry("select * from get_restoMenu_Ordered_perid("+table_id+");", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
