-- toyhash
-- Studio 55

recurseGuard = (Fn) ->
	Viewed = {}
	Enter = (Value, ...) ->
		if (type Value) == 'table'
			return if Viewed[Value]
			Viewed[Value] = true

		Fn Enter, Value, ...

	Enter

writeCell = (State, Value) ->
	State.Cells[State.Cursor] += Value
	State.Cursor = 1 + (State.Cursor % 12)

writeChar = (State, Char) ->
	writeCell State, Char\byte!

writeState = (State, String) ->
	writeChar State, String\sub i, i for i = 1, #String

keys = (Table) -> [K for K in pairs Table]
isArray = (Table) -> #Table == #keys Table

toChar = (N) -> N%10

defaultState = ->
	State = {
		Cursor: 1
		Initialized: false
		Cells: [0 for i = 1, 12]
	}
	writeState State, 'toyhash'
	State

Hash = (Recurse, Input, State) ->
	unless State then State = defaultState!

	T = type Input
	switch T
		when 'string', 'number', 'boolean'
			writeState State, T
			writeState State, tostring Input
		
		when 'table'
			A = isArray Input
			writeState State, if A then 'array' else 'object'
			for I, V in pairs Input
				unless A then Recurse I, State
				Recurse V, State

	State

Toyhash = (Input) ->
	State = (recurseGuard Hash) Input
	table.concat [toChar pos for pos in *State.Cells], ''

Toyhash
