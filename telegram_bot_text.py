import requests
import sys
sys.path.insert(1, "/home/pwk/private_files/")
from script_bot import *
import socket

bot_message = sys.argv[1]
hostname = socket.gethostname()


def telegram_bot_sendtext(hostname, bot_message, bot_token, bot_chatID):

    send_text = 'https://api.telegram.org/bot' + \
        bot_token + '/sendMessage?chat_id=' + \
        bot_chatID + '&parse_mode=Markdown&text=' + \
        hostname + ':  ' + bot_message

    response = requests.get(send_text)

    return response.json()


telegram_bot_sendtext(hostname, bot_message, bot_token, bot_chatID)
