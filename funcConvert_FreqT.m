function para1 = funcConvert_FreqT(para2, para2unit, para1unit)
    topval = 1;
    wavelength = para2 .* para2unit;
    para1 = topval ./ wavelength ./ para1unit;
end