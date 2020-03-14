defmodule Test do
  
  def append([],y) do y end
  def append([h|t],y) do [h|append(t,y)] end

  def double(n) do n*2 end

  def toCels(f) do ((f-32)/1.8) end

  def recA(l,b) do (l*b) end

  def circA(r) do (r*r)*:math.pi end

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
  def product_clauses(m,n) do product_clauses(m-1, n) + n end

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
  def hp35()

  def nth(0,[head|_]) do head end
  def nth(n,[_|tail]) do nth(n-1,tail) end 
  


  def len([]) do 0 end
  def len([_|tail]) do len(tail)+1 end

  def sum([]) do 0 end
  def sum([h|t]) do sum(t) + h end

  def duplicate([]) do  [] end   
  def duplicate([h|t]) do [h,h | duplicate(t)] end

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
  #   # Så jag tog och kopierade upp listan len(unique(l))
  #   # antal gånger och sedan rensade jag varje lista för sig
  def pack([])do [] end
  def pack([h|t]) do p = [preserve(h,[h|t])|pack(remove(h,t))] end
  
  def insert(x,[]) do [x] end
  def insert(x,[h|t]) do 
   cond do
       x<=h ->
        [x|[h|t]]
       x>h ->
        [h|insert(x,t)]
  end
  end

  def isort(l) do isort(l,[]) end
  
  def isort([],l) do l end
  def isort([h|t],sorted) do isort(t,insert(h,sorted)) end  

  def member(n,[])do :false end
  def member(n,[h|t]) do 
     cond do
       n==h ->
         :true
       n!=h ->
         member(n,t)  
     end
   end 


def decode([h|t]) do decode([h|t],[]) end
def decode([],[h|t]) do [h|t] end
def decode([{c,n}|t],l) do
  li= appendN({c,n},l)
  decode(t, li)
end   
def appendN({c,0},[h|t]) do [h|t] end
def appendN({c,n},l) do 
    p=append(c,l)
    appendN({c,n-1},p)
end
def append(x,[]) do [x] end
def append(x,[h|t])do
   [h| append(x,t)]
end


def zip([],[],l) do l end
def zip(l,ll) do zip(l,ll, []) end
def zip([h1|t1],[h2|t2],l) do
  zip(t1,t2,append({h1,h2},l))
 end

def eval({:add, x, y}) do eval(x) + eval(y) end
def eval({:mul, x, y}) do eval(x)*eval(y) end
def eval({:sub, x, y}) do eval(x) - eval(y) end
def eval({:div, x, y}) do div(eval(x),eval(y)) end
def eval({:neg, x}) do -1*x end 
def eval(n) do n end 
def eval({:int, n}) do n end

def drop([h|t], 0) do [t] end #plocka ut resten
def drop([h|t], n) do [h|drop(t, n-1)] end    #vi vill inte ta bort head så vi gör samma sak igen fast på svansen

def rotate([h|t], n) do rotate([h|t], n, [])  end
def rotate([h|t],0,first) do append([h|t],reverse(first)) end
def rotate([h|t],n,first) do rotate(t,n-1,[h|first]) end

def hp35([h|t]) do hp35(t,[h]) end
def hp35([],l)  do l end
def hp35([h|t],l= [a]) do hp35(t,[h|l])  end
def hp35([h|t],l =[a,b|t1]) do
  cond do
    h == :add ->
     hp35(t, l = [a+b|t1])
    h == :sub ->
      hp35(t,l = [b-a|t1])
    true ->
      hp35([t],[h|l])
    
end
end

def nth(1,{:leaf,c})do {:found,c} end
def nth(n,{:leaf, c}) do {:cont, n-1} end
def nth(n,{:node, left, right}) do 
  
    case nth(n,left) do
      {:cont,val}->
         nth(val,right)
      {:found,val}->
        {:found,val}

    end

end

# def hp35() do end
def pascal(1) do [1] end
def pascal(n) do
  [1|next(pascal(n-1))]
end
def next([h])do [h] end 
def next([h|t])do
 [b|_] = t
 [h+b|next(t)]
end
end



# def member(e, {:node, e, _, _}) do :yes end
# def member(e, {:node, v, left, _}) when e < v do
#        member(e,left)
# end
# def member(e, {:node, _, _, right})  do
#        member(e,right)
# end

# def insert(e, :nil)  do  {:leaf, e}  end
# def insert(e, {:leaf, v}) when e < v  do  {:node,v, {:leaf, e},:nil}  end
# def insert(e, {:leaf, v}) do {:node,v,:nil,{:leaf,e}} end
# def insert(e, {:node, v, left, right }) when e < v do
#    {:node,v,insert(e,left),right}
# end
# def insert(e, {:node, v, left, right })  do
#   {:node, v,left,insert(e,right)}
# end

# def reightmost({:leaf, e}) do e end
# def reightmost({:node, _, _ , right}) do  reightmost(right)  end

# def delete(e, {:leaf, e}) do  {:nil}  end
# def delete(e, {:node, e, :nil, right}) do right end
# def delete(e, {:node, e, left, :nil}) do  left  end
# def delete(e, {:node, e, left, right}) do
#  {:node,reightmost(left), delete(reightmost(left),left), right}
   
# end
# def delete(e, {:node, v, left, right}) when e < v do
#     {:node, v, delete(e,left), right}
# end
# def delete(e, {:node, v, left, right})  do
#     {:node, v,  left,  delete(e,right)}
# end
