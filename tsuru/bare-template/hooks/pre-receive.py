#!/usr/bin/env python

import urllib2
import os
import sys

tsuru_host = os.environ.get("TSURU_HOST", "127.0.0.1:8080")
token = os.environ.get("TSURU_TOKEN", "")
app_name = os.getcwd().split("/")[-1].replace(".git", "")
timeout = 1800

try:
    headers = {"Authorization": "bearer " + token}
    url = "{0}/apps/{1}/available".format(tsuru_host, app_name)
    request = urllib2.Request(url, headers=headers)
    f = urllib2.urlopen(request, timeout=timeout)
except urllib2.HTTPError as e:
    sys.stderr.write("\n ---> {0}\n\n".format(e.read()))
    sys.exit(1)
except:
    sys.stderr.write("\n ---> Failed to communicate with tsuru server (%s)\n" % tsuru_host)
    sys.exit(1)
