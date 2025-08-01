# Test the esp32's esp32.idf_heap_info to return sane data
try:
    import esp32
except ImportError:
    print("SKIP")
    raise SystemExit

import sys

# idf_heap_info() is expected to return at least this many
# regions for HEAP_DATA and HEAP_EXEC, respectively.
MIN_DATA = 3
MIN_EXEC = 3

impl = str(sys.implementation)
if "ESP32C2" in impl:
    # ESP32-C2 is less fragmented (yay!) and only has two memory regions
    MIN_DATA = 2
    MIN_EXEC = 2


# region tuple is: (size, free, largest free, min free)
# we check that each region's size is > 0 and that the free amounts are smaller than the size
def chk_heap(kind, regions):
    chk = [True, True, True, True]
    for r in regions:
        chk = [
            chk[0] and r[0] > 0,
            chk[1] and r[1] <= r[0],
            chk[2] and r[2] <= r[0],
            chk[3] and r[3] <= r[0],
        ]
    print(kind, chk)


# try getting heap regions
regions = esp32.idf_heap_info(esp32.HEAP_DATA)
print("HEAP_DATA >=MIN:", len(regions) >= MIN_DATA)
chk_heap("HEAP_DATA", regions)

# try getting code regions
regions = esp32.idf_heap_info(esp32.HEAP_EXEC)
print("HEAP_EXEC >=MIN:", len(regions) >= MIN_EXEC)
chk_heap("HEAP_EXEC", regions)

# try invalid param
print(esp32.idf_heap_info(-1))
