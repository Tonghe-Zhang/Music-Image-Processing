

**Definitions and notations:**

analogue  signal continuous $f(t)$ 

analogue Fourier transform continuous $F(\omega)$

$F(\omega):=\int_{-\infty}^{+\infty}f(t)e^{-jwt}dt$



**use discrete sampling to estimate continuous signals:**

$f(t):$  time domain sample region total length $T$   

​			time domain sample number  $N$ 

​			time domain sample interval $\Delta t=\frac{T}{N}$

​			**time domain sample rate $f_s=\frac{N}{T}$**

​			**<u>In practice, we acquire the value of N from the length of digital signal while T is resumed via $T=\frac{N}{f_s}$</u>** 

​			time domain sample initial point $t_1$

​			time domain sample signal

​			$\tilde{f}[n;w]:=f(t_1+n \Delta t)e^{-jw(t_1+n \Delta t)}$

​			time domain sample points	

​			$\{t_1,t_1+\Delta t,...t_1+(N-1)\Delta t\}=\{t_1,t_1+\Delta t...t_1+T-\Delta t\}$

$F(\omega)$: frequency domain sample region total length $\Omega$

​			frequency domain sample number  $K$ 

​		    frequency domain sample interval $\Delta \omega=\frac{\Omega}{K}$

​			frequency domain sample initial point $\omega_1$	

​			discretization of frequency: $\omega \rightarrow w_1+k \Delta w$

​			frequency domain sample points:

​			$\{w_1,w_1+\Delta w,...w_1+(K-1)\Delta w\}=\{w_1,w_1+\Delta w...w_1+\Omega-\Delta w\}$

**Discrete estimate of Fourier Transform**

$\forall \omega \in \{w_1,w_1+\Delta w...w_1+\Omega-\Delta w\}$

$F(\omega)  =\tilde{F}(w_1+k \Delta w) = \sum_{n=0}^{N-1}f(t_1+n \Delta t)e^{-j(w_1+k \Delta w)(t_1+n \Delta t)}(\frac{T}{N})$

**N-point FFT(DFT) of a signal**

$fft_{N}(x[n])=\sum_{n=0}^{N-1}x[n] e^{-j(\frac{2\pi}{N})nk}$

**<u>(Simulation Theorem of Fourier Transform)</u>**

if $N=K,\Omega T=2 \pi N:$

**In the sense of discrete estimation**: 

$F(\omega )e^{j \omega t_1}≈\frac{T}{N}e^{j \omega_1t_1} fft_N(fe^{-j\omega_1t})$

(when fft is applied to a continuous signal, it means we first perform a N-point sample over a length of T, then FFT to the discrete sample.)

**This means**:

$if \space N=K,\Omega T=2 \pi N=2 \pi K:$

i.e. **If we sample the same amount of points in time and frequency domains: N=K, and that the sample interval in frequency domain is the same as the inverse of the total length of time domain:  $f_s=\frac{1}{T}$** 

Then for $\forall \omega \in \{w_1,w_1+\Delta w...w_1+\Omega-\Delta w\}:$

$F(w)≈\frac{T}{N}e^{j(w_1-w)t_1} FFT_{N,T}[f(t)e^{-jw_1t}]$

**where the points sampled in time domain are**

$\{t_1,t_1+\Delta t...t_1+T-\Delta t\}$, $\Delta t=\frac{T}{N}$



<u>**Proof of the simulation theorem:**</u> 

for each discrete sample point in LHS:

$F(w)e^{jw t_1}=F(w_1+k \Delta w) e^{j(w_1+k \Delta w)(t_1)}= \sum_{n=0}^{N-1}f(t_1+n \Delta t)e^{-j(w_1+k \Delta w)(t_1+n \Delta t)}(\frac{T}{N})e^{j(w_1+k \Delta w)(t_1)}=(\frac{T}{N})\sum_{n=0}^{N-1}f(t_1+n \Delta t)e^{-j(w_1+k \Delta w)(n \Delta t)}$

for each point in RHS:

$RHS=\frac{T}{N}e^{jw_1t_1}\sum_{n=0}^{N-1}f(t_1+n \Delta t)e^{-j(w_1)(t_1+n \Delta t)}e^{-j\frac{2\pi}{N}nk}=\frac{T}{N}\sum_{n=0}^{N-1}f(t_1+n \Delta t)e^{-j(w_1)(n \Delta t)}e^{-j\frac{2\pi}{N}nk}$

$ln(\frac{LHS}{RHS})=j(\frac{2\pi}{N}nk-k \Delta w n \Delta t)=jkn(\frac{2\pi}{N}-\Delta w\Delta t)$

The constraint says that $\Omega T=2 \pi N$   $so \space \Delta \omega \Delta t=\frac{\Omega}{K}\frac{T}{N}=\frac{2\pi N}{KN}=\frac{2 \pi }{K}$

$\frac{1}{2\pi jkn}ln(\frac{LHS}{RHS})=\frac{1}{N}-\frac{1}{K}$

The constrain also says that $N=K$,  this impels the above line to be zero, which means  $LHS=RHS$    $\square$

 