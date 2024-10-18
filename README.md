# QUICKphotonics - Quick UnIt Conversion Kit for Photonics

## Introduction

[**QUICKphotonics.mlappinstall**](https://github.com/jiaye-wu/QUICKphotonics/raw/refs/heads/main/QUICKphotonics.mlappinstall) (Quick UnIt Conversion Kit for Photonics) is a MATLAB-powered, commandline-style, **lightweight** and **modular** (expandable framework) tool for unit conversion in optics and photonics. It is currently a proprietary software maintained by [Jiaye Wu](https://jiaye-wu.github.io) and distributed under the [MIT license](https://opensource.org/license/mit).

- To use this MATLAB Toolbox App binary, MATLAB version equals or larger than R2022b (9.13) should be installed. Older versions are not tested.
- Install **QUICKphotonics.mlappinstall** and type ``QUICKphotonics`` or ``QUICK`` in the command window to start.
- In some cases, after restarting MATLAB, you need to manually find and click this application in the *APP* tab > *My app* on the top to (re)-enable it.

[**QUICKphotonics Excel.xltx**](https://github.com/jiaye-wu/QUICKphotonics/raw/refs/heads/main/QUICKphotonics%20Excel.xltx) is the Excel version of the MATLAB app. 

- This Excel calculator is macro-free. All features are realized by Excel functions.
- To use the tool, an office suite (Microsoft Office/WPS Office/LibreOffice, etc.) must be installed. Recommend using Microsoft Office 365 for the best compatibility.
- The tool starts as an Excel template (.xltx) which means creating a new file (.xlsx) each time. You can save the .xlsx file to your working directory. The changes are not saved to the template.
- Usage: download the **QUICKphotonics Excel.xltx** file to use it, or in **QUICKphotonics MATLAB** use command ``Excel`` or ``excel``.

## What problems/pain spots does it solve? Why would I need this tool?

The purpose of this software is to **enable quick lookup** of values **in experiments or academic discussions.**

The common conversions and calculations in optics & photonics such as "frequency difference to wavelength difference at a certain band", "photon energy", "Fresnel reflection at an angle", etc., are simple, **yet**:

- Writing a script function on-demand requires looking-up for the formula/constants, even verifications.
- Subsequently, your function files could become too many and non-centralized. You might not remember where to find them in a later project.
- Every time you use your old scripts, you might have to check your previous definitions (function names, units used, order of the values). If not careful enough, the results can be orders of magnitude off.

With the QUICKphotonics MATLAB Toolbox:

- You do not need to remember where you put the files. Once installed, just call the toolbox using ``QUICKphotonics`` or ``QUICK`` in the command window, or find it in your *MATLAB apps* tab.
- You do not need to remember the commands and deal with units. The commands are **flexibly spelt with auto-recognized units**, which is very intuitive to use.

## Feedbacks & credits

Bug reports and feature requests are open on my [GitHub project page](https://github.com/jiaye-wu/QUICKphotonics).

This toolkit is framework-based and modular. *New feature requests are considered if*:

- It is commonly used.
- It does not involve complex algorithm and computational power.
- It requires the number of input parameters fewer than 4. (1--3 are considered, to make it easy to remember.)

**If you find my tool useful**, please consider citing my [academic works](https://scholar.google.com/citations?user=D2n8tswAAAAJ) where suitable.

**Note:** 

- The author takes **NO** responsibility for any calculation errors.
- The rest of this markdown file is for QUICKphotonics **MATLAB version only**.

## Feature: introducing the *flexiCommand*

Introducing the **flexiCommand**, an *intuitive* and *easy-to-remember* type of command with **auto unit-recognition** and **flexible element order**.

A **flexiCommand** consists of 4~5 parts

- **head**: leading command head (only in some commands, ``energy``, ``reflect``, ``cav``, ``power``, etc.)
- **conv_source**: [reserve name](#reserved-words) of the conversion source, e.g., ``freq``
- **unit_source**: [unit](#supported-units) of the conversion source, e.g., ``THz``. Units are automatically recognized.
- **conv_target**: 2+(reserve name of the conversion target), e.g., ``2wl``. Here ``2`` means "to".
- **unit_source**: [unit](#supported-units) of the conversion target, e.g., ``nm``. Units are automatically recognized.

Except for **head**, the **order** of the rest parts **does not matter** in a **flexiCommand**.
To avoid any errors caused by ambiguity, please do not use combinations like ``t``(time) next to ``Hz`` or ``nm`` next to ``J``.

For example, ``wlnm2freqTHz 1550``, ``nmTHzwl2freq 1550``, ``wl2freqTHznm 1550`` are treated as the same command, and it does the same thing as ``wlum2freqTHz 1.550`` which converts 1550 nm to frequency in THz.

**Note:**

- All commands are case-sensitive.
- The commands tolerate irrelevant excessive letters, as long as the elements are accurate and intact.

## Simple commmands:

- To launch **QUICKphotonics Excel**: ``excel`` / ``Excel``
- To check for updates: ``update`` / ``upgrade``
- To visit project GitHub page: ``github`` / ``GitHub`` / ``project``
- To visit prioject blog: ``blog``
- For current version: ``version`` / ``ver`` 
- For changelog: ``changelog``
- For help and supported functions printed **in command line**: ``help`` / ``functions`` / ``commands`` / ``flexiCommand`` / ``flexiCMD``
- For help and supported functions **markdown file**: ``help-md`` / ``help-markdown``. Please **DO NOT** modify the contents of this file!
- For help and supported functions **online**: ``help-ol`` / ``help-online``
- For optical constants: ``constants``
- For author info/credits/licence/important notes: ``about`` / ``info`` / ``credits`` / ``license`` / ``licence``
- For restarting or returning to title page: ``restart`` / ``clear``
- For closing/terminating the programme: ``close`` / ``exit``

## Unit conversions & calculations

### 1. ``flexiCommand <value-1>``

#### 1.1 Wavelength and frequency conversion: ``wl(wl_unit)2freq(freq_unit) <value>``

(wl_unit): ``*m`` (nm, um, m, etc.) see [unit](#supported-units).

(freq_unit): ``*Hz`` (THz, GHz, Hz, etc.) see [unit](#supported-units).

For example, convert 1550 nm to THz, the command is ``wlnm2freqTHz 1550`` (or ``wlm2freqTHz 1550e-9`` or in other units).

Likewise, ``freqTHz2wlnm 193`` means convert 193 THz to nm.

#### 1.2 Frequency and time period conversion: ``freq(freq_unit)2t(t_unit) <value>``

(t_unit): ``*s`` (ps, ns, ms, etc.) see [unit](#supported-units).

For example, convert 5 GHz to time in ps, the command is ``freqGHz2tps 5`` (or ``freqGHz2tps 5e9`` or in other units).

Likewise, ``tps2freqGHz 4`` means convert 4 ps to GHz.

#### 1.3 Power converstion: ``power(mW/dBm)2(dBm/mW) <value>``

This command also support other scale of watt, and the user can replace ``mW`` to ``W``, ``uW``, etc.

For example, convert 3 dBm to mW, the command is ``powerdBm2mW 3``.

Likewise, ``powermW2dBm 3`` means convert 3 mW to dBm.

#### 1.4 Decibel and linear scale converstion: ``lin2dB <value>``

For example, convert factor-4 linear scale to dB, the command is ``lin2dB 4``.

Likewise, ``dB2lin 3`` means convert 3 dB to linear scale.

#### 1.5 Photon energy and frequency/wavelength: ``photonfreq(freq_unit)2E(energy_unit) <freq_value>`` or ``photonwl(wl_unit)2E(energy_unit) <wl_value>``

For photon energy, one can use either ``*J`` (like ``mJ``, ``uJ``, etc) or ``eV``.

For back-conversion, the cammand is similar: ``photonfreq(freq_unit)2E(energy_unit) <freq_value>`` or ``photonwl(wl_unit)2E(energy_unit) <wl_value>``.

For angular frequency, replace ``freq`` by ``afreq``, and the units are omitted (default: rad/s)

For back conversion, ``photonE(energy_unit)2wl(wl_unit) <wl_value>``, ``photonE(energy_unit)2freq(freq_unit) <freq_value>``, ``photonE(energy_unit)2afreq <afreq_value>``.

#### 1.6 Energy conversion between *J and eV: ``energyeV2(energy_unit) <value>`` and ``energy(energy_unit)2eV <value>``

``energyeV2J <value>`` converts eV to J, and ``energymJ2eV <value>`` converts mJ to eV.

### 2. ``flexiCommand <value-1> <value-2>``

#### 2.1 Difference in frequency/wavelength to difference in wavelength/frequency:

There are two scenarios.

- Known 2 freqeuncies/wavelengths and want difference in wavelength/frequency (e.g., for given $f_1$ and $f_2$, ask for $\Delta \lambda$): ``dfreq(freq_unit)2dwl(wl_unit) <freq1> <freq2>`` or ``dwl(wl_unit)2dfreq(freq_unit) <wl1> <wl2>``, for example ``dwlnm2dfreqTHz 1540 1545``
- Known the interval frequency/wavelength and bands (centre frequency/wavelength), and want difference in the other domain:
  - ``dfreq(freq_unit)2dwl(wl_unit)@wl <dfreq> <wl_central>`` (for given $\Delta f$ near $\lambda_c$, ask for $\Delta \lambda$)
  - ``dfreq(freq_unit)2dwl(wl_unit)@freq <dfreq> <freq_central>`` (for given $\Delta f$ near $f_c$, ask for $\Delta \lambda$)
  - ``dwl(wl_unit)2dfreq(freq_unit)@wl <dfreq> <wl_central>`` (for given $\Delta \lambda$ near $\lambda_c$, ask for $\Delta f$)
  - ``dwl(wl_unit)2dfreq(freq_unit)@freq <dfreq> <freq_central>`` (for given $\Delta \lambda$ near $f_c$, ask for $\Delta f$)

The centre frequency/wavelength should be in the same unit as (freq_unit) or (wl_unit).

#### 2.2 Wavenumber from wavelength/frequency/angular frequency: ``wl(wl_unit)2wn <n> <wl_value>`` / ``freq(freq_unit)2wn <n> <value>`` / ``afreq2wn <n> <value>``

For angular frequency, only rad/s is supported. For vacuum, input ``n`` as 1.

#### 2.3 Cavity free spectral range (FSR): ``cav(cavlength_unit)2freq(freq_unit) <n_cav> <length_cav>`` / ``cav(cavlength_unit)2t(period_unit) <n_cav> <length_cav>``

Calculates the FSR in freqeucny/time/wavelength intervals in the selected domains and units. For vacuum, input ``n`` as 1.

#### 2.4 Cavity length from FSR: ``freq(freq_unit)2cav(cavlength_unit) <n_cav> <freq>`` / ``t(period_unit)2cav(cavlength_unit) <n_cav> <t>``

Calculates the cavity length from FSR.

### 3. ``flexiCommand <value-1> <value-2> <value-3>``

#### 3.1 Fresnel reflection: ``reflectDEG <n1> <n2> <angle_DEG>`` or ``reflectRAD <n1> <n2> <angle_RAD>``

For example ``reflectDEG 1.2 1.6 0`` and ``reflectRAD 1.2 1.6 0`` do the same thing.

``n1`` and ``n2`` are refractive indices of the two media, ``angle`` is the incident angle. There are three outputs, $R_s$ and $R_p$ in two polarizations and their average $R_{avg}$.

``reflectDEG`` treats incident angle in degree, and ``reflectRAD`` treats incident angle in radian.

#### 3.2 Peak power and average power of pulsed laser. ``peak2pavg(intensity_unit)(temporal_unit)(reprate_unit) <P_peak> <t_pulse> <reprate>`` or ``pavg2peak(intensity_unit)(temporal_unit)(reprate_unit) <P_avg> <t_pulse> <reprate>``

(intensity_unit) is optional (can be omitted) and kept consistent throughout input and output.

Temporal width in time (``*s``), repetition rate in frequency (``*Hz``).

For example, ``peak2pavgGWpsMHz 0.5 1 16`` means the input has a peak power of 0.5 GW/unit_area, 1-ps temporal width, and 16-MHz repetition rate. If ``GHz`` is omitted, the unit will become (a.u.)/unit_area.

## Reserved words:

- 2 - to (in between two variables in a command)
- afreq - angluar frequency
- cav - cavity (length)
- dfreq - difference in frequency
- dwl - difference in wavelength
- energy -  convert energy units
- freq - frequency
- lin - linear scale (dimensionless)
- pavg - average power
- peak - peak power
- photon - convert photon energy
- power - power or intensity
- reflect - reflection
- t - time (interval)
- wn - wavenumber / propagation constant
- wl - wavelength

## Supported units:

- **angular frequency:** rad/s
- **angles:** DEG, RAD
- **frequency:** *Hz (Hz to THz)
- **linear energy/power:** dimensionless or *W (fW to GW) or *W/cm^2 (in pulsed laser)
- **logarithmic scale:** dB, dBm
- **photon energy:** *J (fJ to GJ), eV
- **wavelength/cavity length:** *m (am to Gm)
