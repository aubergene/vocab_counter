require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "VocabCounter" do

  before :each do
    @v = VocabCounter.new
  end

  it "should count the number of terms in a string" do
    @v.count("The cat sat on the mat")
    @v.report.should include("the,2")
    @v.report.should include("cat,1")
  end

  it "should ignore case when counting terms" do
    @v.count("The the THE tHe CAT sat on the mat")
    @v.report.should include("the,5")
    @v.report.should include("cat,1")
  end

  it "should ignore an non ['a-z0-9] characters when counting terms" do
    @v.count("The %cat$ sat-on, the mat. Brian's cat. The cat?s sat on, the mat! ")
    @v.report.should include("the,4")
    @v.report.should include("cat,3")
    @v.report.should include("brian's,1")
  end

  it "should only include apostrophes which appear within a word" do
    @v.count("Brian's Brian Brian' Brian's cat's cats cat' cats'")
    @v.report.should include("brian's,2")
    @v.report.should include("brian,2")
    @v.report.should include("cat,1")
    @v.report.should include("cats,1")
  end

end

