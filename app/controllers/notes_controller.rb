class NotesController < ApplicationController
  before_filter :authenticate_user!
  require 'evernote_oauth'
  
  def new
    @note = Note.new
  end

  def create
  @note = Note.new(note_params)

  auth_token = "S=s1:U=8d910:E=14aa5c00ee7:C=1434e0ee2e9:P=1cd:A=en-devtoken:V=2:H=f1e3575f9b4a41562505846d4e8756be"
  client = EvernoteOAuth::Client.new(token: auth_token)
  note_store = client.note_store
  notebooks = note_store.listNotebooks
  note = Evernote::EDAM::Type::Note.new
  note.title = "first reading note"
  note.content = '<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd"><en-note>#{@note.content}<br/></en-note>'
  note_store.createNote(note)

    if @note.save
      render :new, :notice => "Udało się dodać notatkę"
    else
      render :new, :notice => "nie udało się dodać notatki"
    end
  end

private
  def note_params
    params.require(:note).permit(:content, :title)
  end
end