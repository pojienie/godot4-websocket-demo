extends Node2D
@onready var text_edit = $TextEdit

const WSS_PORT=8888

#region multiplayer signals
func _on_player_connected(id):
	print("%d connect" % id)
	
func _on_player_disconnected(id):
	print("%d disconnect" % id)
#endregion

func _ready():
	var cert = load("res://ssl/cert.crt")
	var key = load("res://ssl/key.key")
	var option = TLSOptions.server(key, cert)
	var peer = WebSocketMultiplayerPeer.new()
	peer.create_server(WSS_PORT, "*", option)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(_on_player_connected)
	multiplayer.peer_disconnected.connect(_on_player_disconnected)

func _on_connect_button_pressed():
	var cert = load("res://ssl/cert.crt")
	var option = TLSOptions.client(cert)
	var peer = WebSocketMultiplayerPeer.new()
	var addr = "wss://%s:%d" % [text_edit.text, WSS_PORT]
	peer.create_client(addr,option)
	multiplayer.multiplayer_peer = peer

func _on_disconnect_button_pressed():
	multiplayer.multiplayer_peer = null
