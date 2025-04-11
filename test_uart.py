import pytest
import serial
import serial.tools.list_ports
import time
import sys

# Ensure stdout uses UTF-8 encoding
sys.stdout.reconfigure(encoding="utf-8")

def get_available_ports():
    """Retrieve a list of available COM ports."""
    return [port.device for port in serial.tools.list_ports.comports()]

@pytest.fixture(scope="module")
def uart_com9():
    """Open COM9 at 115200 baud rate if available."""
    available_ports = get_available_ports()
    if "COM9" not in available_ports:
        pytest.skip("COM9 is not available!")

    ser = serial.Serial(port="COM9", baudrate=115200, timeout=1)
    print(f"✅ Connected to: {ser.name}")
    yield ser
    ser.close()

def test_uart_com9_only(uart_com9):
    """Read and print data from COM9 for 20 seconds without timestamp."""
    start_time = time.time()
    timeout = 60  # seconds

    buffer = ""
    last_rx_time = time.time()
    burst_gap = 0.01  # 10ms between bursts

    logs = []

    while time.time() - start_time < timeout:
        now = time.time()

        if uart_com9.in_waiting:
            data = uart_com9.read(uart_com9.in_waiting).decode("utf-8", errors="ignore")
            buffer += data
            last_rx_time = now
        elif buffer and (now - last_rx_time) > burst_gap:
            logs.append(buffer.strip())
            buffer = ""

        time.sleep(0.01)

    if logs:
        print("📡 COM9 Output:")
        for line in logs:
            print(line)

    print("✅ Data collection complete.")
    assert True
