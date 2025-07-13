import { WebSocketServer } from 'ws';

const wss = new WebSocketServer({ port: 5757 });

var clients = [];

wss.on('connection', function connection(ws) {
	// connect clients first, then web control
	//clients.push(ws);
	// connect web control first, then clients
	clients.unshift(ws);
	console.log("Connected to new client.");

	ws.on('message', function message(data) {
		var parsed = JSON.parse(data);

		if (parsed.type === "CLIENT") {
			console.log('%s received command.', parsed.message);

		}else if (parsed.type  === "COMMAND") {
			clients[0].send(`{"type":"EVAL","command":"${parsed.command}"}`);
			console.log("Issued command to client.");
		}
	});

	ws.on('error', function error(data) {
		clients.shift();
		console.log("Client disconnected.");
	});
});
