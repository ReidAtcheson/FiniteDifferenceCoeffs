using SymPy



function lagrange(order)

  is=collect(-floor(Int,order/2) : 1 : floor(Int,order/2));
  x=symbols("x");
  L=x^0;
  Ls=Array(typeof(L),(order,));


  for j = 1 : order
    ith=is[j];
    for i in is
      if i!= ith
        L=L*(x-i)/(ith-i);
      end
    end
    Ls[j]=copy(L);
    L=x^0;
  end


  return Ls;

end



function fd(order,d;t=Rational)
  Ls=lagrange(order);
  x =symbols("x");

  is=collect(-floor(Int,order/2) : 1 : floor(Int,order/2));
  D=Array(typeof(x),(order,order));
  for i = 1 : order
    for j = 1 : order
      D[i,j] =diff(Ls[j],x,d)(x=>is[i]);
    end
  end


  return Array{t}(D);

end


order=4
D=fd(order+1,2,t=Float64);
