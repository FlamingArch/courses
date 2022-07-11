import discord
import os
import json
import requests
import random
from replit import db
from keep_alive import keep_alive


client = discord.Client()

sad_words = ['sad', 'depressed', 'miserable', 'depressing', 'unhappy', 'angry']

starter_encouragements = [
  'Cheer Up!',
  'Hang in there',
  "You're a great person"
]

if "responding" not in db.keys():
  db['responding'] = True

def get_quote():
  response = requests.get('https://zenquotes.io/api/random')
  json_data = json.loads(response.text)
  quote = json_data[0]['q'] + ' - ' + json_data[0]['a']
  return quote

def update_encouragements(encouraging_message):
  if  "encouragements" in db.keys():
    encouragements = db['encouragements']
    encouragements.append(encouraging_message)
    db['encouragements'] = encouragements
  else:
    db['encouragements'] = [encouraging_message]

def delete_encouragement(index):
  encouragements = db["encouragements"]
  if len(encouragements) > index:
    del encouragements
    db['encouragements'] = encouragements

@client.event
async def on_ready():
  print(f"We have logged in as {client.user}")

@client.event
async def on_message(message):
  msg = message.content
  if message.author == client.user:
    return
  if msg.startswith('$inspire'):
    await message.channel.send(get_quote())
  if db["responding"]:
    options = starter_encouragements
    if "encouragements" in db.keys():
      options = options + db['encouragements']
    if any(word in msg for word in sad_words):
      await message.channel.send(random.choice(starter_encouragements))
  if msg.startswith("$new_encouragement"):
    encouraging_message = msg.split("$new ", 1)[1]
    update_encouragements(encouraging_message)
    await message.channel.send('New Encouragement Added')
  if msg.startswith("$del"):
    encouragements = []
    if "encouragements" in db.keys():
      index = int(msg.split('$del', 1) [1])
      delete_encouragement(index)
      encouragements = db["encouragements"]
      await msg.channel.send(encouragements)
  if msg.startswith("$list"):
    encouragements = []
    if "encouragements" in db.keys():
      encouragements = db["encouragements"]
    await message.channel.send(encouragements)
  
  if msg.startswith("$responding"):
    value = msg.split("$responding ", 1)[1]
    if value.lower() == 'true':
      db['responding'] = True
      await message.channel.send("Responding is on.")
    else:
      db['responding'] = False
      await message.channel.send("Responding is on.")

keep_alive()
client.run(os.getenv('DISCORDTOKEN'))