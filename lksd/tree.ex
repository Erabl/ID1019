defmodule Tree do
    :nil                              ## the empty tree
    {:leaf, value}                    ## a leaf
    {:node, value, left, right}       ## a node
    def member(_, :nil) do :no end
    def member(e, {:leaf, e}) do :yes end
    def member(_, {:leaf, _}) do :no end
    def member(e, {:node, e, _, _}) do :yes end
    def member(e, {:node, v, left, _}) when e < v do
       :no
    end
    def member(e, {:node, _, _, right})  do
       :no
end
end