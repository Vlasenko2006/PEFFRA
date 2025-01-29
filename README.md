# PEFFRA (Physics Enabled Fluid Flow Restoration Algorithm)

## Intro

The general concept of  ‘fluid’ refers to anything that flows. The instances of such fluid are air floating around an airfoil or car, ocean currents,  water swirling in an experimental tank, etc. Particle image velocimetry (PIV) and Particle Tracking Velocimetry (PTV) are techniques for measuring such fluid's flow velocity. The idea is simple: the fluid is seeded with luminous particles, which are alighted by a strong source of light, i.e. wide laser beam. A high-speed camera captures the displacement of the particles. The velocity of these particles is estimated as the displacement divided by a time lag between two camera shots. 

However, the seeding usually is non-uniform and particles are slighted differently, depending on their position in the laser beam. Moreover, they may come in/out of the beam between the shots, resulting in gaps and noise present in PIV and PTV measurements. Existing algorithms developed for restoring such data are only applicable to experimental measurements collected under well-prepared laboratory conditions. However, in measurements of arbitrarily turbid coastal waters, the arrangement of such conditions is impossible. When the size of gaps or the noise level in these experimental measurements becomes too large, their successful restoration with existing algorithms becomes questionable. Here, we outline a new physics-enabled flow restoration algorithm (PEFRA), specially designed for the restoration of such velocity data. Implemented as a ‘black box’ algorithm, where no user background in fluid dynamics is necessary, the physical structure of the flow in gappy or noisy data can be restored by its hydrodynamical basis. The use of this is not dependent on types of flow, types of gaps, or noise in measurements. The algorithm will operate on any data time series containing a sequence of velocity flow fields recorded by PIV or PTV. Tests with numerical flow fields established that this method can successfully restore corrupted PIV and PTV measurements with different levels of sparsity and noise. This assessment of the algorithm performance is extended with an example application to in situ submersible 3D-PTV measurements collected in the bottom boundary layer of the coastal ocean, where the naturally occurring plankton and suspended sediments used as tracers cause an increase in the noise level that, without such denoising, will contaminate the measurements.

Below is an example of PEFFRA restored fluid flow. Note that red arrows are the noisy PTV input, and black errors is the PEFFRA's output and the grey parts of a snapshot specifies the area where the data was not available.  

![Sample Output](https://github.com/Vlasenko2006/PEFFRA/blob/main/Example_of_restored_flow.png)


## **Prerequisites**
1. Matlab


### **Scientific References**
1. Andrey Vlasenko et al 2015 Meas. Sci. Technol. 26 065301. *A physics-enabled flow restoration algorithm for sparse PIV and PTV measurements*. [DOI 10.1088/0957-0233/26/6/065301](https://arxiv.org/abs/1406.2661)
