function parse_hh_mm_ss(s::String)
    length(s) >= 8 || throw(ErrorException("length($(s)) < 8"))
    hh = str2_to_int(s[1:2])
    mm = str2_to_int(s[4:5])
    ss = str2_to_int(s[7:8])
    return hh, mm, ss
end

function parse_hhmmss(s::String)
    length(s) >= 6 || throw(ErrorException("length($(s)) < 6"))
    hh = str2_to_int(s[1:2])
    mm = str2_to_int(s[3:4])
    ss = str2_to_int(s[5:6])
    return hh, mm, ss
end

function parse_yyyy_mm_dd(s::String)
    length(s) >= 10 || throw(ErrorException("length($(s)) < 10"))
    yyyy = str4_to_int(s[1:4])
    mm = str2_to_int(s[6:7])
    dd = str2_to_int(s[9:10])
    return yyyy, mm, dd
end

function parse_yyyymmdd(s::String)
    length(s) >= 8 || throw(ErrorException("length($(s)) < 8"))
    yyyy = str4_to_int(s[1:4])
    mm = str2_to_int(s[5:6])
    dd = str2_to_int(s[7:8])
    return yyyy, mm, dd
end

function parse_yymmdd(s::String)
    length(s) >= 6 || throw(ErrorException("length($(s)) < 6"))
    yyyy = str2_to_int(s[1:2]) + 2_000 
    mm = str2_to_int(s[3:4])
    dd = str2_to_int(s[4:6])
    return yyyy, mm, dd
end

function parse_yyyy_mm_dd_hh_mm_ss(s::String)
    yyyy, mo, dd = parse_yyyy_mm_dd(s[1:10])
    hh, mi, ss = parse_hh_mm_ss(s[12:19])
    return Clock(yyyy, mo, dd, hh, mi, ss) 
end

function parse_yyyymmdd_hhmmss(s::String)
    yyyy, mo, dd = parse_yyyymmdd(s[1:8])
    hh, mi, ss = parse_hhmmss(s[10:15])
    return Clock(yyyy, mo, dd, hh, mi, ss) 
end

function parse_yymmdd_hhmmss(s::String)
    yyyy, mo, dd = parse_yymmdd(s[1:6])
    hh, mi, ss = parse_hhmmss(s[8:13])
    return Clock(yyyy, mo, dd, hh, mi, ss) 
end

function parse_yyyymmdd_hh_mm_ss(s::String)
    yyyy, mo, dd = parse_yyyymmdd(s[1:8])
    hh, mi, ss = parse_hh_mm_ss(s[10:17])
    return Clock(yyyy, mo, dd, hh, mi, ss) 
end

function parse_yymmdd_hh_mm_ss(s::String)
    yyyy, mo, dd = parse_yymmdd(s[1:6])
    hh, mi, ss = parse_hh_mm_ss(s[8:15])
    return Clock(yyyy, mo, dd, hh, mi, ss) 
end
