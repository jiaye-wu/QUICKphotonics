function para1 = funcConvert_WlFreq(para2, para2unit, para1unit)
    c_light = 299792458;
    wavelength = para2 .* para2unit;
    para1 = c_light ./ wavelength ./ para1unit;
end