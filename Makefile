default:
	@echo " "
	@echo "==> Removing old images..."
	rm -Rf images

	@echo " "
	@echo "==> Extracting new emoji..."
	ruby emoji_extractor.rb

	@echo " "
	@echo "==> Updating PREVIEW.md..."
	touch PREVIEW.md
	find ./images/64x64 -maxdepth 1 -type f -iname \*.png | sort --version-sort | xargs -I {} bash -c 'ff=$$(basename -- "{}"); echo -n "<img src=\"./images/64x64/$$ff\" alt=\"$$(echo $$ff | cut -f 1 -d '.')\" height=\"32\"> " >> PREVIEW.md'
