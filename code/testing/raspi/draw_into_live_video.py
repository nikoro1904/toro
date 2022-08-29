import cv2 as cv

capture = cv.VideoCapture(0)

while True:
    isTrue, frame = capture.read()

    if isTrue:
        cv.circle(img=frame, center=(frame.shape[1]//2,frame.shape[0]//2), radius=40, color=(0,255,0), thickness=4)
        cv.imshow("Frame", frame)

    if cv.waitKey(20) & 0xFF==ord('q'):
        break
    
capture.release()
cv.waitKey(0)