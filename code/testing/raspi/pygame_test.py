import pygame
from smbus import SMBus

WHITE = (255, 255, 255)
RED = (255, 0, 0)
GREEN = (0, 255, 0)
BLUE = (0, 0, 255)
GREY = (150, 150, 150)

class KeySymbol():
    def __init__(self, direction, position, size=1):
        self.x = position[0]
        self.y = position[1]
        self.position = position
        self.direction = direction
        self.size = int(40*size)
        self.active = False

    def _get_coords(self):
        if self.direction == "right":
            A = self.x, self.y + self.size
            B = self.x, self.y - self.size
            C = self.x + 2*self.size, self.y
        elif self.direction == "left":
            A = self.x, self.y - self.size
            B = self.x, self.y + self.size
            C = self.x - 2*self.size, self.y
        elif self.direction == "down":
            A = self.x - self.size, self.y
            B = self.x + self.size, self.y
            C = self.x, self.y + 2*self.size
        elif self.direction == "up":
            A = self.x + self.size, self.y
            B = self.x - self.size, self.y
            C = self.x, self.y - 2*self.size
        else:
            raise ValueError("unknown direction")
        return [A, B, C]

    def draw(self, surface):
        coords = self._get_coords()
        color = BLUE if self.active else GREY
        pygame.draw.polygon(surface, color, coords)

    def activate(self):
        self.active = True

    def deactivate(self):
        self.active = False

    def is_active(self):
        return self.active

class App():
    def __init__(self):
        self._screen = None
        self._running = False
        self.size = (self.width, self.height) = (300, 300)
    
    def on_init(self):
        pygame.init()

        self._running = True
        self._screen = pygame.display.set_mode(self.size)
        self._screen.fill(WHITE)

        self.right_key = KeySymbol("right", (self.width//2 + 50, self.height//2))
        self.right_key.draw(self._screen)

        self.left_key = KeySymbol("left", (self.width//2 - 50, self.height//2))
        self.left_key.draw(self._screen)

        self.up_key = KeySymbol("up", (self.width//2, self.height//2 - 50))
        self.up_key.draw(self._screen)

        self.down_key = KeySymbol("down", (self.width//2, self.height//2 + 50))
        self.down_key.draw(self._screen)

        pygame.display.flip()

        # init I2C bus
        self.i2cbus = SMBus(1)
        self.i2caddress = 0x04


    def on_event(self, event):
        if event.type == pygame.QUIT:
            self._running = False
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT:
                self.left_key.activate()
                self.left_key.draw(self._screen)
                self.i2cbus.write_byte(self.i2caddress, int("04", 16))
                #print("left_key down")
            elif event.key == pygame.K_RIGHT:
                self.right_key.activate()
                self.right_key.draw(self._screen)
                self.i2cbus.write_byte(self.i2caddress, int("05", 16))
                #print("right_key down")
            elif event.key == pygame.K_UP:
                self.up_key.activate()
                self.up_key.draw(self._screen)
                self.i2cbus.write_byte(self.i2caddress, int("03", 16))
                #print("up_key down")
            elif event.key == pygame.K_DOWN:
                self.down_key.activate()
                self.down_key.draw(self._screen)
                self.i2cbus.write_byte(self.i2caddress, int("00", 16))
                #print("down_key down")
        elif event.type == pygame.KEYUP:
            if event.key == pygame.K_LEFT:
                self.left_key.deactivate()
                self.left_key.draw(self._screen)
                self.i2cbus.write_byte(self.i2caddress, int("ff", 16))
                #print("left_key up")
            elif event.key == pygame.K_RIGHT:
                self.right_key.deactivate()
                self.right_key.draw(self._screen)
                self.i2cbus.write_byte(self.i2caddress, int("ff", 16))
                #print("right_key up")
            elif event.key == pygame.K_UP:
                self.up_key.deactivate()
                self.up_key.draw(self._screen)
                self.i2cbus.write_byte(self.i2caddress, int("ff", 16))
                #print("up_key up")
            elif event.key == pygame.K_DOWN:
                self.down_key.deactivate()
                self.down_key.draw(self._screen)
                self.i2cbus.write_byte(self.i2caddress, int("ff", 16))
                #print("down_key up")

    def on_render(self):
        #pygame.draw.rect(self._screen, BLUE, (100, 100, 100, 100))
        pygame.display.flip()

    def game_loop(self):
        print("game_loop: " + str(type(self._screen)))
        while self._running:
            for event in pygame.event.get():
                self.on_event(event)
            self.on_render()


        pygame.quit()
        
if __name__ == "__main__":
    app = App()
    app.on_init()
    app.game_loop()