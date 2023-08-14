# Script for handling the job data
extends Node

var currentJob : int;
var ItemNode
var itemData = {};
var dataFilePath = "res://Data/Jobs.json";


func _ready():
	itemData = loadJsonFile(dataFilePath);

# Loads a json file and returns the parsed results
func loadJsonFile(filePath : String):
	if FileAccess.file_exists(filePath):
		var dataFile = FileAccess.open(filePath, FileAccess.READ);
		var parsedResult = JSON.parse_string(dataFile.get_as_text());
		
		if parsedResult is Dictionary:
			return parsedResult;
		else:
			print("Error reading file");
	else:
		print("File path does not exist!");
