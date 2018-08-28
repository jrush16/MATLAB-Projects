% Author: Joshua Rush
% Date: 30 July, 2018
%
% This program solves user input expressions.
% Features: Support For Any Expression Solvable by eval Function.

classdef ExpressionCalculator < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                  matlab.ui.Figure
        expressionLabel           matlab.ui.control.Label
        expression                matlab.ui.control.EditField
        answerLabel               matlab.ui.control.Label
        answer                    matlab.ui.control.EditField
        equals                    matlab.ui.control.Button
    end

    methods (Access = private)

        % Called when the '=' button is pushed. This function evaluates the
        % expression and outputs the answer. If the expression cannot be
        % evaulated, an error message is displayed.
        function equalsPushed(app, ~)
            try
                app.answer.Value = string(eval(app.expression.Value));
            catch
                app.answer.Value = 'Syntax Error';
            end
        end
        
    end
    
    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 241 148];
            app.UIFigure.Name = 'Expression Calculator';

            % Create expressionLabel
            app.expressionLabel = uilabel(app.UIFigure);
            app.expressionLabel.HorizontalAlignment = 'right';
            app.expressionLabel.FontSize = 16;
            app.expressionLabel.FontWeight = 'bold';
            app.expressionLabel.Position = [12 108 92 22];
            app.expressionLabel.Text = 'Expression';

            % Create expression
            app.expression = uieditfield(app.UIFigure, 'text');
            app.expression.FontSize = 16;
            app.expression.FontWeight = 'bold';
            app.expression.Position = [119 107 100 23];

            % Create answerLabel
            app.answerLabel = uilabel(app.UIFigure);
            app.answerLabel.HorizontalAlignment = 'right';
            app.answerLabel.FontSize = 16;
            app.answerLabel.FontWeight = 'bold';
            app.answerLabel.Position = [41 21 63 22];
            app.answerLabel.Text = 'Answer';

            % Create answer
            app.answer = uieditfield(app.UIFigure, 'text');
            app.answer.Editable = 'off';
            app.answer.FontSize = 16;
            app.answer.FontWeight = 'bold';
            app.answer.Position = [119 20 100 23];

            % Create equals
            app.equals = uibutton(app.UIFigure, 'push');
            app.equals.ButtonPushedFcn = createCallbackFcn(app, @equalsPushed, true);
            app.equals.FontSize = 16;
            app.equals.FontWeight = 'bold';
            app.equals.Position = [154 58 30 30];
            app.equals.Text = '=';
        end
        
    end

    methods (Access = public)

        % Construct app
        function app = ExpressionCalculator
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