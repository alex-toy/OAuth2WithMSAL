import os
from pathlib import Path
import configparser

basedir = os.path.abspath(os.path.dirname(__file__))

p1 = Path(os.path.abspath(os.curdir)).parent
file_path = "/home/alexadmin/app/var.cfg"
file_path = file_path if os.access(file_path, os.R_OK) else "app\\var.cfg"
p2 = Path(file_path)
config_path = os.path.join(p1, p2)
config = configparser.ConfigParser()
config.read_file(open(config_path))


class Config(object):
    # In a production app, store this instead in KeyVault or an environment variable
    # TODO: Enter your client secret from Azure AD below
    CLIENT_SECRET = config['AD']['CLIENT_SECRET']

    AUTHORITY = "https://login.microsoftonline.com/common"  # For multi-tenant app
    # AUTHORITY = "https://login.microsoftonline.com/Enter_the_Tenant_Name_Here"

    CLIENT_ID = config['AD']['CLIENT_ID']

    # TODO: Enter the redirect path you want to use for OAuth requests
    #   Note that this will be the end of the URI entered back in Azure AD
    REDIRECT_PATH = f"{config['AD']['CLIENT_REDIRECT_PATH']}"  # Used to form an absolute URL, 
        # which must match your app's redirect_uri set in AAD

    # You can find the proper permission names from this document
    # https://docs.microsoft.com/en-us/graph/permissions-reference
    SCOPE = ["User.Read"]

    SESSION_TYPE = "filesystem"  # So token cache will be stored in server-side session