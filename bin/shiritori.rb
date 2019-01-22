#!/usr/bin/env ruby

$:.unshift File.expand_path("../lib", __dir__)
require "shiritori"

japanese_nouns_as_katakana = Shiritori.japanese_nouns.map {|string| Shiritori.to_katakana(string) }

puts "I'll let you start. What's your first word?"
loop do
  word = Shiritori.to_katakana(gets.chomp)
  array = { 'ぁ' => 'あ',
          'ぃ' => 'い',
          'ぅ' => 'う',
          'ぇ' => 'え',
          'ぉ' => 'お',
          'っ' => 'つ',
          'ゃ' => 'や',
          'ゅ' => 'ゆ',
          'ょ' => 'よ',
          'ゎ' => 'わ',
          'ァ' => 'ア',
          'ィ' => 'イ',
          'ゥ' => 'ウ',
          'ェ' => 'エ',
          'ォ' => 'オ',
          'ヵ' => 'カ',
          'ヶ' => 'ケ',
          'ッ' => 'ツ',
          'ャ' => 'ヤ',
          'ュ' => 'ユ',
          'ョ' => 'ヨ',
          'ヮ' => 'ワ',
      }
  if japanese_nouns_as_katakana.include?(word)
    if word.end_with?("ー")
      word = word.slice!(-2)
      word = array.select{|k,v| k.match(word)}.values[0]
    else
      word = word.slice!(-1)
    end
    answer_list = []
    japanese_nouns_as_katakana.each do |a|
      answer_list << a if a.start_with?(word)
    end
    puts enemy_answer = answer_list.sample
    if enemy_answer.end_with?("ん") || enemy_answer.end_with?("ン")
      puts "That doesn't count! You lose."
      exit
    end
  else
    puts "That doesn't count! You lose."
    exit
  end
end
