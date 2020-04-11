Config = {}

Config.PlateText = 'ANARQUIA' -- 🚔 rented car number 🚔

Config.MaxNoJob = 1 -- 🚜 maximum number of cars for rent without work 🚜
Config.MaxJob = 3 -- 🛸 maximum number of cars that can be rented while having a job 🛸

Config.DistanseSpawn = 100.0 -- 🗺 the distance at which the car will spawn 🗺
Config.DistanseLock = 5.0 -- 🔒 the distance at which the car will be closed 🔒

Config.CarLock = false -- 🔐 If "true" the rented car can be closed and opened 🔐

Config.VehiclePositions = {            
   -- Example: 🛵 faggio/bici alquiler 🛵
	{x = -1010.71, y = -2696.58, z = 13.00, h = 81.69, model = 'faggio', price = 2, job = 'none'},
	{x = -1010.06, y = -2694.96, z = 13.00, h = 84.48, model = 'faggio', price = 2, job = 'none'},
	{x = -1009.44, y = -2693.55, z = 13.00, h = 76.99, model = 'faggio2', price = 3, job = 'none'},
	{x = -1008.89, y = -2692.15, z = 13.00, h = 80.65, model = 'faggio2', price = 3, job = 'none'},
	{x = -1007.13, y = -2688.77, z = 13.00, h = 79.70, model = 'faggio3', price = 3, job = 'none'},
	{x = -1005.89, y = -2687.23, z = 13.00, h = 81.82, model = 'faggio3', price = 3, job = 'none'},
	{x = -1004.96, y = -2685.47, z = 13.00, h = 84.86, model = 'tribike', price = 3, job = 'none'},
	{x = -1004.33, y = -2684.0, z = 13.00, h = 76.25, model = 'tribike2', price = 3, job = 'none'},
	{x = -1003.42, y = -2682.40, z = 13.00, h = 73.50, model = 'tribike3', price = 3, job = 'none'},
	
	{x = -1020.50, y = -2690.93, z = 13.00, h = 223.85, model = 'faggio', price = 3, job = 'none'},
	{x = -1019.57, y = -2689.42, z = 13.00, h = 225.41, model = 'faggio', price = 3, job = 'none'},
	{x = -1018.65, y = -2687.41, z = 13.00, h = 225.44, model = 'faggio2', price = 3, job = 'none'},
	{x = -1017.69, y = -2685.72, z = 13.00, h = 222.39, model = 'faggio2', price = 3, job = 'none'},
	{x = -1016.08, y = -2682.52, z = 13.00, h = 227.78, model = 'faggio3', price = 3, job = 'none'},
	{x = -1015.16, y = -2681.00, z = 13.00, h = 222.00, model = 'faggio3', price = 3, job = 'none'},
	{x = -1014.21, y = -2679.60, z = 13.00, h = 226.37, model = 'tribike', price = 3, job = 'none'},
	{x = -1013.51, y = -2678.31, z = 13.00, h = 231.22, model = 'tribike2', price = 3, job = 'none'},
	{x = -1012.58, y = -2677.08, z = 13.00, h = 226.39, model = 'tribike3', price = 3, job = 'none'},
	

  -- Example: 🚙 rent a car for money 🚙
   {x = -238.48, y = 6196.10, z = 30.48, h = 134.24, model = 'voodoo2', price = 3, job = 'none'},
   {x = -240.77, y = 6199.06, z = 30.48, h = 134.24, model = 'glendale', price = 6, job = 'none'},
   {x = -235.99, y = 6193.85, z = 30.48, h = 134.24, model = 'impaler', price = 6, job = 'none'},
   {x = -243.37, y = 6201.38, z = 30.48, h = 134.24, model = 'tampa', price = 6, job = 'none'},
   {x = -245.52, y = 6203.73, z = 30.48, h = 134.24, model = 'surge', price = 10, job = 'none'},
   
  -- concesionario alquiler
  {x =  -8.45, y = -1081.57, z = 26.68, h = 127.01, model = 'futo', price = 6, job = 'none'},
  {x =  -11.53, y = -1080.53, z = 26.68, h = 129.6, model = 'dubsta2', price = 15, job = 'none'},

  -- Alquiler limusinas
  {x =  426.92, y = 127.37, z = 100.52, h = 250.34, model = 'stretch', price = 275, job = 'none'},
  {x =  444.53, y = 120.89, z = 99.52, h = 252.85, model = 'patriot2', price = 325, job = 'none'},


  -- Example: Rent a car cerca de garage central :)
   {x =  121.29, y = -1081.82, z = 30.48, h = 359.69, model = 'futo', price = 5, job = 'none'},
   {x = 124.96, y = -1082.44, z = 30.48, h = 359.69, model = 'glendale', price = 6, job = 'none'},
   {x = 128.56, y = -1082.29, z = 30.48, h = 359.69, model = 'impaler', price = 6, job = 'none'},
   {x = 117.49, y = -1082.09, z = 30.48, h = 359.69, model = 'tampa', price = 6, job = 'none'},
   {x = 132.47, y = -1082.34, z = 29.19, h = 134.24, model = 'surge', price = 10, job = 'none'},
   {x = 136.11, y = -1081.71, z = 29.19, h = 134.24, model = 'dominator3', price = 12, job = 'none'},
   {x = -247.97, y = 6206.30, z = 30.48, h = 134.24, model = 'dominator', price = 12, job = 'none'},
   {x = 33.16, y = -1100.87, z = 29.4, h = 266.19, model = 'sultan', price = 14, job = 'none'},
   {x = 34.97, y = -1098.23, z = 29.4, h = 266.19, model = 'comet2', price = 14, job = 'none'},
   {x = 35.41, y = -1095.9, z = 29.4, h = 268.19, model = 'carbonrs', price = 14, job = 'none'},
   {x = -1375.87, y = -450.76, z = 34.48, h = 119.94, model = 'mule2', price = 1, job = 'none'},


  -- Example: Alquilar aviones :)
  {x =  -1005.74, y = -3001.82, z = 13.95, h = 66.28, model = 'luxor', price = 550, job = 'none'},
  {x =  -987.19, y = -2984.07, z = 13.95, h = 66.28, model = 'miljet', price = 950, job = 'none'},
  {x =  -1146.1, y = -2864.91, z = 13.95, h = 328.76, model = 'supervolito', price = 450, job = 'none'},

  -- Example: Alquiler Barcos 
   {x =  -741.56, y = -1350.03, z = 1.6, h = 51.0, model = 'speeder', speeder = 450, job = 'none'},
   {x =  -1624.91, y = -1169.26, z = 0.66, h = 129.57, model = 'seashark', price = 35, job = 'none'},
   {x =  -1626.35, y = -1167.97, z = 0.66, h = 129.57, model = 'seashark', price = 35, job = 'none'},
   {x =  -1628.03, y = -1165.87, z = 0.66, h = 129.57, model = 'seashark', price = 35, job = 'none'},
   {x =  -1629.51, y = -1163.87, z = 0.66, h = 129.57, model = 'seashark', price = 35, job = 'none'},
   {x =  -1632.81, y = -1193.13, z = 0.10, h = 90.37, model = 'marquis', price = 25, job = 'none'},
   {x =  -762.95, y = -1462.27, z = 0.10, h = 174.46, model = 'blimp', price = 150, job = 'none'},
   {x =  -718.32, y = -1322.99, z = 0.10, h = 227.02, model = 'jetmax', price = 150, job = 'none'},
   {x =  -723.02, y = -1327.21, z = 0.10, h = 229.29, model = 'jetmax', price = 150, job = 'none'},



   -- Example: Alquiler Paleto motos y coches 
   {x =  -134.46, y = 6281.46, z = 31.35, h = 227.85, model = 'bf400', price = 170, job = 'none'},
   
   
    




}	

 --/ ☢️ Information ☢️ /--
-- x, y, z, h -> vehicle coordinates
-- model -> Car model
-- price -> Price per minute car rental (if "false" then rent is free)
-- job -> The name of the fraction only she can rent a transport(If "none" then everyone can rent a transpo)

--/ 🤕 Not a bug but a feature 🤕 /--
-- When a player gets in a car that he has not rented for others,
-- he disappears, if this is removed, the player will endlessly fall
-- under the map for others, although for himself everything will be in order.

--/ 😁 There are no bugs 😁 /-- 
-- Sometimes the rented car stops opening and closing, as I understand what
-- the problem will be fixed (but this is not accurate)


-----------------------------------------------------------------------------------CONFIGURADO POR IKER CON CARIÑO ;)------------------------------------------------------------------
------------------------------------------------------------------------------------SCRIPT PARA ANARQUIA RP 2020----------------------------------------------------------------------------