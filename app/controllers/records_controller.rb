class RecordsController < ApplicationController
  # GET /records
  # GET /records.json
  def show
    @user = User.find(params[:id])
    @records = Record.select("id,book_id,due_date").where(user_id: @user.id)
  end

  def destroy
    record = Record.find(params[:id])
    book = Book.find(record.book_id)
    book.update(count: (book.count+=1))
    record.delete
    redirect_to show_record_path(record.user_id)
  end

  # GET /records/1
  # GET /records/1.json

  # GET /records/new
  def new
    @record = Record.new
    @user = User.find(params[:id])
    @books = Book.all
    @temp = []
    @books.each do |book|
      @temp << [book.title, book.id]
    end
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @errors
    @record = Record.new(record_params)
    book = Book.find(@record.book_id)
    if not_owned(book, @record.user_id)
      if book.count > 0
        if book.records.create(user_id: @record.user_id, due_date: Date.today.next_month)
          book.update(count: (book.count-=1))
          redirect_to show_record_path(@record.user_id)
        else
          redirect_to new_record_path(@record.user_id)
        end
      else
        @errors = "No more copies of this book is available"
        redirect_to new_record_path(@record.user_id)
      end
    else
      @errors = "User already took a copy of this book"
      redirect_to new_record_path(@record.user_id)
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:user_id, :book_id, :due_date)
    end

    def not_owned(book, id)
      temp = Record.select("book_id").where(user_id: id)
      books = Book.select("id").where(id: temp)
      not books.include?(book)
    end
end
