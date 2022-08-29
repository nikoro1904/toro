import cv2 as cv
import numpy as np

lower_yellow = np.array([29, 86, 6])
upper_yellow = np.array([64, 255, 255])

capture = cv.VideoCapture(0)

while True:
    isTrue, frame = capture.read()

    if isTrue:
        hsv = cv.cvtColor(frame, cv.COLOR_BGR2HSV)

        lower_blue = np.array([60, 35, 140])
        upper_blue = np.array([180, 255, 255])

        mask = cv.inRange(hsv, lower_yellow, upper_yellow)
        result = cv.bitwise_and(frame, frame, mask = mask)
        
        cv.imshow("mask", mask)
        cv.imshow("frame", frame)
        cv.imshow('result', result)

    if cv.waitKey(20) & 0xFF==ord('q'):
        break

capture.release()
cv.destroyAllWindows()
cv.waitKey(0)