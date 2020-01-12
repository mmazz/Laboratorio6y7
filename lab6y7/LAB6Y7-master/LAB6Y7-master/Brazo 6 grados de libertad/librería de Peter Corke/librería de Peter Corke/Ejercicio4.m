l1=Link([0 0 1 0 0])
l2=Link([0 0 1 0 0])

r=SerialLink([l1,l2])


r.plot([0 pi/2])
r.fkine([0 pi/2])
