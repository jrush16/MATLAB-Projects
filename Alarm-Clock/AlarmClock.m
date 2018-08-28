% Author: Joshua Rush
% Date: 1 August, 2018
%
% This program simulates an alarm clock.
% Features: 24 Hour Clock, 5 Minute Snooze, Alarm Sound Selection

classdef AlarmClock < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure            matlab.ui.Figure
        timeLabel           matlab.ui.control.Label
        alarmSoundLabel     matlab.ui.control.Label
        set                 matlab.ui.control.Button
        off                 matlab.ui.control.Button
        snooze              matlab.ui.control.Button
        alarmSoundButton    matlab.ui.control.Button
        time                matlab.ui.control.EditField
        alarmSound          matlab.ui.control.EditField
    end
    
    properties (Access = private)
        Timer % Keeps track of when the alarm should go off
    end

    methods (Access = public)
    
        % Called when the alarm time is reached. This function enables the
        % snooze button and plays the alarm sound.
        function notify(app)
            pause('on');
            app.snooze.Enable = 'on';
            [y,Fs] = audioread(app.alarmSound.Value);
            sound(y,Fs);
        end
        
    end
    
    methods (Access = private)

        % Called when the 'SET' button is pushed. This function checks to
        % see that all neccessary values have been entered and, if so,
        % enables the alarm functionality. If any required fields have not
        % been specified it will display a corresponding error message.
        function setPushed(app, ~)
            if(regexp(app.time.Value,'\d{2}:\d{2}:\d{2}') == 1)
                if(~isempty(app.alarmSound.Value))
                    app.off.Enable = 'on';
                    app.set.Enable = 'off';
                    app.time.Editable = 'off';
                    app.Timer = timer;
                    app.Timer.TimerFcn = @(~,~)app.notify;
                    app.Timer.StartDelay = 86400 + round(((datenum(app.time.Value) - datenum(regexp(string(datetime('now')),'\d{2}:\d{2}:\d{2}','match'))) * 24 * 3600));
                    if(round(((datenum(app.time.Value) - datenum(regexp(string(datetime('now')),'\d{2}:\d{2}:\d{2}','match'))) * 24 * 3600)) > 0)
                        app.Timer.StartDelay = round((datenum(app.time.Value) - datenum(regexp(string(datetime('now')),'\d{2}:\d{2}:\d{2}','match'))) * 24 * 3600);
                    end
                    start(app.Timer);
                else
                    errordlg('Please select an alarm sound','No Alarm Sound Detected');
                end
            else
                errordlg('Time must be in the format, 23:59:59. Please try again','Wrong Time Format');
            end
        end

        % Called when the 'SNOOZE' button is pushed. This function disables
        % the alarm sound and sets the alarm to go off in five minutes.
        function snoozePushed(app, ~)
            clear sound;
            app.snooze.Enable = 'off';
            app.time.Value = regexp(string(datetime('now') + 1/24/12),'\d{2}:\d{2}:\d{2}','match');
            delete(app.Timer);
            app.Timer = timer;
            app.Timer.TimerFcn = @(~,~)app.notify;
            app.Timer.StartDelay = 86400 + round(((datenum(app.time.Value) - datenum(regexp(string(datetime('now')),'\d{2}:\d{2}:\d{2}','match'))) * 24 * 3600));
            if(round(((datenum(app.time.Value) - datenum(regexp(string(datetime('now')),'\d{2}:\d{2}:\d{2}','match'))) * 24 * 3600)) > 0)
                app.Timer.StartDelay = round(((datenum(app.time.Value) - datenum(regexp(string(datetime('now')),'\d{2}:\d{2}:\d{2}','match'))) * 24 * 3600));
            end
            start(app.Timer);
        end

        % Called when the 'OFF' button is pushed. This function disables
        % all alarm functionality and resets all fields to their default
        % values.
        function offPushed(app, ~)
            clear sound;
            stop(app.Timer);
            delete(app.Timer);
            app.set.Enable = 'on';
            app.off.Enable = 'off';
            app.time.Editable = 'on';
            app.snooze.Enable = 'off';
            app.time.Value = '12:00:00';
            app.alarmSound.Value = '';
        end
        
        % Called when the '+' button is pushed. This function allows the
        % user to specify what they want their alarm sound to be. If the
        % user selects a file that cannot be played, they are notified.
        function alarmSoundButtonPushed(app, ~)
            app.alarmSound.Value = uigetfile('*.*');
            [~,~,ext] = fileparts(app.alarmSound.Value);
            if(~isequal(ext,'.wav') && ~isequal(ext,'.ogg') && ~isequal(ext,'.flac') && ~isequal(ext,'.au') && ~isequal(ext,'.aiff') && ~isequal(ext,'.aif') && ~isequal(ext,'.aifc') && ~isequal(ext,'.mp3') && ~isequal(ext,'.mp4') && ~isequal(ext,'.m4a'))
                app.alarmSound.Value = '';
                errordlg('Alarm sound file must be audio file readable by audioread MATLAB function','Wrong File Type');
            end
        end
        
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 424 105];
            app.UIFigure.Name = 'Alarm Clock';

            % Create set
            app.set = uibutton(app.UIFigure, 'push');
            app.set.ButtonPushedFcn = createCallbackFcn(app, @setPushed, true);
            app.set.FontSize = 16;
            app.set.FontWeight = 'bold';
            app.set.Position = [17 17 100 26];
            app.set.Text = 'SET';
            
            % Create alarmSoundButton
            app.alarmSoundButton = uibutton(app.UIFigure, 'push');
            app.alarmSoundButton.ButtonPushedFcn = createCallbackFcn(app, @alarmSoundButtonPushed, true);
            app.alarmSoundButton.FontSize = 16;
            app.alarmSoundButton.FontWeight = 'bold';
            app.alarmSoundButton.Position = [376 17 26 26];
            app.alarmSoundButton.Text = '+';

            % Create timeLabel
            app.timeLabel = uilabel(app.UIFigure);
            app.timeLabel.HorizontalAlignment = 'right';
            app.timeLabel.FontSize = 16;
            app.timeLabel.FontWeight = 'bold';
            app.timeLabel.Position = [14 69 43 22];
            app.timeLabel.Text = 'Time';

            % Create time
            app.time = uieditfield(app.UIFigure, 'text');
            app.time.HorizontalAlignment = 'right';
            app.time.FontSize = 16;
            app.time.FontWeight = 'bold';
            app.time.Position = [72 68 100 23];
            app.time.Value = '12:00:00';
            
            % Create alarmSoundLabel
            app.alarmSoundLabel = uilabel(app.UIFigure);
            app.alarmSoundLabel.HorizontalAlignment = 'right';
            app.alarmSoundLabel.FontSize = 16;
            app.alarmSoundLabel.FontWeight = 'bold';
            app.alarmSoundLabel.Position = [187 69 100 22];
            app.alarmSoundLabel.Text = 'Alarm Sound';
            
            % Create alarmSound
            app.alarmSound = uieditfield(app.UIFigure, 'text');
            app.alarmSound.Editable = 'off';
            app.alarmSound.HorizontalAlignment = 'right';
            app.alarmSound.FontSize = 16;
            app.alarmSound.FontWeight = 'bold';
            app.alarmSound.Position = [302 68 100 23];
            app.alarmSound.Value = '';

            % Create snooze
            app.snooze = uibutton(app.UIFigure, 'push');
            app.snooze.ButtonPushedFcn = createCallbackFcn(app, @snoozePushed, true);
            app.snooze.FontSize = 16;
            app.snooze.FontWeight = 'bold';
            app.snooze.Enable = 'off';
            app.snooze.Position = [132 17 100 26];
            app.snooze.Text = 'SNOOZE';

            % Create off
            app.off = uibutton(app.UIFigure, 'push');
            app.off.ButtonPushedFcn = createCallbackFcn(app, @offPushed, true);
            app.off.FontSize = 16;
            app.off.FontWeight = 'bold';
            app.off.Enable = 'off';
            app.off.Position = [247 17 100 26];
            app.off.Text = 'OFF';
        end
        
    end

    methods (Access = public)

        % Construct app
        function app = AlarmClock
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
            % Stop and delete timer to make sure it doesn't keep running
            % after closing app
            try
                stop(app.Timer);
                delete(app.Timer);
            catch
                % Do nothing
            end
            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
        
    end
    
end