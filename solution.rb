# @param {Integer} num
# @return {String}
def number_to_words(num)
    return "Zero" if num == 0
    hash={0 => ["",""], 1 => ["One","One"], 2 => ["Two","Twenty"], 3 => ["Three","Thirty"], 4 => ["Four","Forty"], 5 => ["Five","Fifty"], 6 => ["Six","Sixty"], 7 => ["Seven","Seventy"], 8 => ["Eight","Eighty"], 9 => ["Nine","Ninety"]}
    hash2={100000000 => "Hundred Million", 1000000 => "Million", 100000 => "Hundred Thousand", 10000 => "Thousand" ,1000 => "Thousand", 100 => "Hundred"}
    return hash[num][0] if num <= 9 
    numberPlace=1
    str=([])
    digit=returnDigit(num,1)
    while num > 0
        num2=1
        str2=""
        lastDigit=digit
        digit=returnDigit(num,numberPlace)
        num=num-(digit*numberPlace)
        if digit != 0
            if numberPlace == 100 
                str.unshift("Hundred")
            elsif numberPlace == 1000 || numberPlace == 10000
                if str.include?("Thousand") != true
                    str.unshift("Thousand")
                end
            elsif numberPlace == 100000
                if str.include?("Thousand") != true
                    str.unshift("Hundred Thousand")
                else
                    str.unshift("Hundred")
                end
            elsif numberPlace == 1000000
                str.unshift("Million")
            elsif numberPlace == 10000000
                if str.include?("Million") != true
                    str.unshift("Million")
                end
            elsif numberPlace == 100000000
                if str.include?("Million") != true
                    str.unshift("Hundred Million")
                else
                    str.unshift("Hundred")
                end
            elsif numberPlace == 1000000000
                str.unshift("Billion")
            end
        end
        if numberPlace == 10 || numberPlace == 10000 || numberPlace == 10000000
            if digit == 1
                if lastDigit != 0
                    hashTeens={1 => "Eleven", 2 => "Twelve", 3 => "Thirteen",4 =>"Fourteen",5 =>"Fifteen", 6 =>"Sixteen", 7 => "Seventeen", 8 => "Eighteen", 9 =>"Nineteen"}
                    if ["Hundred","Thousand","Million","Billion"].include?(str[0]) != true
                        str[0]=hashTeens[lastDigit]
                    else
                        str.unshift(hashTeens[lastDigit])
                    end
                else
                    if ["Hundred","Thousand","Million","Billion"].include?(str[0]) != true
                        str[0]="Ten"
                    else
                        str.unshift("Ten")
                    end
                end
            else
                if digit != 0
                    arr=hash[digit]
                    str.unshift(arr[1])
                end
            end
        else
            if digit != 0
                arr=hash[digit]
                str.unshift(arr[0])
            end
        end
        numberPlace*=10
    end
    places=["Hundred","Thousand","Million","Billion"]
    (1...str.length).each do |ele|
        if places.include?(str[ele])
            if ele == str.length-1
                str=str[0..1]
            end
            next
        else
            break
        end
    end
    str=str.join(" ")
    str[-1]="" while str[-1] == " "
    return str
end
def returnDigit(num,place)
    if place == 1
        number=9
        while number > 0
            if (num-(number*place)) % 10 == 0 || (num-(number*place)) == 0
                return number
            end
            number-=1
        end
        return 0
    elsif num % (place*10) == 0 && place != 1
        return 0
    else
        number=9
        while number > 0
            if (num-(number*(place))) % (place*10) == 0
                return number
            end
            number-=1
        end
    end
end
