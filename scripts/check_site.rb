# Validate the generated site, including language pairs and every local asset/link.
require 'nokogiri'
require 'uri'
require 'pathname'

root = Pathname.new(File.expand_path('../dist', __dir__))
errors = []
check = ->(condition, message) { errors << message unless condition }
sections = ['', 'publications/', 'talks/', 'notes/']
sections.each do |section|
  {'en' => ['', '/zh/'], 'zh-CN' => ['zh/', '/']}.each do |lang, (prefix, alternate_prefix)|
    path = root.join(prefix, section, 'index.html')
    check.call(path.file?, "Missing page: #{path}")
    next unless path.file?
    doc = Nokogiri::HTML(path.read)
    check.call(doc.at_css('html')['lang'] == lang, "Wrong HTML language: #{path}")
    check.call(doc.at_css('title').text.include?('JinghaoJin'), "Missing site title: #{path}")
    check.call(doc.at_css('.language-switch')['href'] == alternate_prefix + section, "Wrong language counterpart: #{path}")
    check.call(doc.css('.personal-links a[aria-current="page"]').size == 1, "Navigation has no unique active page: #{path}")
    check.call(doc.at_css('main h1'), "Missing main heading: #{path}")
    check.call(doc.at_css('link[rel="canonical"]')['href'].end_with?("/#{prefix}#{section}"), "Wrong canonical URL: #{path}")
    if section.empty? || section == 'publications/'
      check.call(doc.css('.publication-entry').size == 1, "Expected one verified publication: #{path}")
      check.call(doc.at_css('.publication-authors strong')&.text&.gsub(/\s+/, ' ')&.strip == 'Jing-Hao Jin', "Author identity not highlighted: #{path}")
      check.call(doc.at_css('details.citation code')&.text&.include?('@article{Zhang:2026gqp'), "Missing BibTeX: #{path}")
      check.call(doc.at_css('script#MathJax-script'), "Missing mathematical typesetting: #{path}")
      if lang == 'zh-CN'
        check.call(doc.at_css('.publication-status')&.text&.include?('JHEP'), "Verified journal missing: #{path}")
      end
    end
  end
end

Dir.glob(root.join('**/*.html')).each do |file|
  doc = Nokogiri::HTML(File.read(file))
  check.call(!doc.text.match?(/Albert Einstein|You R\. Name|555 your office|金京浩|Your City/), "Upstream or unconfirmed identity remains: #{file}")
  doc.css('a[href], img[src], script[src], link[href]').each do |node|
    value = node['href'] || node['src']
    next if value.nil? || value.empty? || value.start_with?('#', '//') || value.match?(/\A[a-z][a-z0-9+.-]*:/i)
    path = URI::DEFAULT_PARSER.unescape(value.split(/[?#]/).first.to_s)
    next if path.empty?
    target = path.start_with?('/') ? root.join(path.delete_prefix('/')) : Pathname.new(file).dirname.join(path)
    target = target.join('index.html') if target.directory?
    check.call(target.file?, "Broken local reference #{value} in #{file}")
  end
end
abort errors.join("\n") unless errors.empty?
puts 'PASS: 8 bilingual pages; paired language links; navigation; verified publication; BibTeX; math assets; all local references.'
