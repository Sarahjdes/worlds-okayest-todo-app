# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/todos'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /todos' do
    context 'with valid input parameters' do
      it 'creates a new todo' do
        todo_count = Todo.count

        post '/todos', params: { todo: { title: 'Another new TODO', content: 'Some other content' } }

        expect(Todo.count).to eq(todo_count + 1)
        expect(response).to redirect_to(todo_path(Todo.last))
        expect(response).to have_http_status(:found)
      end
    end

    context 'with invalid input parameters' do
      it 'does not create a' do
        todo_count = Todo.count

        post '/todos', params: { todo: { title: '' } }

        expect(Todo.count).to eq(todo_count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /todos/:id' do
    let!(:todo) { Todo.create!(title: 'Initial title', content: 'Initial content') }

    context 'with valid input parameters' do
      it 'updates todo with new data' do
        patch "/todos/#{todo.id}", params: { todo: { title: 'Updated title', content: 'Updated content' } }

        todo.reload

        expect(todo.title).to eq('Updated title')
        expect(todo.content).to eq('Updated content')
        expect(response).to redirect_to(todo_path(todo))
        expect(response).to have_http_status(:found)
      end
    end

    context 'with invalid input parameters' do
      it 'does not update todo' do
        patch "/todos/#{todo.id}", params: { todo: { title: '' } }

        expect(response).to have_http_status(:unprocessable_entity)

        todo.reload

        expect(todo.title).to eq('Initial title')
        expect(todo.content).to eq('Initial content')
      end
    end

    # Controller validation
    # Since the payload is not valid, it will return a :bad_request even before there is an ActiveModel validation
    # context 'with invalid payload' do
    #   it 'has a bad_request status' do
    #     patch "/todos/#{todo.id}", params: {}

    #     expect(response).to have_http_status(:bad_request)
    #   end
    # end
  end

  describe 'DELETE /todos/:id' do
    let!(:todo) { Todo.create!(title: 'To be deleted', content: 'To be deleted') }

    it 'deletes the todo' do
      todo_count = Todo.count

      delete "/todos/#{todo.id}"

      expect(Todo.count).to eq(todo_count - 1)
      expect(response).to have_http_status(:see_other)
    end
  end
end
