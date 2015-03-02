ex = require 'express'
app = ex()

app.all '*', (req,res)->
	stopped = false
	req.connection.on('close',()->
		stopped = true
	)
	while (not req.socket.destroyed) and (not stopped)
		rand = parseInt((Math.random()*1000000000))+""
		res.write(rand)

app.listen (process.env.http || process.env.port)
