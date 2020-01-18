defmodule Test do
  
  def append([],y) do y end
  def append([h|t],y) do
   [h|append(t,y)]
  
  end

  def double(n) do
    n*2
  end

  def toCels(f) do
    ((f-32)/1.8)
  end

  def recA(l,b) do
    (l*b)
  end

  def circA(r) do
     (r*r)*:math.pi
  end

  def prod(m,n) do
    if m==0 do
     0
    else
    n + prod((m-1),n)
  end
 end

  def prodCase(m,n) do
    case m do
      0->
        0
      _->
        n+prodCase((m-1),n)
    end
  end

  def prodCond(m,n)do
    cond do
      m==0 ->
        0
      true ->
        n+prodCond((m-1),n)
      end
  end

  def product_clauses(0,_) do 0 end
  def product_clauses(m,n) do
      product_clauses(m-1, n) + n
    end

  def exp(x,n) do
    cond do
      n==1 ->
        x
      true ->
        prodCond(exp(x,(n-1)),x)
    end
  end

  def expCond(x,p) do
    cond do
     p==1 ->
       x
    
     (rem(p,2) == 0) ->
      prod(expCond(x,div(p,2)),expCond(x,div(p,2)))
    
     true ->
       prodCond(expCond(x,(p-1)),x)
   
    end
  end

  def nth(0,[head|_]) do head end
  def nth(n,[_|tail]) do
    nth(n-1,tail)
  end 

  def len([]) do 0 end
  def len([_|tail]) do 
    len(tail)+1
  end

  def sum([]) do 0 end
  def sum([h|t]) do
      sum(t) + h 
   end

  def duplicate([]) do  [] end   
  def duplicate([h|t]) do 
      [h,h | duplicate(t)]

  end

  def add(x,[]) do [x] end
  def add(x, [h|t]) do 
   cond do
      x==h ->
        [x|t]
       
     x!= h ->
     [h | add(x, t)]

  end   
          end
  def remove(_,[]) do [] end
  def remove(x, [h|t]) do  
     cond do
       x== h ->
       remove(x,t)
       x!= h ->
       [h|remove(x,t)]
     end
  end

  def preserve(_,[]) do [] end
  def preserve(x,[h|t]) do 
    cond do
    x==h ->
     [h|preserve(x,t)]
    x!=h ->
      preserve(x,t)
    end
   end 

def unique([]) do [] end
def unique([h|t]) do
  l= remove(h, [h|t])
  p = unique(l)
  add(h,p)
end

def reverse([]) do [] end
def reverse([h|t]) do
    l = reverse(t)
    add(h,l)


end
# Så jag tog och kopierade upp listan len(unique(l))
# antal gånger och sedan rensade jag varje lista för sig
def pack([])do [] end
def pack(l) do 

end
# def do 


 end
