import requests
import sys
sys.path.insert(1, "/home/pwk/private_files/")
from script_bot import *

image_path = sys.argv[1]

def send_photo(bot_chatID, bot_token, image_path, image_caption=""):
    data = {"chat_id": bot_chatID, "caption": image_caption}
    url = "https://api.telegram.org/bot%s/sendPhoto" % bot_token
    with open(image_path, "rb") as image_file:
        ret = requests.post(url, data=data, files={"photo": image_file})
    return ret.json()


send_photo(bot_chatID, bot_token, image_path, image_caption="")

