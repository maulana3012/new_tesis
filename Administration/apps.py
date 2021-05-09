import cv2
import numpy as np
import sys

cascPath = sys.argv[1]
cap = cv2.VideoCapture(0)
while(cap.isOpened()):

    rct, frame = cap.read()
    if rct == True:
        cv2.imshow('Framee', frame)

        if cv2.waitKey(1) & 0xFF==ord('q'):
            break

cap.release()
cv2.destroyAllWindows()
