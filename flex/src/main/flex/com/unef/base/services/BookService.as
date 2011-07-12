package com.unef.base.services {
import mx.controls.Alert;
import model.Book;
    import mx.collections.ArrayCollection;
    import mx.rpc.events.ResultEvent;
    import model.BookSearchRequest;
    import com.unef.base.services.RemoteService;

    /**
     * Remote object to the book manager for obtaining and storing books
     */
    public class BookService extends RemoteService {
        [Bindable]
        public var filteredBooks:ArrayCollection = new ArrayCollection();

        /**
         * Constructor
         */
        public function BookService() {
            super("bookService", "bookManager");
        }

        /**
         * Asks for a lit of books based on the provided filter.
         * @param bookSearchRequest : BookSearchRequest
         * @return void
         */
        public function obtainFilteredBooks(bookSearchRequest:BookSearchRequest):void {
            remoteObject.obtainFilteredBooks.addEventListener(ResultEvent.RESULT, handleFilteredBooks);
            remoteObject.obtainFilteredBooks(bookSearchRequest);
        }

        /**
         * Stores the provided book using the remote service
         * @param book : Book
         * @return void
         */
        public function storeBook(book:Book):void {
            remoteObject.storeBook.addEventListener(ResultEvent.RESULT, handleStoredBook);
            remoteObject.storeBook(book);
        }

        private function handleFilteredBooks(event:ResultEvent):void {
            filteredBooks = event.result as ArrayCollection;
        }

        private function handleStoredBook(event:ResultEvent):void {
            Alert.show("A book is stored ..");
        }
    }
}
