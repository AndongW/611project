# Directory Cleaning

PHONY: clean

clean:
			  rm data/*
			  rm figures/*
			  
# Data Preprocessing

data/album_rate.csv: \
				rate_data_prep.R \
				source_data/albums/album_ratings.csv 
				Rscript rate_data_prep.R

data/album_rev.csv: \
				rev_data_prep.R \
				source_data/albums/album_reviews/train.csv \
				source_data/albums/album_reviews/test.csv 
				Rscript rev_data_prep.R

data/album.csv: \
				data_merge.R \
				data/album_rate.csv \
				data/album_rev.csv 
				Rscript data_merge.R

# Figures Generation

figures/criticuser.png figures/poprock.png: \
				critic_user.R \
				data/album.csv 
				Rscript critic_user.R

figures/popyear.png figures/rockyear.png figures/popheat.png figures/rockheat.png: \
				year.R \
				data/album.csv 
				Rscript year.R
				
# Report Generation
report.html: \
				report.Rmd \
				figures/criticuser.png \
				figures/poprock.png \
				figures/popyear.png \
				figures/rockyear.png \
				figures/popheat.png \
				figures/rockheat.png
				Rscript report.Rmd
