#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'
require 'pry'

names_11 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/Template:Singapore_Parliament_2006',
  xpath: '//table[contains(@class,"navbox-inner")]//td[contains(@class,"navbox-list")]//ul//li//a[not(@class="new")]/@title',
).reject { |n| n.end_with? 'Constituency' }

names_13 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/Template:Singapore_Parliament_2016',
  xpath: '//table[contains(@class,"navbox-inner")]//td[contains(@class,"navbox-list")]//ul//li//a[not(@class="new")]/@title',
).reject { |n| n.end_with? 'Constituency' }

names = (names_11 + names_13).uniq
binding.pry

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names })
warn EveryPolitician::Wikidata.notify_rebuilder

