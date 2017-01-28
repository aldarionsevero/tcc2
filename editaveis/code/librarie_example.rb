# Extende o recurso Recipe
class Chef
  class Recipe
    def client(ipaddr)
      node[ipaddr][:hostname]
    end
  end
end
