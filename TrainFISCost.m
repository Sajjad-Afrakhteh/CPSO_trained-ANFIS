
function [z, out]=TrainFISCost(x,fis,data)

    MinAbs=1e-5;
    if any(abs(x)<MinAbs)
        S=(abs(x)<MinAbs);
        x(S)=MinAbs.*sign(x(S));
    end

    p0=GetFISParams(fis);

    p=x.*p0;
    
    fis=SetFISParams(fis,p);
    
    x=data.TrainInputs;
    t=data.TrainTargets;
    y=evalfis(x,fis);
    
    e=t-y;
    
    MSE=mean(e(:).^2);
    RMSE=sqrt(MSE);
    
    z=MSE;
    
    out.fis=fis;
    %out.y=y;
    %out.e=e;
    out.MSE=MSE;
    out.RMSE=RMSE;
    
end