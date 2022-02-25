help: ## ヘルプをプリント
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

pull: ## Dockerイメージをプル
	docker pull mcr.microsoft.com/playwright:focal

bash: ## Bashを起動
	docker run -it --rm -w /work -v ${PWD}:/work --ipc=host mcr.microsoft.com/playwright:focal bash

test: ## テストを実行
	docker run -it --rm -w /work -v ${PWD}:/work --ipc=host mcr.microsoft.com/playwright:focal yarn test
