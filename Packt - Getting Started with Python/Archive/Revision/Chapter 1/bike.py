class Bike:
    def __init__(self, color, frame_material):
        self.color = color;
        self.frame_material = frame_material;
    
    def brake(self):
        print("Braking");
    
red_bike = Bike('Red', 'Carbon Fiber')
blue_bike = Bike('Blue', 'Steel')

print(red_bike.color)
print(red_bike.frame_material)
print(blue_bike.color)
print(blue_bike.frame_material)

red_bike.brake()