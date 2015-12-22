
class LinkedList
	include Enumerable
	attr_accessor :node
    	
	def initialize()
		@Node = Struct.new(:value, :next, :prev)
		@head = nil
		@tail = nil
	end

	def insert_by_begin(value)
		if @head.nil?
			@head = @Node.new(value, nil, nil)
			@tail = @head
		else
			@head[:prev] = @Node.new(value, @head, nil)
			@head = @head[:prev]
		end
	end
		
	def insert_by_end(value)
		if @head.nil?
			@head = @Node.new(value, nil, nil)
			@tail = @head
		else
			@tail[:next] = @Node.new(value, nil, @tail)
			@tail = @tail[:next]
		end
	end
		
	def extract_by_begin()
		if @head.nil?
			raise RuntimeError, "List is empty, you can't extract a node"
		else
			if @head == @tail
				@head, @tail = nil
			else
				@head = @head[:next]
				@head[:prev] = nil
			end
			@head[:value]
		end
	end
		
	def extract_by_end()
		if @head.nil?
			raise RuntimeError, "List is empty, you can't extract a node"
		else 
			if @head == @tail
				@head, @tail = nil
			else
				@tail = @tail[:prev]
				@tail[:next] = nil
			end
		end
	end
		
	def get_value
		return @head[:value]
	end
    
    def get_next
        return @head[:next]
    end
    
    def get_prev
        return @head[:prev]
    end
    
	def size
		size = 0
		iterator = @head
		while (!iterator.nil?)
			iterator = iterator[:next]
			size+=1
		end
		return size
	end
	
	def insert_set(others)
	    for i in (0.. others.size-1)
	        insert_by_end(others[i])
	    end
	end
	
	def each
		iterator = @head
		while !iterator.nil?
		    yield iterator[:value]
			iterator = iterator[:next]
		end
	end
		
  
end