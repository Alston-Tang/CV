import os
import json
from functools import reduce


def find_dropbox_path():
    app_data = os.environ['APPDATA']
    local_app_data = os.environ['LOCALAPPDATA']

    f = None
    if f is None:
        try:
            f = open(reduce(os.path.join, [app_data, "Dropbox", "info.json"]))
        except FileNotFoundError:
            pass

    if f is None:
        try:
            f = open(reduce(os.path.join, [local_app_data, 'Dropbox', 'info.json']))
        except FileNotFoundError:
            pass

    if f is None:
        return None

    data = json.load(f)

    return data["personal"]["path"]

