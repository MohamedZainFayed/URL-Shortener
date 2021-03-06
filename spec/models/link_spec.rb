require 'rails_helper'

RSpec.describe Link, type: :model do
  subject { Link.new(url: "https://www.google.com") }
  
  it 'URL should not be null' do
    subject.url = nil
    expect(subject).not_to be_valid
  end

  it 'Should contain a Slug after validation' do
    expect(subject).to be_valid
    expect(subject.slug).not_to be_nil
    expect(subject.slug).not_to be_empty
  end
  
  it 'URL should be unique' do
    link_with_same_url = Link.new(url: "https://www.facebook.com")
    link_with_same_url.save
    subject.url = link_with_same_url.url
    expect(subject).not_to be_valid
  end

  it 'Slug should be unique' do
    link_with_same_slug = Link.new(url: "https://www.facebook.com")
    link_with_same_slug.save
    subject.slug = link_with_same_slug.slug
    expect(subject).not_to be_valid
  end

  it 'URL Length shoud not exceed 255 characters' do
    subject.url = "A" * 256
    expect(subject).not_to be_valid
  end

  it 'Slug Length shoud not exceed 255 characters' do
    subject.slug = "A" * 256
    expect(subject).not_to be_valid
  end

  it 'Same URLs with different prefix -http, https, www.- should have same slug' do
    urls = [
      "https://google.com",
      "http://google.com",
      "https://www.google.com",
      "www.google.com",
      "google.com"
    ]
    links = []
    urls.each do |url|
      link = Link.init(url: url)
      link.save
      links << link
    end
    first_slug = links.first.slug
    links.each do |link|
      expect(link.slug).to eq(first_slug)
    end
  end
end
