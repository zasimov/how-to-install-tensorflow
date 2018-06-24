$requiredTensorFlow = "1.8.0"
$requiredPython = "3.5"
$requiredCudart = "cudart64_90.dll"
$requiredCudnn = "cudnn64_7.dll"

# check nvcc is available
get-command "nvcc"
# check cudart is available
get-command $requiredCudart
# check cudnn is available
get-command $requiredCudnn

# check python3.x installation
get-command pip3
get-command python

$pyVersion = python -c "import sys; print(sys.version)"
if (! $pyVersion.startsWith($requiredPython)) {
   Write-Output "python $requiredPython is not found"
   Write-Output "FAIL"
   exit 1
} else {
  Write-Output "python $requiredPython is installed"
}

$tensorFlow = python -c "import tensorflow; print(tensorflow.__version__)"
Write-Output $tensorFlow
if (! ($tensorFlow -eq $requiredTensorFlow)) {
  Write-Output "tensorflow $requiredTensorFlow is not installed"
  Write-Output "$tensorFlow found instead"
  Write-Output "FAIL"
  exit 1
} else {
  Write-Output "tensorflow $requiredTensorFlow is installed"
}

python .\test_tensorflow.py
python .\test_gpu.py

Write-Output ""

if (! ($env:TF_CPP_MIN_LOG_LEVEL -eq 4)) {
  Write-Output "warning: you should set environment variable TF_CPP_MIN_LOG_LEVEL=4"
}