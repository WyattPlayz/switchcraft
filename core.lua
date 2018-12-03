local chat = peripheral.wrap("manipulator_5555")
local send = "switchcraft.glitch.me/newmsg"
local receive = "switchcraft.glitch.me/getmsg"
local timer = os.startTimer(3)

while true do
  local event, player, message, uuid = os.pullEvent()
  if event == "chat_message" then
    http.post(send, player .. " " .. message)
    print('sent "' .. player .. ' ' .. message .. '" to server')
    else if event == "timer" then
      http.get(receive)
      local event, url, handle = os.pullEvent('http_success')
      for line in handle.readLine() do
        chat.say(line)
        print('said ' .. line)
      end
      timer = os.startTimer(3)
    end
end
