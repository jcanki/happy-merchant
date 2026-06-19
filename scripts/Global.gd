# res://scripts/Global.gd
extends Node

var current_level: int = 1
var total_score: int = 0
var correct_transactions: int = 0
var wrong_transactions: int = 0
var satisfied_customers: int = 0

func reset_daily_stats():
	total_score = 0
	correct_transactions = 0
	wrong_transactions = 0
	satisfied_customers = 0
