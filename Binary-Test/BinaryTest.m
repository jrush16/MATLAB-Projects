% Author: Joshua Rush
% Date: 25 July, 2018
%
% This program allows a user to test their binary->decimal conversion
% skills.
% Features: Random Binary Number Generator, Field to Track Correct Guesses

classdef BinaryTest < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        correctLabel           matlab.ui.control.Label
        lockIn                 matlab.ui.control.Button
        generate               matlab.ui.control.Button
        guess                  matlab.ui.control.EditField
        randomInt              matlab.ui.control.EditField
        correct                matlab.ui.control.NumericEditField
    end

    methods (Access = private)

        % Called when the 'GENERATE' button is pushed. This function
        % generates and displays a random binary number.
        function generatePushed(app, ~)
            app.randomInt.Value = dec2bin(randi(4095));
            app.generate.Enable = 'off'; % Locks the generate button after the game has started
        end

        % Called when the 'LOCK IN' button is pushed. This function
        % compares your guess to the binary number and determines whether
        % or not it is correct. If correct, another binary number will be
        % generated and your correct guesses will increase. If incorrect,
        % the game ends.
        function lockInButtonPushed(app, ~)
            try
                if(~isempty(app.guess.Value) && str2double(dec2bin(str2double(app.guess.Value))) == str2double(app.randomInt.Value))
                    app.correct.Value = app.correct.Value + 1;
                    app.randomInt.Value = dec2bin(randi(4095));
                else
                    app.guess.Value = 'Game Over';
                    app.guess.Enable = 'off';
                    app.lockIn.Enable = 'off';
                end
            catch
                app.guess.Value = 'Syntax Error';
            end
        end
        
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 400 250];
            app.UIFigure.Name = 'Binary Test';

            % Create generate
            app.generate = uibutton(app.UIFigure, 'push');
            app.generate.ButtonPushedFcn = createCallbackFcn(app, @generatePushed, true);
            app.generate.FontSize = 16;
            app.generate.FontWeight = 'bold';
            app.generate.Position = [30 200 100 26];
            app.generate.Text = 'GENERATE';

            % Create correctLabel
            app.correctLabel = uilabel(app.UIFigure);
            app.correctLabel.HorizontalAlignment = 'right';
            app.correctLabel.FontSize = 16;
            app.correctLabel.FontWeight = 'bold';
            app.correctLabel.Position = [74 59 62 22];
            app.correctLabel.Text = 'Correct';

            % Create correct
            app.correct = uieditfield(app.UIFigure, 'numeric');
            app.correct.Editable = 'off';
            app.correct.FontSize = 16;
            app.correct.FontWeight = 'bold';
            app.correct.Position = [144 59 116 22];

            % Create randomInt
            app.randomInt = uieditfield(app.UIFigure, 'text');
            app.randomInt.Editable = 'off';
            app.randomInt.FontSize = 16;
            app.randomInt.FontWeight = 'bold';
            app.randomInt.Position = [144 202 116 23];

            % Create guess
            app.guess = uieditfield(app.UIFigure, 'text');
            app.guess.FontSize = 16;
            app.guess.FontWeight = 'bold';
            app.guess.Position = [144 131 116 23];

            % Create lockIn
            app.lockIn = uibutton(app.UIFigure, 'push');
            app.lockIn.ButtonPushedFcn = createCallbackFcn(app, @lockInButtonPushed, true);
            app.lockIn.FontSize = 16;
            app.lockIn.FontWeight = 'bold';
            app.lockIn.Position = [270 129 100 26];
            app.lockIn.Text = 'LOCK IN';
        end
        
    end

    methods (Access = public)
        
        % Construct app
        function app = BinaryTest
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