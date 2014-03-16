fs = require 'fs'
ld = require 'lodash'
ex = require 'express'
argv = require('optimist').argv
app = ex()

app.all '*', (req,res)->
	stopped = false
	req.connection.on('close',()->
		stopped = true
	)
	while (not req.socket.destroyed) and (not stopped)
		rand = parseInt((Math.random()*1000000000))+""
		console.log rand
		res.write(rand)

app.listen argv.http
