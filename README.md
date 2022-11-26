# nk-qb-logs-elk
Sending QBCore Logs to Elastic Search System For better logging
<h2>Why I'm using ELK for store logs?</h2>
<ul>
<li>No rate limit like discord, slack</li>
<li>Better logs filter, finder</li>
<li>Using your own server with local transport - with zero delay</li>
<li>Can be using as DataSource for Grafana to display Dashboard 😎</li>
</ul>
<strong> Just see the sample images </strong>
<img src="https://user-images.githubusercontent.com/38779855/203367485-adfc5ef4-3ebc-4c12-b011-fb95ee45281f.png">

<h3>How to use?</h3>

<b>Just using same QB-Logs</b>
Event Sample: 
```lua
TriggerEvent('elk-log:server:elk', PlayerID, Citizenid, "Action", "Action Detail", IsDanger(true/false))
```
example in inventory:</b><br/>

```lua
TriggerEvent('elk-log:server:elk', ''.. GetPlayerName(source) ..'', ''.. Player.PlayerData.citizenid ..'', 'AddItem', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. ')** got item: [slot:' .. slot .. '], itemname: ' .. Player.PlayerData.items[slot].name .. ', added amount: ' .. amount .. ', new total amount: ' .. Player.PlayerData.items[slot].amount)
```

<b>Example in Players with ELK Logs and Tag in Discord Webhook:</b>
```lua
TriggerEvent('elk-log:server:elk', ''.. GetPlayerName(self.PlayerData.source) ..'', ''.. self.PlayerData.citizenid ..'', 'AddMoney', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') added, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype] .. ' reason: ' .. reason, true)
```
Using ELK Docker in this repository 

https://github.com/nkyo/elk-docker-compose
