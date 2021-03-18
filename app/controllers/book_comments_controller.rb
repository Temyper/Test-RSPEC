class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_params)
    @book_comment.book_id = @book.id
    @book_comment.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @book_comment.destroy
    # redirect_to book_path(params[:book_id])
    # redirect_back(fallback_location: root_path)
  end

  private

  def book_params
    params.require(:book_comment).permit(:comment)
  end
end
