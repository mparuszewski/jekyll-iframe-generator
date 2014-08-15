require 'spec_helper'

describe Jekyll::IFrameGenerator do
  
  it 'should inherit Jekyll::Generator' do
    expect(described_class.ancestors).to include(Jekyll::Generator)
  end

  describe '#generate' do

    let(:site) { OpenStruct.new(posts: posts, pages: pages) }

    let(:old_pages) do
      [
        OpenStruct.new(data: { 'layout' => 'default-0' }, template: 'page-0' ),
        OpenStruct.new(data: { 'layout' => 'default-1' }, template: 'page-1' )
      ]
    end

    let(:old_posts) do
      [
        OpenStruct.new(data: { 'layout' => 'default-0' }, template: 'post-0' ),
        OpenStruct.new(data: { 'layout' => 'default-1' }, template: 'post-1' )
      ]
    end

    let(:pages) { [].concat old_pages }
    let(:posts) { [].concat old_posts }

    subject { described_class.new }

    it 'should double posts amount' do
      subject.generate(site)
      expect(posts.size).to eq 4
    end

    it 'should double pages amount' do
      subject.generate(site)
      expect(pages.size).to eq 4
    end

    it 'each iframed post should have type: iframe and changed layout and subdir' do
      subject.generate(site)
      (posts - old_posts).each_with_index do |post, index|
        expect(post.data['type']).to eq 'iframe'
        expect(post.data['layout']).to eq "default-#{index}-iframe"
        expect(page.data['subdir']).to eq '/iframe'
        expect(post.template).to eq "/iframe/post-#{index}"
      end
    end

    it 'each iframed page should have type: iframe and changed layout and subdir' do
      subject.generate(site)
      (pages - old_pages).each_with_index do |page, index|
        expect(page.data['type']).to eq 'iframe'
        expect(page.data['layout']).to eq "default-#{index}-iframe"
        expect(page.data['subdir']).to eq '/iframe'
        expect(page.template).to eq "/iframe/page-#{index}"
      end
    end

    it 'each existing post should have type: standard and all properties unchanged' do
      subject.generate(site)
      old_posts.each_with_index do |post, index|
        expect(post.data['type']).to eq 'standard'
        expect(post.data['layout']).to eq "default-#{index}"
        expect(post.template).to eq "post-#{index}"
      end
    end

    it 'each existing page should have type: standard and all properties unchanged' do
      subject.generate(site)
      old_pages.each_with_index do |page, index|
        expect(page.data['type']).to eq 'standard'
        expect(page.data['layout']).to eq "default-#{index}"
        expect(page.template).to eq "page-#{index}"
      end
    end

  end
end
