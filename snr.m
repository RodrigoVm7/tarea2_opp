function v = snr(x,y)
    x = double(x);
    y = double(y);
    
    v = 20*log10(norm(x(:))/norm(x(:)-y(:)));
end