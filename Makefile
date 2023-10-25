PHONY: clean

clean:
			  rm data/*
			  rm figures/*

data/album_rate.csv data/album_rev.csv: prep.R source_data/albums/album_ratings.csv source_data/albums/album_reviews/train.csv source_data/albums/album_reviews/test.csv
				Rscript prep.R

figures/rate_barplot.png figures/rev_barplot.png: make_plots.R data/album_rate.csv data/album_rev.csv
				Rscript make_plots.R