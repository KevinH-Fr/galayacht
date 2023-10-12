# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://galayacht.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #

    add '/home', :changefreq => 'weekly', :priority => 0.9
    add '/produits', :changefreq => 'weekly', :priority => 0.9

    add '/location-bateau-cannes', :changefreq => 'weekly', :priority => 0.9
    add '/louer-bateau-cannes', :changefreq => 'weekly', :priority => 0.9
    add '/location-bateau-mandelieu', :changefreq => 'weekly', :priority => 0.9
    add '/louer-bateau-mandelieu', :changefreq => 'weekly', :priority => 0.9
    add '/location-bateau-antibes', :changefreq => 'weekly', :priority => 0.9
    add '/louer-bateau-antibes', :changefreq => 'weekly', :priority => 0.9
    add '/evenement-nautique-cote-d-azur-cannes-antibes-mandelieu', :changefreq => 'weekly', :priority => 0.9
    add '/sejour-en-mer-cote-d-azur-cannes-antibes-mandelieu-', :changefreq => 'weekly', :priority => 0.9
    add '/journee-en-bateau-cote-d-azur-cannes-antibes-mandelieu-', :changefreq => 'weekly', :priority => 0.9


    # Add sign-in and sign-up URLs to the sitemap
    add '/demandes/new', :changefreq => 'weekly', :priority => 0.7, :lastmod => Time.now
    add '/espace_bailleur/index', :changefreq => 'weekly', :priority => 0.7, :lastmod => Time.now

    Produit.find_each do |produit|
      add produit_path(produit), 
        :lastmod => produit.updated_at,
        :changefreq => 'weekly',
        :priority => 0.7
    end
end
