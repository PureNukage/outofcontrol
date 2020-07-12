cellWidth = 32
cellHeight = 32
gridWidth = room_width / cellWidth
gridHeight = room_height / cellHeight

mpGrid = mp_grid_create(0,0,gridWidth,gridHeight,cellWidth,cellHeight)

mp_grid_add_instances(mpGrid, wall, true)

mp_grid_add_instances(mpGrid, door, true)

mp_grid_add_instances(mpGrid, lazers, true)