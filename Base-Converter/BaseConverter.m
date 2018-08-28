% Author: Joshua Rush
% Date: 25 July, 2018
%
% This program acts as a base conversion calculator.
% Features: Supports bases 2-36

classdef BaseConverter < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        inputLabel             matlab.ui.control.Label
        inBaseLabel            matlab.ui.control.Label
        outputLabel            matlab.ui.control.Label
        outBaseLabel           matlab.ui.control.Label
        ConvertButton          matlab.ui.control.Button
        input                  matlab.ui.control.EditField
        output                 matlab.ui.control.EditField
        inBase                 matlab.ui.control.NumericEditField
        outBase                matlab.ui.control.NumericEditField
    end

    methods (Access = private)

        % Called when the 'CONVERT' button is pushed. This function
        % converts the input, with its given base, into the given output
        % base. If the user requests a base not in the supported range an
        % error message is displayed.
        function ConvertButtonPushed(app, ~)
            try
                app.output.Value = string(base2dec(app.input.Value,app.inBase.Value));
                app.output.Value = string(dec2base(str2double(app.output.Value),app.outBase.Value));
            catch
                app.output.Value = 'Syntax Error';
            end
        end
        
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 218 287];
            app.UIFigure.Name = 'Base Converter';

            % Create inputLabel
            app.inputLabel = uilabel(app.UIFigure);
            app.inputLabel.HorizontalAlignment = 'right';
            app.inputLabel.FontSize = 16;
            app.inputLabel.FontWeight = 'bold';
            app.inputLabel.Position = [34 245 45 22];
            app.inputLabel.Text = 'input';

            % Create input
            app.input = uieditfield(app.UIFigure, 'text');
            app.input.HorizontalAlignment = 'right';
            app.input.FontSize = 16;
            app.input.FontWeight = 'bold';
            app.input.Position = [94 245 110 22];

            % Create inBaseLabel
            app.inBaseLabel = uilabel(app.UIFigure);
            app.inBaseLabel.HorizontalAlignment = 'right';
            app.inBaseLabel.FontSize = 16;
            app.inBaseLabel.FontWeight = 'bold';
            app.inBaseLabel.Position = [21 195 58 22];
            app.inBaseLabel.Text = 'inBase';

            % Create inBase
            app.inBase = uieditfield(app.UIFigure, 'numeric');
            app.inBase.FontSize = 16;
            app.inBase.FontWeight = 'bold';
            app.inBase.Position = [94 195 110 22];

            % Create outBaseLabel
            app.outBaseLabel = uilabel(app.UIFigure);
            app.outBaseLabel.HorizontalAlignment = 'right';
            app.outBaseLabel.FontSize = 16;
            app.outBaseLabel.FontWeight = 'bold';
            app.outBaseLabel.Position = [10 142 69 22];
            app.outBaseLabel.Text = 'outBase';

            % Create outBase
            app.outBase = uieditfield(app.UIFigure, 'numeric');
            app.outBase.FontSize = 16;
            app.outBase.FontWeight = 'bold';
            app.outBase.Position = [94 142 110 22];

            % Create outputLabel
            app.outputLabel = uilabel(app.UIFigure);
            app.outputLabel.HorizontalAlignment = 'right';
            app.outputLabel.FontSize = 16;
            app.outputLabel.FontWeight = 'bold';
            app.outputLabel.Position = [24 36 55 22];
            app.outputLabel.Text = 'output';

            % Create output
            app.output = uieditfield(app.UIFigure, 'text');
            app.output.Editable = 'off';
            app.output.HorizontalAlignment = 'right';
            app.output.FontSize = 16;
            app.output.FontWeight = 'bold';
            app.output.Position = [94 36 110 22];

            % Create ConvertButton
            app.ConvertButton = uibutton(app.UIFigure, 'push');
            app.ConvertButton.ButtonPushedFcn = createCallbackFcn(app, @ConvertButtonPushed, true);
            app.ConvertButton.FontSize = 16;
            app.ConvertButton.FontWeight = 'bold';
            app.ConvertButton.Position = [94 83 110 26];
            app.ConvertButton.Text = 'CONVERT';
        end
        
    end

    methods (Access = public)

        % Construct app
        function app = BaseConverter
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