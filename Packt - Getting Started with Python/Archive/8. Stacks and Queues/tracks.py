import time
from random import randint
from queues import Queue


class Track():
    def __init__(self, title=None):
        self.title = title
        self.length = randint(5, 10)


class MediaPlayerQueue(Queue):
    def __init__(self):
        super(MediaPlayerQueue.self).__init__()

    def add_track(self, track):
        self.enqueue(track)

    def play(self):
        while self.count > 0:
            current_track_node = self.dequeue()
            print("Now Playing: {}".format(current_track_node.title))
            time.sleep(current_track_node.length)


track1 = Track('white wistle')
track2 = Track('butter butter')
track3 = Track('Oh black star')
track4 = Track('Watch that chicken')
track5 = Track('Dont go')

mediaPlayerQueue = MediaPlayerQueue()
mediaPlayerQueue.add_track(track1)
mediaPlayerQueue.add_track(track2)
mediaPlayerQueue.add_track(track3)
mediaPlayerQueue.add_track(track4)
mediaPlayerQueue.add_track(track5)

mediaPlayerQueue.play()