function [na,nc,m] = fpearmax(series, maxna, maxnc)
    na = 0;
    nc = 0;
    m = [];
    ydata = iddata(series);
    minfpe = 1000;
    tempna = 0;
    while tempna<=maxna
        tempnc = 0;
        while tempnc<=maxnc
            if tempna+tempnc==0 
                tempnc = tempnc+1;
                continue;
            end
            tempm = armax(ydata, 'na', tempna, 'nc', tempnc);
            tempfpe = fpe(tempm);
            if minfpe>tempfpe
                minfpe = tempfpe;
                na = tempna;
                nc = tempnc;
            end
            tempnc = tempnc + 1;
        end
        tempna = tempna + 1;
    end 
    if na + nc > 0
        m = armax(ydata,'na',na,'nc',nc);
    end
end

