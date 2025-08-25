FROM node:22-alpine AS development

RUN addgroup -g 1001 -S nodejs && \
    adduser -S users-service -u 1001 -G nodejs

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN chown -R users-service:nodejs /app

USER users-service

EXPOSE 3001

CMD ["npm", "run", "dev"]
