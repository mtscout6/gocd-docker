USER := mtscout6
images = gocd-server gocd-agent gocd-agent-node

all: server

server:
	@cd server && docker build -t $(USER)/gocd-server .

agent:
	@cd agent && docker build -t $(USER)/gocd-agent .

node:
	@cd agent/node && docker build -t $(USER)/gocd-agent-node .

clean:
	@$(foreach image,$(images), docker rmi --force $(USER)/$(image);)

startserver:
	@docker run -d -P --name gocd-server mtscout6/gocd-server

startagent:
	@docker run -d --link gocd-server:server mtscout6/gocd-agent

.PHONY: all server agent node clean startserver startagent
