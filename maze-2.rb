#!/usr/local/bin/ruby

# ########################################
# CMSC 330 - Project 1
# ########################################

class Maze

@startend = []
@size = 0;
@cells = {}
@path = {}
@pathin = {}
@pathstd = []
@weight = {}
@pathcord = {}
@dishash = {}
@connect = {}
@done = 0
@count = 0
@solve = "false"
@size1 = ""
@invalid = []
@newcell = Hash.new
@newcell1 = Hash.new
@lines = Hash.new
#-----------------------------------------------------------
# FUNCTION DECLARATIONS
#-----------------------------------------------------------
def self.parse(file)
  invalid = []
  linein  = file.gets
  patharr = []
  start = []
  temp = ""
  validin = "false"
  val2 = /[0-9]+,[0-9]+:/
  val4 = /[0-9]+,[0-9]+:[\s]*[udlr]*[\s](-)?[0-9]*.[0-9]*/
  val5 = /[0-9]+,[0-9]+:[\s]*[udlr]*[\s](-)?[0-9]*.[0-9]*,[^\s](-)?[0-9]*.[0-9]*/
  val6 = /[0-9]+,[0-9]+:[\s]*[udlr]*[\s](-)?[0-9]*.[0-9]*,[^\s](-)?[0-9]*.[0-9]*,[^\s](-)?[0-9]*.[0-9]*/
  val7 = /[0-9]+,[0-9]+:[\s]*[udlr]*[\s](-)?[0-9]*.[0-9]*,[^\s](-)?[0-9]*.[0-9]*,[^\s](-)?[0-9]*.[0-9]*,[^\s](-)?[0-9]*.[0-9]*/
  valpath = /path:(\"\w+\"),\(([0-9]+),([0-9]+)\),([udlr\,]{1,}[^ ][udlr]);/

  if linein.nil? == true
    return
  end

    if linein !~ /size=[0-9]+\s(start=)\([0-9]+,[0-9]+\)\s(end=)\([0-9]+,[0-9]+\)/
        invalid.push(linein)
    else
      @size1 = @size1[5]
      @startend[0] = @startend[0].gsub(/[^\d]/, '')
      @startend[1] = @startend[1].gsub(/[^\d]/, '')
      @startend[0] = "#{@startend[0][0]}" + " " + "#{@startend[0][1]}"
      @startend[1] = "#{@startend[1][0]}" + " " + "#{@startend[1][1]}"

    end

  while linein = file.gets do 
    line = linein.split(/[,:\s]+/)

    if line.length == 2
      if linein !~ val2
        validin = "false"
        invalid.push(linein)
        else
        validin = "true" 
        valid = linein.split(/^(?<cord>\d{1,2})\,(?<cord2>\d{1,2})\: (?:(?<dir>\w*[rlud])\ )?(?:(?<weights>\d+[.]\d+)\,)?(?:(?<weights1>\d+[.]\d+)\,)?(?:(?<weights2>\d+[.]\d+)\,)?(?:(?<weights3>\d+[.]\d+))?/)
        valid.delete("")
        valid.delete("\n")
        valid.delete(" \n")
        temp = ""
          
          valid.each do |v|
            temp = temp + "#{v} "
           end
           @newcell[[valid[0],valid[1]]] = "#{temp}"
           @newcell1[[valid[0],valid[1]]] = valid
           @lines[[valid[0],valid[1]]] = linein

        end
    end
      
    if line.length == 4
       if linein !~ val4
        invalid.push(linein)
        validin = "false"
        else
         validin = "true"
         valid = linein.split(/^(?<cord>\d{1,2})\,(?<cord2>\d{1,2})\: (?:(?<dir>\w*[rlud])\ )?(?:(?<weights>\d+[.]\d+)\,)?(?:(?<weights1>\d+[.]\d+)\,)?(?:(?<weights2>\d+[.]\d+)\,)?(?:(?<weights3>\d+[.]\d+))?/)
         valid.delete("")
         valid.delete("\n")
         valid.delete(" \n")
         temp = ""
          
          valid.each do |v|
            temp = temp + "#{v} "
           end
           @newcell[[valid[0],valid[1]]] = "#{temp}"
           @newcell1[[valid[0],valid[1]]] = valid
           @lines[[valid[0],valid[1]]] = linein
        end
    end

    if line.length == 5
       if linein !~ val5
        invalid.push(linein)
        validin = "false"
        else
         validin = "true"
         valid = linein.split(/^(?<cord>\d{1,2})\,(?<cord2>\d{1,2})\: (?:(?<dir>\w*[rlud])\ )?(?:(?<weights>\d+[.]\d+)\,)?(?:(?<weights1>\d+[.]\d+)\,)?(?:(?<weights2>\d+[.]\d+)\,)?(?:(?<weights3>\d+[.]\d+))?/)
         valid.delete("")
         valid.delete("\n")
         valid.delete(" \n")
         temp = ""
          
          valid.each do |v|
            temp = temp + "#{v} "
           end
           @newcell[[valid[0],valid[1]]] = "#{temp}"
           @newcell1[[valid[0],valid[1]]] = valid
           @lines[[valid[0],valid[1]]] = linein

        end
    end

    if line.length == 6
       if linein !~ val6
        invalid.push(linein)
        validin = "false"
        else
        validin = "true"
        valid = linein.split(/^(?<cord>\d{1,2})\,(?<cord2>\d{1,2})\: (?:(?<dir>\w*[rlud])\ )?(?:(?<weights>\d+[.]\d+)\,)?(?:(?<weights1>\d+[.]\d+)\,)?(?:(?<weights2>\d+[.]\d+)\,)?(?:(?<weights3>\d+[.]\d+))?/)
        valid.delete("")
        valid.delete("\n")
        valid.delete(" \n")
        temp = ""
       
          valid.each do |v|
            temp = temp + "#{v} "
           end
           @newcell[[valid[0],valid[1]]] = "#{temp}"
           @newcell1[[valid[0],valid[1]]] = valid
           @lines[[valid[0],valid[1]]] = linein

        end
    end

    if line.length == 7
       if linein !~ val7
        invalid.push(linein)
        validin = "false"
       else
        validin = "true"
        valid = linein.split(/^(?<cord>\d{1,2})\,(?<cord2>\d{1,2})\: (?:(?<dir>\w*[rlud])\ )?(?:(?<weights>\d+[.]\d+)\,)?(?:(?<weights1>\d+[.]\d+)\,)?(?:(?<weights2>\d+[.]\d+)\,)?(?:(?<weights3>\d+[.]\d+))?/)
        valid.delete("")
        valid.delete("\n")
        valid.delete(" \n")
         temp = ""
          
          valid.each do |v|
            temp = temp + "#{v} "
           end
           @newcell[[valid[0],valid[1]]] = "#{temp}"
           @newcell1[[valid[0],valid[1]]] = valid
           @lines[[valid[0],valid[1]]] = linein

      end
    end
  end
  

  @pathstd.each do |p|
   if p =~ valpath
    valid = p.split(valpath)
    valid[4].delete!(',')
    valid[1].delete!('"')
    @newcell[p] = "path #{valid[1]} #{valid[2]} #{valid[3]} #{valid[4]}"
   else
   invalid.push(p)
   end
  end 
  
  if invalid.empty? == true
     valid(@newcell1,@newcell,invalid)
  end

    if invalid.empty? == true
     print("#{@size1} ")
     print("#{@startend[0]} ")
     print("#{@startend[1]}")
     puts("\n")
     
     @newcell.each do |key,value|
         puts "#{value}"
     end
    else
    puts "invalid maze"
    invalid.each do |i|
    puts "#{i}"
    end
    end
end


def self.valid(arrayin,valid,invalid)
  currarr = []
  valin = ""
  arrayin.each do |key,value|
   if value[2].nil? == true
   else
      value[2].split(//).each do |v|

       if  v.include?"r"
        currarr[0] = "#{key[0].to_i + 1}"
        currarr[1] = key[1]

        if arrayin[currarr].nil? == false 
           if arrayin[currarr][2].nil? == false
             valin = arrayin[currarr][2]
           end
        else
        invalid.push(@lines[key])
        valid[key] = ""
        break
        end

        if valin.include?"l"
        else 
        invalid.push(@lines[key])
        invalid.push(@lines[currarr])
        valid[key] = ""
        break
        end 
       end

        if  v.include?"l"
        currarr[0] = "#{key[0].to_i - 1}"
        currarr[1] = key[1]

        if arrayin[currarr].nil? == false 
           if arrayin[currarr][2].nil? == false
             valin = arrayin[currarr][2]
           end
        else
        invalid.push(@lines[key])
        valid[key] = ""
        break
        end

        if valin.include?"r"
        else 
        invalid.push(@lines[key])
        invalid.push(@lines[currarr])
        valid[key] = ""
        break
        end 
        end
   
        if  v.include?"d" 
        currarr[0] = key[0]
        currarr[1] = "#{key[1].to_i + 1}"

        if arrayin[currarr].nil? == false 
           if arrayin[currarr][2].nil? == false
             valin = arrayin[currarr][2]
           end
        else
        invalid.push(@lines[key])
        valid[key] = ""
        break
        end

        if valin.include?"u"
        else 
        invalid.push(@lines[key])
        invalid.push(@lines[currarr])
        valid[key] = ""
        break
        end 
        end

        if  v.include?"u"
        currarr[0] = key[0]
        currarr[1] = "#{key[1].to_i - 1}"

        if arrayin[currarr].nil? == false 
           if arrayin[currarr][2].nil? == false
             valin = arrayin[currarr][2]
           end
        else
        invalid.push(@lines[key])
        valid[key] = ""
        break
        end

        if valin.include?"d"
        else 
        invalid.push(@lines[key])
        invalid.push(@lines[currarr])
        valid[key] = ""
        break
        end 
        end
      end
    end
  end
end

def self.opener(file)
  count = 0
  @cells.each do |key,value|
  if value[2].length == 4 
    count = count +1
  end
  end
  puts "#{count}"
end


def self.sortcells(file)
  i = ""
  j =""
  sorted = ["","","","","",]
  l = 0

  @cells.each do |key,value|
     l = value[2].length
     j = sorted[l]
     i = ",(#{value[0]},#{value[1]})"
     i = j+i 
     sorted[l] = i
    
  end
 l = 0
 sorted.each do |row|
  puts "#{l}" + "#{sorted[l]}"
  l = l + 1
  end 
end

def self.bridge(file)
  keyarr = []
  currkey = []
  valuearr = []
  currval = ""
  count = 0

  @cells.each do |key,value|
   if value.nil? != true
    if value[2].nil? != true
      if value[2].include? "r"
      keyarr = key 
      keyarr[1] = keyarr[1].to_i + 1
      keyarr[1] = "#{keyarr[1]}"
      currkey = keyarr

      valuearr = @cells[currkey]     
        if valuearr.nil? != true
          if valuearr[2].include? "r"
           keyarr[1] = keyarr[1].to_i + 1
           keyarr[1] = "#{keyarr[1]}"
           currkey = keyarr
           valuearr = @cells[currkey]

              if  valuearr.nil? != true

                if valuearr[2].include? "r"
                   count = count + 1
                end
              end 
            end 
          end
        end
    end
    end 
   end

 @cells.each do |key,value|
   if value.nil? != true
    if value[2].nil? != true
      if value[2].include? "d"
      keyarr = key
      keyarr[0] = keyarr[0].to_i + 1
      keyarr[0] = "#{keyarr[1]}"
      currkey = keyarr
      valuearr = @cells[currkey]     
       
        
         if valuearr.nil? != true
          if valuearr[2].include? "d"
           keyarr[0] = keyarr[0].to_i + 1
           keyarr[0] = "#{keyarr[1]}"
           currkey = keyarr
           valuearr = @cells[currkey]     
         
          if valuearr.nil? != true
                if valuearr[2].include? "d"
                  count = count + 1
                end
              end 
            end 
          end
        end
    end
   end
  end 


  puts "#{count}"
end

def self.path(file)
  pos = 0
  cost = 0
  dirarr = []
  currdir = []
  keyarr = []
  currcell = []
  weightval = []

  

  if @path.empty? == true
    puts "none"
    return 
  end


   
 @path.each do |key,value|  

        cost = 0
        dirarr = value[3].split(//)

        keyarr[0] = value[1] 
        keyarr[1] = value[2]
      
        dirarr.each do |d|
          currcell = @cells[keyarr]
          currdir =  currcell[2]
      
          if currdir.include? "#{d}"

            if "#{d}" == "u"
              pos = currdir.index('u')
              weightval = @weight[keyarr] 
              cost = cost + weightval[pos].to_f
              keyarr[1] = "#{keyarr[1].to_i - 1}"
              
              if@cells
              if @cells[keyarr][2].include?"d" 
                
              else
                cost = -3
                break
                end
              end
            end
          
            if "#{d}" == "d"
              pos = currdir.index('d')
               weightval = @weight[keyarr]
              cost = cost + weightval[pos].to_f
              keyarr[1] = "#{keyarr[1].to_i + 1}"
                 
              if @cells[keyarr][2].include?"u" 
              else
                cost = -3
                break
             end      
            end

            if "#{d}" == "l"
              pos = currdir.index('l')
              weightval = @weight[keyarr] 
              cost = cost + weightval[pos].to_f
              keyarr[0] = "#{keyarr[0].to_i - 1}"
              
               if @cells[keyarr][2].include?"r" 
              else
                cost = -3
                break
             end
            end 

            if "#{d}" ==  "r"
               pos = currdir.index('r')
               weightval = @weight[keyarr] 
               cost = cost + weightval[pos].to_f
               keyarr[0] = "#{keyarr[0].to_i + 1}"
               
                if @cells[keyarr][2].include?"l" 
                else
                cost = -3
                break
                end
            end 
          
          else
          cost = -3
          break
          end 

        end
      if cost != -3
      @pathin[key] = cost
      end

     
  end  
  @pathin = @pathin.sort_by {|name,cost| cost} 

  if @pathin.empty? 
     @paths = {}
     puts "none"
     return
  end


  @pathin.each do |key,value|
  printf("%10.4f",value)
  printf(" " + "#{key}\n")
  end
end

def self.printmaze(file)
   i = 0
   rowtop = Hash.new
   rowbottom = Hash.new
   currpic = Hash.new
   currarr = []
   path1(file)


   (@size + 1).times  do 
     rowtop[i] = []
     rowbottom[i] = []

    @size.times do 
     rowtop[i].push("+-")

     rowbottom[i].push("|")
     rowbottom[i].push(" ")
    end 
     rowbottom[i].push("|")
     rowtop[i].push("+")  
     i = i +1
   end
   rowbottom[i-1] = ""

    @cells.each do |key,value|

    if value[2].include? "l"
     rowbottom[key[1].to_i][key[0].to_i*2] = " "

    end

    if value[2].include? "r"
    rowbottom[key[1].to_i][key[0].to_i*2 + 2 ] = " "
    
    end

    if value[2].include? "d"
     rowtop[key[1].to_i + 1][key[0].to_i] = "+ "
    
    end


    if value[2].include? "u"
      rowtop[key[1].to_i][key[0].to_i] = "+ "
    end

    

      if @pathcord[key].nil? != true
     rowbottom[key[1].to_i][key[0].to_i*2 + 1 ] = "*"
     end

      if key[1] ==@startend[1]  && key[0] == @startend[0]
         if @pathcord[key].nil? != true
            rowbottom[key[1].to_i][key[0].to_i*2 + 1 ] = "S"
         else
       rowbottom[key[1].to_i][key[0].to_i*2 + 1 ] = "s"
        end 
      end

      if key[1] == @startend[3] && key[0] == @startend[2]
        if @pathcord[key].nil? != true
           rowbottom[key[1].to_i][key[0].to_i*2 + 1 ] = "E"
        else
        rowbottom[key[1].to_i][key[0].to_i*2 + 1 ] = "e"
         end
      end

    end

     
    
    i = 0

    


     rowtop.each do |r|
     puts rowtop[i].join("")
     if rowbottom[i].empty? == false
     puts rowbottom[i].join("")
    end

     i = i + 1
     end
end

def self.path1(file)
  pos = 0
  cost = 0
  dirarr = []
  currdir = []
  keyarr = []
  currcell = []
  weightval = []
  smallest = ["name",300000]
  

  if @path.empty? == true
    
    return 
  end


   
 @path.each do |key,value|  




        cost = 0
        dirarr = value[3].split(//)

        keyarr[0] = value[1] 
        keyarr[1] = value[2]
        @pathcord[key] = 1
        @pathcord[key] = Hash.new
        @pathcord[key][["#{keyarr[0]}","#{keyarr[1]}"]] = []
        @pathcord[key][["#{keyarr[0]}","#{keyarr[1]}"]].push(["#{keyarr[0]}","#{keyarr[1]}"]) 


      
        dirarr.each do |d|
          currcell = @cells[keyarr]
          currdir =  currcell[2]
      
          if currdir.include? "#{d}"

            if "#{d}" == "u"
              pos = currdir.index('u')
              weightval = @weight[keyarr] 
              cost = cost + weightval[pos].to_f
              keyarr[1] = "#{keyarr[1].to_i - 1}"
              
              if@cells
              if @cells[keyarr][2].include?"d" 
                
              else
                cost = -3
                break
                end
              end
            end
          
            if "#{d}" == "d"
              pos = currdir.index('d')
               weightval = @weight[keyarr]
              cost = cost + weightval[pos].to_f
              keyarr[1] = "#{keyarr[1].to_i + 1}"
                 
              if @cells[keyarr][2].include?"u" 
              else
                cost = -3
                break
             end      
            end

            if "#{d}" == "l"
              pos = currdir.index('l')
              weightval = @weight[keyarr] 
              cost = cost + weightval[pos].to_f
              keyarr[0] = "#{keyarr[0].to_i - 1}"
              
               if @cells[keyarr][2].include?"r" 
              else
                cost = -3
                break
             end
            end 

            if "#{d}" ==  "r"
               pos = currdir.index('r')
               weightval = @weight[keyarr] 
               cost = cost + weightval[pos].to_f
               keyarr[0] = "#{keyarr[0].to_i + 1}"
               
                if @cells[keyarr][2].include?"l" 
                else
                cost = -3
                break
                end
            end 
          

          else
          cost = -3
          break
          end 

          @pathcord[key][["#{keyarr[0]}","#{keyarr[1]}"]] = []
          @pathcord[key][["#{keyarr[0]}","#{keyarr[1]}"]].push(["#{keyarr[0]}","#{keyarr[1]}"])   
        end
      if cost != -3
      @pathin[key] = cost
      end

       if cost < smallest[1] && cost != -3
        smallest[1] = cost 
        smallest[0]  = key
       end
     
  end  
  @pathin = @pathin.sort_by {|name,cost| cost} 
    

  if @pathin.empty? 
     @paths = {}
     @pathcord = {}
     return
  end
  @pathcord = @pathcord[smallest[0]]
end

def self.distance(file)
    distance = 0 
    dishash = Hash.new
    dir = ""

    dishash[0] = [@startend[0],@startend[1]]
    dir = @cells[[@startend[0],@startend[1]]][2]
    @connect[[@startend[0],@startend[1]]] = [0]
    dishelper(dir,0,[@startend[0],@startend[1]])

    @dishash.each do |key,value|
      value.sort!
   if @dishash[key].empty? == false
    print "#{key}"
     value.each do |v|
      print "#{v}" 
      end
    puts "\n"  
    end
  end
end

def self.distance2(file)
    distance = 0 
    dishash = Hash.new
    dir = ""

    dishash[0] = [@startend[0],@startend[1]]
    dir = @cells[[@startend[0],@startend[1]]][2]
    @connect[[@startend[0],@startend[1]]] = [0]
    dishelper(dir,0,[@startend[0],@startend[1]])

    @dishash.each do |key,value|
   if @dishash[key].empty? == false
     value.each do |v|
      end
    end
  end
end



def self.solve(file)
  distance2(file)
  if @connect.has_key?(["#{@startend[2]}","#{@startend[3]}"])
    puts "true"
  else
   puts "false"
  end
end

def self.dishelper(directions,steps,keyin)
  currdir = []
  
  if @dishash[steps].nil? == true
       @dishash[steps] = []
  end
  

  @dishash[steps].push( ",(" + "#{keyin[0]}" + "," + "#{keyin[1]}" + ")") 

  if(directions == nil)
    return
    m = 0 

  end

  if @connect[keyin].nil? == false && @done > 0
    
      return 
  end
  
   @done = @done + 1
   @connect[["#{keyin[0]}","#{keyin[1]}"]] = steps


  
   directions.split(//).each do |c| 

      
        if c.include? "l"
          currdir[0] = "#{keyin[0].to_i - 1}"              
          currdir[1] = keyin[1]
        end


        if c.include? "r"
         currdir[0] = "#{keyin[0].to_i + 1}"   
         currdir[1] = keyin[1]
        end

        if c.include? "d"
          currdir[1] = "#{keyin[1].to_i + 1}"
          currdir[0] = keyin[0]
        end

        if c.include? "u"
         currdir[1] = "#{keyin[1].to_i - 1}"        
         currdir[0] = keyin[0]
        end
        
        if @cells[currdir][2].nil? == false
        valin = @cells[currdir][2]
        end

          
        if @cells[currdir][2].nil? == true
        valin = nil
        end

       if @connect[currdir].nil? == true  &&  @cells[currdir][2].nil? != true
          dishelper(valin,@connect[keyin]+ 1 ,currdir)
       end


        if @connect[currdir].nil? == false
           arrange(currdir,@connect[currdir],keyin,@connect[keyin],@dishash)
        end

      


   end
end

def self.arrange(child,childsize,parent,parentsize,hashin)
  if childsize > parentsize + 1
   hashin[childsize].delete(",(" + "#{child[0]}" + "," + "#{child[1]}" + ")")
   hashin[parentsize + 1].push(",(" + "#{child[0]}" + "," + "#{child[1]}" + ")")
   @connect[child] =  parentsize + 1
  
    if @cells[child][2].nil? == false
      parent = ["#{child[0]}","#{child[1]}"]
      parentsize = parentsize + 1

      @cells[child][2].split(//).each do |c|
        if c.include? "l"
          child[0] = "#{child[0].to_i - 1}"              
          child[1] = parent[1]
        end


        if c.include? "r"
         child[0] = "#{child[0].to_i + 1}"   
         child[1] = parent[1]
        end

        if c.include? "d"
          child[1] = "#{child[1].to_i + 1}"
          child[0] = parent[0]
        end

        if c.include? "u"
          child[1] = "#{child[1].to_i - 1}"        
          child[0] = parent[0]
        end
        
        arrange(child,@connect[child],parent,parentsize,hashin)
     end
    end
  end
end

def self.store(file)
  if @call == 1
     return 
  end

  line = file.gets
  if line == nil then return end

  # read 1st line, must be maze header
  sz, sx, sy, ex, ey = line.split(/\s/)
  #puts "header spec: size=#{sz}, start=(#{sx},#{sy}), end=(#{ex},#{ey})"
  @size1 = sz
  @size = sz.to_i
  @startend = [sx,sy,ex,ey]

  # read additional lines
  while line = file.gets do

    # begins with "path", must be path specification
    if line[0...4] == "path"
     
      p, name, x, y, ds = line.split(/\s/)
      #puts "path spec: #{name} starts at (#{x},#{y}) with dirs #{ds}"
       @path[name] = [name,x,y,ds,"valid"]
       @pathstd.push(line)


    # otherwise must be cell specification (since maze spec must be valid)
    else
      x, y, ds, w = line.split(/\s/,4)
      #puts "cell spec: coordinates (#{x},#{y}) with dirs #{ds}"
      
      @cells[[x,y]] = [x,y,ds,w]
      ws = w.split(/\s/)
      @weight[[x,y]] = ws

      #ws.each {|w| puts "  weight #{w}"}

    end
  end
end




#-----------------------------------------------------------
# the following is a parser that reads in a simpler version
# of the maze files.  Use it to get started writing the rest
# of the assignment.  You can feel free to move or modify 
# this function however you like in working on your assignment.

def read_and_print_simple_file(file)
  line = file.gets
  if line == nil then return end

  # read 1st line, must be maze header
  sz, sx, sy, ex, ey = line.split(/\s/)
  puts "header spec: size=#{sz}, start=(#{sx},#{sy}), end=(#{ex},#{ey})"
 

  # read additional lines
  while line = file.gets do

    # begins with "path", must be path specification
    if line[0...4] == "path"
      p, name, x, y, ds = line.split(/\s/)
      puts "path spec: #{name} starts at (#{x},#{y}) with dirs #{ds}"
  

    # otherwise must be cell specification (since maze spec must be valid)
    else
      x, y, ds, w = line.split(/\s/,4)
      puts "cell spec: coordinates (#{x},#{y}) with dirs #{ds}"
      ws = w.split(/\s/)

      ws.each {|w| puts "  weight #{w}"}


    end
  end
end

#-----------------------------------------------------------
# EXECUTABLE CODE
#-----------------------------------------------------------

#----------------------------------
# check # of command line arguments

if ARGV.length < 2
  fail "usage: maze.rb <command> <filename>" 
end

command = ARGV[0]
file = ARGV[1]
maze_file = open(file)
store(maze_file)
maze_file = open(file)


#---------------------------------
# perform command

case command
when "parse"
  parse(maze_file)
when "print1"
  read_and_print_simple_file(maze_file)
when "open"
  opener(maze_file)
when "sortcells"
  sortcells(maze_file)
when "bridge"
  bridge(maze_file)
when "paths"
  path(maze_file)
when "print"
  printmaze(maze_file)
when "distance"
  distance(maze_file)
when "solve"
  solve(maze_file)

else
  fail "Invalid command"
end

end




















