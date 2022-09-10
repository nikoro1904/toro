import pygame
 
class App:
    def __init__(self):
        self._running = True
        self._display_surf = None
        self.size = self.width, self.height = 640, 400
 
    def on_init(self):
        pygame.init()
        self._display_surf = pygame.display.set_mode(self.size)
        self._display_surf.fill((255,255,255))
        self._running = True
 
    def on_event(self, event):
        if event.type == pygame.QUIT:
            self._running = False
        

    def on_loop(self):
        pass
    def on_render(self):
        self._display_surf.fill((255,255,255))
        pygame.draw.circle(self._display_surf, (0,255,0), (100, 100), 50)
        pass
    def on_cleanup(self):
        pygame.quit()
 
    def on_execute(self):
        if self.on_init() == False:
            self._running = False

        while( self._running ):
            self._display_surf.fill((255,255,255))
            pygame.draw.circle(self._display_surf, (0,255,0), (100, 100), 50)
            for event in pygame.event.get():
                self.on_event(event)
            self.on_loop()
            self.on_render()
        self.on_cleanup()
 
if __name__ == "__main__" :
    theApp = App()
    theApp.on_execute()
    
"""
import pygame
pygame.init()
scr = pygame.display.set_mode((600, 500))
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
    scr.fill((255, 255, 255))
    pygame.draw.circle(scr, (200, 0, 0), (250, 250), 80)
    pygame.display.flip()
pygame.quit()
"""