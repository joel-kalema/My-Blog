require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author: User.new(name: 'Wale', posts_counter: 0), title: 'Work in progress') }
  before { subject.save }

  test_str = "ybisscougiqwfcw7ioubmgcoihkbshpjphsdhplksbjgdugubvhsdvdcygkbjopjpbjh
        ihijldchiubvajstfhjdscoi[k;jhuksdclkn,j hoil nvhuldp0ipkoiyuidsf6usfopjpguiguvhjvkhss
        cjpcudchidiogougjduigddkudcijbjcknkln;cjiildcj,bdbcygukvhvdcudgoiucjbsdvcyfsye5fgkjdc
        nlkohkldviodhvln.dcidhoinkldnvihdiohvilndknvidhidkdlnviodhcoindck.n.kdcokjbskxjbkjbax
        lnalxnknlnsclnllllllllllllllllaknxjlabxkblboihlnklnnklnlkanxjbagyxgjmxghvcchxgcghavxjgv
        bkxkhbaxgiuuga axnghvhjavxkjbmam xjhbkjxhbkjhvxxjgvjvkabxlnkjbaxhvavwukbbsckjsbcjbscbbkjsb
        kubkbbsaxkjksgkvsxkuhsolxb,jslkxhlsbkjhulkhskkx,bsxjgixysx lksj;cjpohgcaxvkaxakxjjbakjxbhjvjaxh
        khvksxjhhkgkskhklsxsxiugsucouugosxkslxnjbkbaxgch ajxgakvkhsbksixuusgxisxhhvsxsxygsixgsx
        kuubkscjnkscschvsciuscibsckjsbksvjsbksbsvcsvgvhgcaxbakxbkjaxhbbajvjaxhvigisxvgsjusgusx
        jgjgvgjsxkjnskxksglsliihslsxlihsxysisjxjhgsjxhbsjxvghscxhgsxhsxgchsxusgxugusxysxusuxyyggs
        kukusxgugsxguihgisxyfsysxhgchassxvjsxsjvjsxxsiuisxsjkkxiusxsufusxsuxygyusxyfsutxsxvjsxj
        ygisxxiuhsgxiusxyfsuxsxvsxugksclisscouscgusf8duwd98td7[owdp9wd90ywiwfysisyfikbsciysaascsutasaclsacyuf"

  context 'validation tests' do
    it 'title should not be blank' do
      subject.title = nil
      subject.comments_counter = 0
      subject.likes_counter = 0
      expect(subject).to_not be_valid
    end
    it 'title should not exceed 250 characters' do
      subject.title = test_str
      subject.comments_counter = 0
      subject.likes_counter = 0
      expect(subject).to_not be_valid
    end

    it 'comment_counter should be an integer and greater than or equal to zero' do
      subject.likes_counter = 0
      expect(subject).to_not be_valid
    end

    it 'like_counter should be an integer and greater than or equal to zero' do
      subject.comments_counter = 0
      expect(subject).to_not be_valid
    end
  end

  context 'model methods tests' do
    user1 = User.new(name: 'taiwo', posts_counter: 0)
    user1.save
    Post.create(author: user1, title: 'hello', likes_counter: 0, comments_counter: 0)
    Post.create(author: user1, title: 'what you doing', likes_counter: 0, comments_counter: 0)
    Post.create(author: user1, title: 'amazing post', likes_counter: 0, comments_counter: 0)
    post4 = Post.create(author: user1, title: 'Hahahaha', likes_counter: 0, comments_counter: 0)
    post4.update_post_count

    it 'should return the updated post count' do
      expect(user1.posts_counter).to eq 4
    end
  end
  Post.destroy_all
  User.destroy_all
end