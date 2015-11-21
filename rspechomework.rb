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


    context "#title?" do
        it "returns true of title string is present" do
            expect(article.title?).to eq(true)
        end
    end


    context "#body?" do
        it "returns true if string is present" do
            expect(article.body?).to eq(true)
        end
    end


    context "#authors_name_starts_with_q?" do
            it "returns false if authors_name_starts_with_q?" do
                expect(article.authors_name_starts_with_q).to eq(false)
        end
    end


    context "#string_empty?" do
            it "returns false if there is a string present" do
                expect(article.string_empty?("")).to eq(false)
        end
    end


    context "#article_as_html" do
        it "returns title, author, body as html"
            expect(article.article_as_html).to eq("<h1>Squishy</h1><h3>May-May</h3><p>blah blah blah blah</p>")
        end
    end


    context "#title_as_html" do
        it "returns title as html" do
            expect(article.title_as_html).to eq("<h1>Squishy</h1>")
        end
    end


    context "#author_as_html" do
        it "returns author as html" do
            expect(article.author_as_html).to eq("<b>May-May</b>")
        end
    end


    context "#body_as_html" do
        it "returns body as html" do
            expect(article.body_as_html).to eq("<p>blah blah blah blah</p>")
        end
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

    context "valid_amount?" do
        it "returns the valid amount" do
            expect(transaction.valid_amount?(transaction.amount)).to eq(true)
        end
    end

    context "valid_time?" do
        it "return true if the time is valid" do
            expect(transaction.valid_time(transaction.time(Time.now))).to eq(true)
        end
    end

    context "amount_to_currency" do
        it "changes the amount in currency" do
            expect(transaction.amount_to_currency).to eq(1000)
        end
    end


    context "pretty_time" do
        it "displays the time format" do
            expect(transaction.pretty_time).to eq(Time.now).strftime("%A, %d %b %Y %l:%M %p")
        end
    end

end