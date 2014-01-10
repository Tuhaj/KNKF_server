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

 #     auth_token = "S=s1:U=8d910:E=14aa5c00ee7:C=1434e0ee2e9:P=1cd:A=en-devtoken:V=2:H=f1e3575f9b4a41562505846d4e8756be"
      client = EvernoteOAuth::Client.new
      session[:request_token] = request_token = client.request_token(:oauth_callback => oauth_callback_reading_note_url(@reading, @note))
      url = request_token.authorize_url
      
      
      redirect_to url

      # token = access_token.token
      
      # note_store = client.note_store
      # notebooks = note_store.listNotebooks
      # note = Evernote::EDAM::Type::Note.new
      # note.title = "#{@note.title}"
      # part1 = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd"><en-note>'
      # part2 = '<br/></en-note>'
      # note.content =  part1 + @note.content + part2
      # note_store.createNote(note)

      # redirect_to @reading, :notice => "Udało się dodać notatkę"
    else
      render :new, :notice => "nie udało się dodać notatki"
    end
  end

  def oauth_callback
    @note = Note.find(params[:id]) 
    @reading = Reading.find(params[:reading_id])
    access_token = session[:request_token].get_access_token(:oauth_verifier => params[:oauth_verifier])
    
    client = EvernoteOAuth::Client.new(token: access_token.token)

      note_store = client.note_store
      notebooks = note_store.listNotebooks
      
      note = Evernote::EDAM::Type::Note.new
      note.title = "#{@note.title}"
      part1 = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd"><en-note>'
      part2 = '<br/></en-note>'
      note.content =  part1 + @note.content + part2
      note_store.createNote(note)


    redirect_to @reading, :notice => "Udało się dodać notatkę"
  end

private
  def note_params
    params.require(:note).permit(:content, :title, :reading_id)
  end



end