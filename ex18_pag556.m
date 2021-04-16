function [result,vecx] = ex18_pag556(L,dx)

    vecx = -6*L:dx:6*L;
    result = zeros(1,length(vecx));

    for k = 1:length(vecx)
        if (vecx(k) >= -6*L) && (vecx(k) < -5*L)
            result(k) = 0;
        elseif (-5*L < vecx(k)) && (vecx(k) < -3*L)
            result(k) = vecx(k)/L+4;
        elseif (-3*L < vecx(k)) && (vecx(k) < -L)
            result(k) = 0;
        elseif (-L < vecx(k)) && (vecx(k) < L)
            result(k) = vecx(k);
        elseif (L < vecx(k)) && (vecx(k) < 3*L)
            result(k) = 0;
        elseif (3*L < vecx(k)) && (vecx(k) < 5*L)
            result(k) = vecx(k)/L-4;
        elseif (5*L < vecx(k)) && (vecx(k) < 6*L)
            result(k) = 0;   
        end
    end
end  