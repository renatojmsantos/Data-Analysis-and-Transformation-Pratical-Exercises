function sa = atrasa(sig,samp)

sa = [zeros(1,samp),sig(1:end-samp)];

end

