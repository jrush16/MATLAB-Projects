% Author: Joshua Rush
% Date: 30 July, 2018
%
% This program simulates a game consisting of nine LEDs. The goal of the
% game is to get all the LEDs to be red. Pressing a button causes the above
% LED and adjacent LEDs to change state. The three buttons at the bottom
% select the starting pattern.
% Features: Three Starting Patterns

classdef LightsOut < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure  matlab.ui.Figure
        light1    matlab.ui.control.Lamp
        light2    matlab.ui.control.Lamp
        light3    matlab.ui.control.Lamp
        light4    matlab.ui.control.Lamp
        light5    matlab.ui.control.Lamp
        light6    matlab.ui.control.Lamp
        light7    matlab.ui.control.Lamp
        light8    matlab.ui.control.Lamp
        light9    matlab.ui.control.Lamp
        button1   matlab.ui.control.Button
        button2   matlab.ui.control.Button
        button3   matlab.ui.control.Button
        button4   matlab.ui.control.Button
        button5   matlab.ui.control.Button
        button6   matlab.ui.control.Button
        button7   matlab.ui.control.Button
        button8   matlab.ui.control.Button
        button9   matlab.ui.control.Button
        pattern1  matlab.ui.control.Button
        pattern2  matlab.ui.control.Button
        pattern3  matlab.ui.control.Button
    end

    methods (Access = private)
    
        % Called when the '1', '2', or '3' button is pushed. This function
        % enables the buttons controlling the LEDs and disables the pattern
        % selection buttons.
        function gameStart(app)
            app.button1.Enable = 'on';
            app.button2.Enable = 'on';
            app.button3.Enable = 'on';
            app.button4.Enable = 'on';
            app.button5.Enable = 'on';
            app.button6.Enable = 'on';
            app.button7.Enable = 'on';
            app.button8.Enable = 'on';
            app.button9.Enable = 'on';
            app.pattern1.Enable = 'off';
            app.pattern2.Enable = 'off';
            app.pattern3.Enable = 'off';
        end
        
        % Called when all LEDs are red. This function disables the buttons
        % controlling the LEDs and enables the pattern buttons allowing the
        % user to start a new game with a new pattern.
        function win(app)
            app.button1.Enable = 'off';
            app.button2.Enable = 'off';
            app.button3.Enable = 'off';
            app.button4.Enable = 'off';
            app.button5.Enable = 'off';
            app.button6.Enable = 'off';
            app.button7.Enable = 'off';
            app.button8.Enable = 'off';
            app.button9.Enable = 'off';
            app.pattern1.Enable = 'on';
            app.pattern2.Enable = 'on';
            app.pattern3.Enable = 'on';
        end
    
    end


    methods (Access = private)

        % Called when the first LED controlling button is pushed. This
        % function toggles LEDs 1 and 2.
        function button1ButtonPushed(app, ~)
            if(isequal(app.light1.Color,[0 1 0]))
                app.light1.Color = 'r';
            else
                app.light1.Color = 'g';
            end
            if(isequal(app.light2.Color,[0 1 0]))
                app.light2.Color = 'r';
            else
                app.light2.Color = 'g';
            end
            if(isequal(app.light1.Color,app.light2.Color,app.light3.Color,app.light4.Color,app.light5.Color,app.light6.Color,app.light7.Color,app.light8.Color,app.light9.Color,[1 0 0]))
                win(app);
            end
        end

        % Called when the second LED controlling button is pushed. This
        % function toggles LEDs 1, 2, and 3.
        function button2ButtonPushed(app, ~)
            if(isequal(app.light1.Color,[0 1 0]))
                app.light1.Color = 'r';
            else
                app.light1.Color = 'g';
            end
            if(isequal(app.light2.Color,[0 1 0]))
                app.light2.Color = 'r';
            else
                app.light2.Color = 'g';
            end
            if(isequal(app.light3.Color,[0 1 0]))
                app.light3.Color = 'r';
            else
                app.light3.Color = 'g';
            end
            if(isequal(app.light1.Color,app.light2.Color,app.light3.Color,app.light4.Color,app.light5.Color,app.light6.Color,app.light7.Color,app.light8.Color,app.light9.Color,[1 0 0]))
                win(app);
            end
        end

        % Called when the third LED controlling button is pushed. This
        % function toggles LEDs 2, 3, and 4.
        function button3ButtonPushed(app, ~)
            if(isequal(app.light2.Color,[0 1 0]))
                app.light2.Color = 'r';
            else
                app.light2.Color = 'g';
            end
            if(isequal(app.light3.Color,[0 1 0]))
                app.light3.Color = 'r';
            else
                app.light3.Color = 'g';
            end
            if(isequal(app.light4.Color,[0 1 0]))
                app.light4.Color = 'r';
            else
                app.light4.Color = 'g';
            end
            if(isequal(app.light1.Color,app.light2.Color,app.light3.Color,app.light4.Color,app.light5.Color,app.light6.Color,app.light7.Color,app.light8.Color,app.light9.Color,[1 0 0]))
                win(app);
            end
        end

        % Called when the fourth LED controlling button is pushed. This
        % function toggles LEDs 3, 4, and 5.
        function button4ButtonPushed(app, ~)
            if(isequal(app.light3.Color,[0 1 0]))
                app.light3.Color = 'r';
            else
                app.light3.Color = 'g';
            end
            if(isequal(app.light4.Color,[0 1 0]))
                app.light4.Color = 'r';
            else
                app.light4.Color = 'g';
            end
            if(isequal(app.light5.Color,[0 1 0]))
                app.light5.Color = 'r';
            else
                app.light5.Color = 'g';
            end
            if(isequal(app.light1.Color,app.light2.Color,app.light3.Color,app.light4.Color,app.light5.Color,app.light6.Color,app.light7.Color,app.light8.Color,app.light9.Color,[1 0 0]))
                win(app);
            end
        end

        % Called when the fifth LED controlling button is pushed. This
        % function toggles LEDs 4, 5, and 6.
        function button5ButtonPushed(app, ~)
            if(isequal(app.light4.Color,[0 1 0]))
                app.light4.Color = 'r';
            else
                app.light4.Color = 'g';
            end
            if(isequal(app.light5.Color,[0 1 0]))
                app.light5.Color = 'r';
            else
                app.light5.Color = 'g';
            end
            if(isequal(app.light6.Color,[0 1 0]))
                app.light6.Color = 'r';
            else
                app.light6.Color = 'g';
            end
            if(isequal(app.light1.Color,app.light2.Color,app.light3.Color,app.light4.Color,app.light5.Color,app.light6.Color,app.light7.Color,app.light8.Color,app.light9.Color,[1 0 0]))
                win(app);
            end
        end

        % Called when the sixth LED controlling button is pushed. This
        % function toggles LEDs 5, 6, and 7.
        function button6ButtonPushed(app, ~)
            if(isequal(app.light5.Color,[0 1 0]))
                app.light5.Color = 'r';
            else
                app.light5.Color = 'g';
            end
            if(isequal(app.light6.Color,[0 1 0]))
                app.light6.Color = 'r';
            else
                app.light6.Color = 'g';
            end
            if(isequal(app.light7.Color,[0 1 0]))
                app.light7.Color = 'r';
            else
                app.light7.Color = 'g';
            end
            if(isequal(app.light1.Color,app.light2.Color,app.light3.Color,app.light4.Color,app.light5.Color,app.light6.Color,app.light7.Color,app.light8.Color,app.light9.Color,[1 0 0]))
                win(app);
            end
        end

        % Called when the seventh LED controlling button is pushed. This
        % function toggles LEDs 6, 7, and 8.
        function button7ButtonPushed(app, ~)
            if(isequal(app.light6.Color,[0 1 0]))
                app.light6.Color = 'r';
            else
                app.light6.Color = 'g';
            end
            if(isequal(app.light7.Color,[0 1 0]))
                app.light7.Color = 'r';
            else
                app.light7.Color = 'g';
            end
            if(isequal(app.light8.Color,[0 1 0]))
                app.light8.Color = 'r';
            else
                app.light8.Color = 'g';
            end
            if(isequal(app.light1.Color,app.light2.Color,app.light3.Color,app.light4.Color,app.light5.Color,app.light6.Color,app.light7.Color,app.light8.Color,app.light9.Color,[1 0 0]))
                win(app);
            end
        end

        % Called when the eighth LED controlling button is pushed. This
        % function toggles LEDs 7, 8, and 9.
        function button8ButtonPushed(app, ~)
            if(isequal(app.light7.Color,[0 1 0]))
                app.light7.Color = 'r';
            else
                app.light7.Color = 'g';
            end
            if(isequal(app.light8.Color,[0 1 0]))
                app.light8.Color = 'r';
            else
                app.light8.Color = 'g';
            end
            if(isequal(app.light9.Color,[0 1 0]))
                app.light9.Color = 'r';
            else
                app.light9.Color = 'g';
            end
            if(isequal(app.light1.Color,app.light2.Color,app.light3.Color,app.light4.Color,app.light5.Color,app.light6.Color,app.light7.Color,app.light8.Color,app.light9.Color,[1 0 0]))
                win(app);
            end
        end

        % Called when the ninth LED controlling button is pushed. This
        % function toggles LEDs 8 and 9.
        function button9ButtonPushed(app, ~)
            if(isequal(app.light8.Color,[0 1 0]))
                app.light8.Color = 'r';
            else
                app.light8.Color = 'g';
            end
            if(isequal(app.light9.Color,[0 1 0]))
                app.light9.Color = 'r';
            else
                app.light9.Color = 'g';
            end
            if(isequal(app.light1.Color,app.light2.Color,app.light3.Color,app.light4.Color,app.light5.Color,app.light6.Color,app.light7.Color,app.light8.Color,app.light9.Color,[1 0 0]))
                win(app);
            end
        end

        % Called when the '1' button is pushed. This function starts the
        % game with pattern 1.
        function pattern1ButtonPushed(app, ~)
            app.light1.Color = 'g';
            app.light2.Color = 'g';
            app.light3.Color = 'g';
            app.light4.Color = 'g';
            gameStart(app);
        end

        % Called when the '2' button is pushed. This function starts the
        % game with pattern 2.
        function pattern2ButtonPushed(app, ~)
            app.light1.Color = 'g';
            app.light2.Color = 'g';
            app.light5.Color = 'g';
            app.light6.Color = 'g';
            app.light9.Color = 'g';
            gameStart(app);
        end

        % Called when the '3' button is pushed. This function starts the
        % game with pattern 3.
        function pattern3ButtonPushed(app, ~)
            app.light1.Color = 'g';
            app.light4.Color = 'g';
            app.light5.Color = 'g';
            app.light7.Color = 'g';
            app.light9.Color = 'g';
            gameStart(app);
        end
        
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 300 158];
            app.UIFigure.Name = 'Lights Out';

            % Create light1
            app.light1 = uilamp(app.UIFigure);
            app.light1.Position = [12 125 20 20];
            app.light1.Color = 'r';

            % Create light2
            app.light2 = uilamp(app.UIFigure);
            app.light2.Position = [44 125 20 20];
            app.light2.Color = 'r';

            % Create light3
            app.light3 = uilamp(app.UIFigure);
            app.light3.Position = [76 125 20 20];
            app.light3.Color = 'r';

            % Create light4
            app.light4 = uilamp(app.UIFigure);
            app.light4.Position = [108 125 20 20];
            app.light4.Color = 'r';

            % Create light5
            app.light5 = uilamp(app.UIFigure);
            app.light5.Position = [140 125 20 20];
            app.light5.Color = 'r';

            % Create light6
            app.light6 = uilamp(app.UIFigure);
            app.light6.Position = [172 125 20 20];
            app.light6.Color = 'r';

            % Create light7
            app.light7 = uilamp(app.UIFigure);
            app.light7.Position = [204 125 20 20];
            app.light7.Color = 'r';

            % Create light8
            app.light8 = uilamp(app.UIFigure);
            app.light8.Position = [236 125 20 20];
            app.light8.Color = 'r';

            % Create light9
            app.light9 = uilamp(app.UIFigure);
            app.light9.Position = [268 125 20 20];
            app.light9.Color = 'r';

            % Create button1
            app.button1 = uibutton(app.UIFigure, 'push');
            app.button1.ButtonPushedFcn = createCallbackFcn(app, @button1ButtonPushed, true);
            app.button1.BackgroundColor = [0.9608 0.9608 0.9608];
            app.button1.Enable = 'off';
            app.button1.Position = [12 84 20 20];
            app.button1.Text = '';

            % Create button2
            app.button2 = uibutton(app.UIFigure, 'push');
            app.button2.ButtonPushedFcn = createCallbackFcn(app, @button2ButtonPushed, true);
            app.button2.Enable = 'off';
            app.button2.Position = [44 84 20 20];
            app.button2.Text = '';

            % Create button3
            app.button3 = uibutton(app.UIFigure, 'push');
            app.button3.ButtonPushedFcn = createCallbackFcn(app, @button3ButtonPushed, true);
            app.button3.Enable = 'off';
            app.button3.Position = [76 84 20 20];
            app.button3.Text = '';

            % Create button4
            app.button4 = uibutton(app.UIFigure, 'push');
            app.button4.ButtonPushedFcn = createCallbackFcn(app, @button4ButtonPushed, true);
            app.button4.Enable = 'off';
            app.button4.Position = [108 84 20 20];
            app.button4.Text = '';

            % Create button5
            app.button5 = uibutton(app.UIFigure, 'push');
            app.button5.ButtonPushedFcn = createCallbackFcn(app, @button5ButtonPushed, true);
            app.button5.Enable = 'off';
            app.button5.Position = [140 84 20 20];
            app.button5.Text = '';

            % Create button6
            app.button6 = uibutton(app.UIFigure, 'push');
            app.button6.ButtonPushedFcn = createCallbackFcn(app, @button6ButtonPushed, true);
            app.button6.Enable = 'off';
            app.button6.Position = [172 84 20 20];
            app.button6.Text = '';

            % Create button7
            app.button7 = uibutton(app.UIFigure, 'push');
            app.button7.ButtonPushedFcn = createCallbackFcn(app, @button7ButtonPushed, true);
            app.button7.Enable = 'off';
            app.button7.Position = [204 84 20 20];
            app.button7.Text = '';

            % Create button8
            app.button8 = uibutton(app.UIFigure, 'push');
            app.button8.ButtonPushedFcn = createCallbackFcn(app, @button8ButtonPushed, true);
            app.button8.Enable = 'off';
            app.button8.Position = [236 84 20 20];
            app.button8.Text = '';

            % Create button9
            app.button9 = uibutton(app.UIFigure, 'push');
            app.button9.ButtonPushedFcn = createCallbackFcn(app, @button9ButtonPushed, true);
            app.button9.Enable = 'off';
            app.button9.Position = [268 84 20 20];
            app.button9.Text = '';

            % Create pattern1
            app.pattern1 = uibutton(app.UIFigure, 'push');
            app.pattern1.ButtonPushedFcn = createCallbackFcn(app, @pattern1ButtonPushed, true);
            app.pattern1.FontSize = 16;
            app.pattern1.FontWeight = 'bold';
            app.pattern1.Position = [32 18 44 41];
            app.pattern1.Text = '1';

            % Create pattern2
            app.pattern2 = uibutton(app.UIFigure, 'push');
            app.pattern2.ButtonPushedFcn = createCallbackFcn(app, @pattern2ButtonPushed, true);
            app.pattern2.FontSize = 16;
            app.pattern2.FontWeight = 'bold';
            app.pattern2.Position = [128 18 44 41];
            app.pattern2.Text = '2';

            % Create pattern3
            app.pattern3 = uibutton(app.UIFigure, 'push');
            app.pattern3.ButtonPushedFcn = createCallbackFcn(app, @pattern3ButtonPushed, true);
            app.pattern3.FontSize = 16;
            app.pattern3.FontWeight = 'bold';
            app.pattern3.Position = [224 18 44 41];
            app.pattern3.Text = '3';
        end
        
    end

    methods (Access = public)

        % Construct app
        function app = LightsOut
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