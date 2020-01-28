defmodule Huffman do

  def sample do
    'the quick brown fox jumps over the lazy dog
    this is a sample text that we will use when we build
    up a table we will only handle lower case letters and
    no punctuation symbols the frequency will of course not
    represent english but it is probably not that far off'
  end

  def text()  do
    'this is something that we should encode'
  end

  def test do
    sample = sample()
    # tree = tree(sample)
    encode = encode_table(tree)
    decode = decode_table(tree)
    text = text()
    seq = encode(text, encode)
    decode(seq, decode)
  end

  def tree() do
    # To implement...
    freq = freq(sample)
    huffman(freq,[])
  end


  def encode_table(tree) do
    # To implement...
  end

  def decode_table(tree) do
    # To implement...
  end

  def encode(text, table) do
    # To implement...
  end

  def decode(seq, tree) do
    # To implement...
  end
   
  def huffman([],l) do l end
  def huffman([{a,x},{b,y}|t],[]) do huffman([{a,x},{b,y}|t],_) end
  def huffman([{a,x},{b,y}|t],l) do
    iinsert({{a,b},(x+y)}, l)
    huffman(t,l)
  end

  def freq(sample) do
   freq(sample,[])
  end
  def freq([], freq) do huffsort(freq,[]) end
  def freq([c|r], [])do freq(r,[{c,1}]) end 
  def freq([c|r], l) do
   
   [{a, x}] = membr(l,c)
   l = remove({c, x-1}, l)
   l = append(l, [{c, x}])
   freq(r,l)
  end
 def membr([],n) do [{n,1}] end
 def membr([{h,v}|t],n)do
    cond do
    n==h ->
      [{h,v+1}]
    n!=h ->
       membr(t,n)

    end
 end
 def member(n,[])do :false end
 def member(n,[h|t]) do 
     cond do
       n==h ->
         :true
       n!=h ->
         member(n,t)  
     end
   end 
 def append([],y) do y end
 def append([h|t],y) do
   [h|append(t,y)]
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
 def pack([])do [] end
 def pack([h|t]) do 
   p = [preserve(h,[h|t])|pack(remove(h,t))]
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

 def len([]) do 0 end
 def len([_|tail]) do len(tail)+1 end

 def huffsort([l])do huffsort(l,[]) end
 def huffsort([],l) do l end
 def huffsort([h|t],sorted) do huffsort(t,inserth(h,sorted)) end

 def iinsert(x,[]) do [x] end
 def iinsert() do end


 def inserth(x,[]) do [x] end
#  def inserth()
 def inserth({n,x},[{h,y}|t])do
      cond do
      x<= y ->
        [{n,x},{h,y}|t]
      x>y ->
        [{h,y}|inserth({n,x},t)]  
    end  
  end
  def insert(x,[]) do [x] end
  def insert(x,[h|t]) do 
   cond do
       x<=h ->
        [x|[h|t]]
       x>h ->
        [h|insert(x,t)]
  end
  end

    def isort(l) do
      isort(l,[])
     end
  
   def isort([],l) do l end
   def isort([h|t],sorted) do
       isort(t,insert(h,sorted))
     end 
  def nth(0,[head|_]) do head end
  def nth(n,[_|tail]) do
      nth(n-1,tail)
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

  def preserve(_,[]) do [] end
  def preserve(x,[h|t]) do 
    cond do
    x==h ->
     [h|preserve(x,t)]
    x!=h ->
      preserve(x,t)
    end
   end  
end 
