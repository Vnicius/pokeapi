
namespace :scraper do

    desc "Scrap the Pokémons from Bulbapedia"
    task pokemons: :environment do
        user_agent = Mechanize.new
        page = user_agent.get(Rails.configuration.start_url )

        page.search('//table/tr').each do |tr|
            td_list = tr.css('td').each.to_a
            pk = {}

            if td_list.length > 1 && td_list[1].css('a').text == ""
                pk[:ndex] = td_list[1].text.gsub("#","").strip
                pk[:name] = td_list[2].css("a").first['title'].include?("File") ? td_list[2].css("a").first.text.strip : td_list[2].css("a").first['title'].strip
                pk[:icon] = td_list[2].search('//a/img').first['src']
                pk[:type_1] = td_list[4].css("a span").first.text.strip
                pk[:type_2] = td_list.length > 5 ? td_list[5].css("a span").first.text.strip : ""
                                
                Pokemon.create(
                    pkdex_number: pk[:ndex],
                    name: pk[:name],
                    icon: pk[:icon],
                    type_1: pk[:type_1],
                    type_2: pk[:type_2]
                )
            end
        end
    end
end