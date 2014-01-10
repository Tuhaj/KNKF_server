class NotesController < ApplicationController
  before_filter :authenticate_user!
  require 'evernote_oauth'

  def new
    @note = Note.new
  end

  def create()
    @note = Note.new(note_params)
    @reading = Reading.find(note_params[:reading_id])
    @note.reading = @reading

    if @note.save
      access_token = session[:access_token]
      unless access_token.nil?
        client = EvernoteOAuth::Client.new(token: access_token)
        create_note(client, @reading, @note)
        redirect_to @reading, :notice => "Udało się dodać notatkę"
      else
        client = EvernoteOAuth::Client.new
        session[:request_token] = request_token = client.request_token(:oauth_callback => oauth_callback_reading_note_url(@reading, @note))
        redirect_to request_token.authorize_url
      end
    else
      render :new, :notice => "nie udało się dodać notatki"
    end
  end

  def oauth_callback
    note = Note.find(params[:id]) 
    reading = Reading.find(params[:reading_id])

    access_token_object = session[:request_token].get_access_token(:oauth_verifier => params[:oauth_verifier])
    access_token_str    = access_token_object.token
    session[:access_token] = access_token_str
    
    client = EvernoteOAuth::Client.new(token: access_token_str)

    create_note(client, reading, note)

    redirect_to reading, :notice => "Udało się dodać notatkę"
  end

private
  def note_params
    params.require(:note).permit(:content, :title, :reading_id)
  end

  def create_note(client, reading, note)
    note_store = client.note_store
    notebooks = note_store.listNotebooks
    note_store.createNote create_api_note(note)
  end

  def create_api_note(note)
    api_note = Evernote::EDAM::Type::Note.new
    api_note.title = "#{note.title}"

    part1 = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd"><en-note>'
    part2 = '<br/></en-note>'

    api_note.content =  part1 + note.content + part2
    api_note
  end



end