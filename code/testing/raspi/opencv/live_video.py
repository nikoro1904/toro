import cv2 as cv

capture = cv.VideoCapture(0)

while True:
    isTrue, frame = capture.read()
    if isTrue:
        frame = cv.rotate(frame, cv.ROTATE_180)
        cv.imshow("Video", frame)

    if cv.waitKey(20) & 0xFF==ord("q"):
        break

capture.release()
cv.destroyAllWindows()

cv.waitKey(0)