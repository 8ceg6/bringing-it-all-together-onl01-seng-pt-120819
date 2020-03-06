class Dog 
      attr_accessor :name, :breed, :id
      
<<<<<<< HEAD
  def initialize(id: nil, name:, breed:)
      @name = name 
      @breed = breed
      @id = id 
  end 
      
  def self.create_table
=======
    
     
      def initialize(id: nil, name:, breed:)
          @name = name 
          @breed = breed
          @id = id 
        
      end 
      
      def self.create_table
>>>>>>> 14e9b21b25678b8d59cac0274fdd93fb88896968
      sql = <<-SQL
         CREATE TABLE IF NOT EXISTS dogs (
         id INTEGER PRIMARY KEY,
         name TEXT,
         breed TEXT
         )
      SQL
      DB[:conn].execute(sql)
<<<<<<< HEAD
  end
   
  def self.drop_table
        sql = "DROP TABLE IF EXISTS dogs"
         DB[:conn].execute(sql)
  end 
   
  def save 
      sql = <<-SQL 
=======
   end
   
   def self.drop_table
        sql = "DROP TABLE IF EXISTS dogs"
         DB[:conn].execute(sql)
   end 
   
   def save 
      #   if self.id
      #   self.update
      # else
        sql = <<-SQL 
>>>>>>> 14e9b21b25678b8d59cac0274fdd93fb88896968
              INSERT INTO dogs (name, breed)
              VALUES (?, ?)
              SQL
        DB[:conn].execute(sql, self.name, self.breed)
<<<<<<< HEAD
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
      self
  end 
   
  def self.create(name:, breed:)
        dog = self.new(name: name, breed: breed)
        dog.save
        dog
  end 
   
  def self.new_from_db(row)
        id = row[0]
        name = row[1]
        breed = row[2]
      self.new(name: name, breed: breed, id: id)
  end 
     
  def self.find_by_id(id)
      sql = "SELECT * FROM dogs WHERE id = ?"
      
      DB[:conn].execute(sql, id).map do |row|
         self.new_from_db(row)
      end.first  
  end  
     
  def self.find_or_create_by(name:, breed:)
      dog = DB[:conn].execute("SELECT * FROM dogs WHERE name = ? AND breed = ?", name, breed)
         if !dog.empty?
         dog_info = dog[0]
         dog = Dog.new(id: dog_info[0], name:  dog_info[1], breed: dog_info[2])
         else
         dog = self.create(name: name, breed: breed)
      end
  end 
     
  def self.find_by_name(name)
      sql = "SELECT * FROM dogs WHERE name = ?"
        result = DB[:conn].execute(sql, name).collect do |row|
        self.new_from_db(row)
      end.first
  end 
  
  def update
      sql =<<-SQL 
            UPDATE dogs 
            SET name = ?, breed =?
            WHERE id = ? 
            SQL
      DB[:conn].execute(sql, self.name, self.breed, self.id)
  end 
=======
        @id = DB[:conn].execute("SELECT last_insert_rowid()
              FROM dogs")[0][0]
      # end 
      self
   end 
   
   def self.create(name:, breed:)
        dog = self.new(name: name, breed: breed)
        dog.save
        dog
   end 
   
   def self.new_from_db(row)
        
   end 
     
>>>>>>> 14e9b21b25678b8d59cac0274fdd93fb88896968
end 








