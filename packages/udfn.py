# author: Keith Packard
# email: keithp@keithp.com
# dist-license: GPL 2
# use-license: unlimited

def mm2mils100( mm ):
	return int( mm / 25.4 * 1000.0 * 100.0 + 0.5 )

PkgWidth = 3.00
PkgHeight = 2.00
PadWidth = 0.85
PadHeight = 0.30
PadSpacingY = 0.5
PadSpacingX = PkgWidth
GroundWidth = 1.30
GroundHeight = 1.50
Clearance = 0.2

NumPad=8
NumX=2
NumY=NumPad/NumX

print '# author: Keith Packard'
print '# email: keithp@keithp.com'
print '# dist-license: GPL 2'
print '# use-license: unlimited'

print 'Element["" "UDFN-%d" "" "" 0 0 0 0 0 100 ""]' % NumPad
print "("

def pad(cx, cy, w, h, name, num):
    x1 = 0
    y1 = 0
    x2 = 0
    y2 = 0
    thickness = 0
    if w > h:
        thickness = h
        y1 = cy
        x1 = cx - (w - h) / 2
        y2 = cy
        x2 = cx + (w - h) / 2
    else:
        thickness = w
        x1 = cx
        y1 = cy - (h - w) / 2
        x2 = cx
        y2 = cy + (h - w) / 2
    mask = thickness + Clearance / 2
    print '    Pad[',\
        mm2mils100(x1), \
        mm2mils100(y1), \
        mm2mils100(x2), \
        mm2mils100(y2), \
        mm2mils100(thickness), \
        mm2mils100(Clearance), \
        mm2mils100(mask),\
        '"%s"' % name, '"%s"' % num, '"square"]'
    
def line(x1, y1, x2, y2):
    print '    ElementLine[',\
        mm2mils100(x1), \
        mm2mils100(y1), \
        mm2mils100(x2), \
        mm2mils100(y2), \
        '500]'
    
def rect(x, y, w, h):
    line(x,y,x+w,y)
    line(x+w,y,x+w,y+h)
    line(x+w,y+h,x,y+h)
    line(x,y+h,x,y)

def padx(p):
    x = (p-1) / NumY
    return (x - (NumX - 1)/2.0) * PadSpacingX

def pady(p):
    y = 0
    if (p <= NumY):
        y = p - 1
    else:
        y = NumPad - p
    return (y - (NumY - 1)/2.0) * PadSpacingY

for p in range(1,NumPad+1):
    pad(padx(p), pady(p), PadWidth, PadHeight, 'pin%i' % p, '%i' % p)

pad(0, 0, GroundWidth, GroundHeight, 'GND', 'GND')

rect(-PkgWidth / 2, -PkgHeight / 2, PkgWidth, PkgHeight)

print '    )'    
	# 11000 2000
#	ElementLine[-11000 -1000 -3600 -1000 100]
#	ElementLine[  3600 -1000 11000 -1000 100]
#
#	ElementLine[11000 -1000 11000 17000 100]
#	ElementLine[11000 17000 6000 17000 100]
#	ElementLine[ 6000 17000 4000 15000 100]
#	ElementLine[ 4000 15000 -4000 15000 100]
#	ElementLine[-4000 15000 -6000 17000 100]
#	ElementLine[-6000 17000 -11000 17000 100]
#	ElementLine[-11000 17000 -11000 -1000 100]
#	)
#
