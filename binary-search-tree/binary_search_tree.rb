class Bst
  attr_reader :root

  def initialize(x)
    @root = Node.new(x)
  end

  def data
    root.data
  end

  def left
    root.left
  end

  def right
    root.right
  end

  def each(&block)
    all_data(root).each &block
  end

  def all_data(root)
    return [] unless root
    all_data(root.left) + [root.data] + all_data(root.right)
  end

  def insert(x)
    current = root
    while current
      if x <= current.data
        if current.left
          current = current.left
        else
          current.left = Node.new(x)
          return
        end
      else
        if current.right
          current = current.right
        else
          current.right = Node.new(x)
          return
        end
      end
    end
  end

  class Node
    attr_accessor :data, :left, :right

    def initialize(x)
      @data = x
      @left = nil
      @right = nil
    end
  end
end
