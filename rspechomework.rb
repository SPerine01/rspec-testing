require "article.rb"
require "transaction.rb"
RSpec.configure do |rspec|
    rspec.color = true
end

# Article testing

describe Article do
    # present article
    let(:article){ Article.new(title: "Squishy", body: "blah blah blah blah", author: "May-May") }
    
    # test for empty article
    let(:empty_article) { Article.new(title: "", body: "", author: "") }


    it "returns true of title string is present" do
            expect(article.title?).to eq(true)
    end


    it "returns true if string is present" do
        expect(article.body?).to eq(true)
    end


    it "returns false if authors_name_starts_with_q?" do
        expect(article.authors_name_starts_with_q).to eq(false)
    end


    it "returns title, author, body as html"
        expect(article.article_as_html).to eq("<h1>Squishy</h1><h3>May-May</h3><p>blah blah blah blah</p>")
    end


    it "returns title as html" do
        expect(article.title_as_html).to eq("<h1>Squishy</h1>")
    end


    it "returns author as html" do
        expect(article.author_as_html).to eq("<b>May-May</b>")
    end


    it "returns body as html" do
        expect(article.body_as_html).to eq("<p>blah blah blah blah</p>")
    end



# Transaction testing

describe Transaction do
  let(:transaction) { Transaction.new(credit_account: 1200, debit_account: 8000, amount: 1000, time: Time.now) }

    context "valid number" do
        it "returns true if credit has valid_account_number" do
            expect(transaction.valid_account_number?(transaction.credit_account)).to eq(true)
        end

        it "returns true if debit has valid_account_number" do
            expect(transaction.valid_account_number?(transaction.credit_account)).to eq(true)
        end
    end

    # context "valid_amount?" do
        it " return valid_amount?" do
            expect(transaction.valid_amount?(transaction.amount)).to eq(true)
        end

    # context "valid_time?" do
        it "return true if valid_time?" do
            expect(transaction.valid_time(transaction.time(Time.now))).to eq(true)
        end

    # context "amount_to_currency" do
        it "amount_to_currency" do
            expect(transaction.amount_to_currency).to eq(1000)
        end


        it "pretty_time" do
            expect(transaction.pretty_time).to eq(Time.now).strftime("%A, %d %b %Y %l:%M %p")
        end

end