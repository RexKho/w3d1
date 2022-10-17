require "byebug"

class Array
    def my_each(&prc)
        self.length.times do |num|
            # debugger
            prc.call(self[num])
        end
        self
    end

    def my_select(&prc)
        newarr = []
        self.my_each do |num|
            if prc.call(num)
                newarr << num
            end

        end
        return newarr
    end

    def my_reject(&prc)
        newarr = []
        self.my_each do |num|
            if !prc.call(num)
                newarr << num
            end

        end
        return newarr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            if prc.call(ele)
                return true
            end
        end
        return false
    end

    def my_all?(&prc)
        count = 0
        self.my_each do |ele|
            if prc.call(ele)
                count += 1
            end
        end
        if count == self.length
            return true
        else
            return false
        end

    end

    def my_flatten
        newarr = []
        self.my_each do |inarr|
            if inarr.is_a?(Array)
                newarr += inarr.my_flatten
            else
                newarr << inarr
            end

        end
        newarr
    end

    def my_zip(*arr)
        selfcopy = self
        newarr = []
        newarr << selfcopy
        newarr += arr
        finalarr = []
        newarr[0].length.times do |num1|
            temparr = []
            newarr.length.times do |num|
                temparr << newarr[num][num1]
            end
            finalarr << temparr
        end
     

        finalarr
    end

    def my_rotate(n=1)
        
        if n > 0
            newarr = self
            n.times do |num|
                temp = self[0]
                newarr.shift()
                newarr << temp
            end
            return newarr
        end
        # debugger

        
        if n < 0
            nextarr = self
            (-1*n).times do |num|
                # debugger
                temp = nextarr[-1]
                nextarr.pop()
                nextarr.unshift(temp)
            end
            return nextarr
        end
        
    end

    def my_join(n = nil)
        if n == nil
            return self.join("")
        end
        newarr = []
        self.my_each do |ele|
            newarr << ele << n
        end
        return newarr.join("")
    end

    def my_reverse
        if self.length == 1
            return self
        end
        newarr = []
        self.my_each do |ele|
            newarr.unshift(ele)
        end
        return newarr
    end

    def factors(num)
        newarr =* (2...num)
        newarr.my_select { |ele| num % ele == 0}
    end

   
end


