% Author: Joshua Rush
% Date: 26 July, 2018
%
% This program simulates an email GUI.
% Features: Field For Receiver's Email Address, Subject Field, and File
% Attachments
%
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ IMPORTANT ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Before you can email anyone from MATLAB you need to run two commands
% #1: setpref('Internet','E_mail','my_email@example.com');
% #2: setpref('Internet','SMTP_Server','my_server.example.com');
% If you don't know your outgoing SMTP server's name, entering just 'mail'
% might work

classdef Mail < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        toLabel                matlab.ui.control.Label
        subjectLabel           matlab.ui.control.Label
        attachmentsFieldLabel  matlab.ui.control.Label
        send                   matlab.ui.control.Button
        attachments            matlab.ui.control.Button
        message                matlab.ui.control.TextArea
        to                     matlab.ui.control.EditField
        subject                matlab.ui.control.EditField
        attachmentsField       matlab.ui.control.EditField
    end

    methods (Access = private)

        % Called when the 'SEND' button is pushed. This function sends the
        % email with the subject line and attached files to the specified
        % email address. If any fields are filled out incorrectly an error
        % message will be displayed.
        function sendButtonPushed(app, ~)
            try
                sendmail(app.to.Value,app.subject.Value,app.message.Value,strsplit(app.attachmentsField.Value,','));
                msgbox('Message successfully sent','Message Successfully Sent');
            catch
                errordlg('Message could not be sent, check that all fields are correct and try again','Message Failed to Send');
            end
        end
        
        % Called when the '+' button is pushed. This function allows users
        % to add file attachments to the email.
        function attachmentsButtonPushed(app, ~)
            if(isempty(app.attachmentsField.Value))
                app.attachmentsField.Value = uigetfile('*.*');
            else
                app.attachmentsField.Value = strcat(app.attachmentsField.Value,',',uigetfile('*.*'));
            end
        end
        
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 672 492];
            app.UIFigure.Name = 'Mail';

            % Create message
            app.message = uitextarea(app.UIFigure);
            app.message.FontSize = 16;
            app.message.FontWeight = 'bold';
            app.message.Position = [11 15 651 354];

            % Create subjectLabel
            app.subjectLabel = uilabel(app.UIFigure);
            app.subjectLabel.HorizontalAlignment = 'right';
            app.subjectLabel.FontSize = 16;
            app.subjectLabel.FontWeight = 'bold';
            app.subjectLabel.Position = [10 379 63 22];
            app.subjectLabel.Text = 'Subject';

            % Create subject
            app.subject = uieditfield(app.UIFigure, 'text');
            app.subject.FontSize = 16;
            app.subject.FontWeight = 'bold';
            app.subject.Position = [85 379 565 23];

            % Create toLabel
            app.toLabel = uilabel(app.UIFigure);
            app.toLabel.HorizontalAlignment = 'right';
            app.toLabel.FontSize = 16;
            app.toLabel.FontWeight = 'bold';
            app.toLabel.Position = [48 410 25 22];
            app.toLabel.Text = 'To';

            % Create to
            app.to = uieditfield(app.UIFigure, 'text');
            app.to.FontSize = 16;
            app.to.FontWeight = 'bold';
            app.to.Position = [85 410 565 23];

            % Create send
            app.send = uibutton(app.UIFigure, 'push');
            app.send.ButtonPushedFcn = createCallbackFcn(app, @sendButtonPushed, true);
            app.send.FontSize = 16;
            app.send.FontWeight = 'bold';
            app.send.Position = [503 442 147 41];
            app.send.Text = 'SEND';
            
            % Create attachments
            app.attachments = uibutton(app.UIFigure, 'push');
            app.attachments.ButtonPushedFcn = createCallbackFcn(app, @attachmentsButtonPushed, true);
            app.attachments.FontSize = 16;
            app.attachments.FontWeight = 'bold';
            app.attachments.Position = [450 442 41 41];
            app.attachments.Text = '+';
            
            % Create attachmentsField
            app.attachmentsField = uieditfield(app.UIFigure, 'text');
            app.attachmentsField.FontSize = 16;
            app.attachmentsField.Editable = 'off';
            app.attachmentsField.FontWeight = 'bold';
            app.attachmentsField.Position = [85 441 360 23];
            
            % Create attachmentsFieldLabel
            app.attachmentsFieldLabel = uilabel(app.UIFigure);
            app.attachmentsFieldLabel.HorizontalAlignment = 'right';
            app.attachmentsFieldLabel.FontSize = 16;
            app.attachmentsFieldLabel.FontWeight = 'bold';
            app.attachmentsFieldLabel.Position = [25 441 50 22];
            app.attachmentsFieldLabel.Text = 'Files';
        end
        
    end

    methods (Access = public)

        % Construct app
        function app = Mail
            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)
            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
        
    end
    
end