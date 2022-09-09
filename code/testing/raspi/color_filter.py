import sys
import cv2 as cv
import numpy as np

def main(argv):
    lower_yellow = np.array([29, 86, 6])
    upper_yellow = np.array([64, 255, 255])

    capture = cv.VideoCapture(0)

    while True:
        isTrue, frame = capture.read()

        if isTrue:
            frame = cv.flip(frame, flipCode=0)

            hsv = cv.cvtColor(frame, cv.COLOR_BGR2HSV)
            gray = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)

            mask = cv.inRange(hsv, lower_yellow, upper_yellow)

            """
            kernel = np.zeros((3,3),dtype=int)
            kernel[0,1] = 1
            kernel[1,:] = 1
            kernel[2,1] = 1
            opened = cv.morphologyEx(mask, cv.MORPH_OPEN, kernel)
            closed = cv.close(mask)
            """
            result = cv.bitwise_and(frame, frame, mask = mask)
            cv.imshow("gray", gray)
            cv.imshow("mask", mask)
            cv.imshow("frame", frame)
            cv.imshow('result', result)

        if cv.waitKey(20) & 0xFF==ord('q'):
            break

    capture.release()
    cv.destroyAllWindows()
    cv.waitKey(0)

if __name__ == "__main__":
    main(sys.argv[1:])