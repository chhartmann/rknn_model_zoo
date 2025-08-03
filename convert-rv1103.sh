#!/bin/bash
pip3 install --break-system-packages --user rknn-toolkit2

examples=(
    "mobilenet"
    "yolov5"
    "yolov10"
    "yolo11"
    "LPRNet"
)

for example in "${examples[@]}"; do
  (cd "examples/$example/model" && eval "source download_model.sh")
  (cd "examples/$example/python" && eval "python3 convert.py ../model/*.onnx rv1103")
done

