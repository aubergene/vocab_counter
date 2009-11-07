require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "VocabCounter" do

  it "should count the number of terms in a string" do
    out = VocabCounter.count("The cat sat on the mat")
    out.should include("the,2")
    out.should include("cat,1")
  end

  it "should ignore case when counting terms" do
    out = VocabCounter.count("The the THE tHe CAT sat on the mat")
    out.should include("the,5")
    out.should include("cat,1")
  end

  it "should ignore an non ['a-z0-9] characters when counting terms" do
    out = VocabCounter.count("The %cat$ sat-on, the mat. Brian's cat. The cat?s sat on, the mat! ")
    out.should include("the,4")
    out.should include("cat,3")
    out.should include("brian's,1")
  end

  it "should only include apostrophes which appear within a word" do
    out = VocabCounter.count("Brian's Brian Brian' Brian's cat's cats cat' cats'")
    out.should include("brian's,2")
    out.should include("brian,2")
    out.should include("cat,1")
    out.should include("cats,1")
  end

end

