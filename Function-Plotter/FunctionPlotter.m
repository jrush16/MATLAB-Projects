% Author: Joshua Rush
% Date: 26 July, 2018
%
% This program plots user given functions.
% Features: Support For Any Function Plottable by fplot Function.

classdef FunctionPlotter < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                matlab.ui.Figure
        functionFieldLabel      matlab.ui.control.Label
        plot                    matlab.ui.control.Button
        graph                   matlab.ui.control.UIAxes
        functionField           matlab.ui.control.EditField
    end

    methods (Access = private)

        % Called when the 'PLOT FUNCTION' button is pushed. This function
        % plots the user given function. If the function cannot be plotted
        % an error message is displayed.
        function plotPushed(app, ~)
            try
                fplot(app.graph,app.functionField.Value);
            catch
                app.functionField.Value = 'Syntax Error';
            end
        end
        
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 511 607];
            app.UIFigure.Name = 'Function Plotter';

            % Create plot
            app.plot = uibutton(app.UIFigure, 'push');
            app.plot.ButtonPushedFcn = createCallbackFcn(app, @plotPushed, true);
            app.plot.FontSize = 16;
            app.plot.FontWeight = 'bold';
            app.plot.Position = [363 564 140 35];
            app.plot.Text = 'PLOT';

            % Create functionFieldLabel
            app.functionFieldLabel = uilabel(app.UIFigure);
            app.functionFieldLabel.HorizontalAlignment = 'right';
            app.functionFieldLabel.FontSize = 16;
            app.functionFieldLabel.FontWeight = 'bold';
            app.functionFieldLabel.Position = [9 571 73 22];
            app.functionFieldLabel.Text = 'Function';

            % Create functionField
            app.functionField = uieditfield(app.UIFigure, 'text');
            app.functionField.FontSize = 16;
            app.functionField.FontWeight = 'bold';
            app.functionField.Position = [97 570 255 23];

            % Create graph
            app.graph = uiaxes(app.UIFigure);
            title(app.graph, 'Function Plotter')
            xlabel(app.graph, 'X')
            ylabel(app.graph, 'Y')
            app.graph.FontSize = 16;
            app.graph.FontWeight = 'bold';
            app.graph.Position = [9 1 486 552];
        end
        
    end

    methods (Access = public)

        % Construct app
        function app = FunctionPlotter
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