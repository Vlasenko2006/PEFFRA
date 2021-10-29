function error_cheker(start_lev,level,sigm,nu,Load)

global add nmr num div beta alpha nmr0 fle form gau;

if Load == 0 && start_lev ~=0
    start_lev = 0;
    warning('Check start_lev, probably wrong value')
end


if level<0
    error('  level must be nonegative')
end

if start_lev<0
    error( ' stat_lev must be nonegative')
end


if start_lev > level
    error(' Wrong value of stat_lev')
end

if nmr0 > nmr
    error('Wrong value of nme0')
end

if sigm <=0
    error(' sigma can be only positive')
end

if alpha <=0

     error('Alpha can be only positive')
end

if nu <=0
    error(' Alpha can be only positive')
end


if gau ~= 0 && gau ~= 1
     error('gau is undefined or set to wrong value')
end

if div ~= 0 && div ~= 1
     error('div is undefined or set to wrong value')
end


if Load ~= 0 && Load ~= 1
    error('Load is undefined or set to wrong value')
end


