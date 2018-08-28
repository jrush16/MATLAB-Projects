% Author: Joshua Rush
% Date: 18 July, 2018
%
% This program simulates a calculator.
% Features: Basic Arithmetic Operators, Natural Logarithm, Factorial, and
% Parentheses.

classdef Calculator < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure        matlab.ui.Figure
        one             matlab.ui.control.Button
        two             matlab.ui.control.Button
        six             matlab.ui.control.Button
        zero            matlab.ui.control.Button
        four            matlab.ui.control.Button
        five            matlab.ui.control.Button
        nine            matlab.ui.control.Button
        three           matlab.ui.control.Button
        seven           matlab.ui.control.Button
        eight           matlab.ui.control.Button
        equal           matlab.ui.control.Button
        clear           matlab.ui.control.Button
        decimal         matlab.ui.control.Button
        negative        matlab.ui.control.Button
        division        matlab.ui.control.Button
        addition        matlab.ui.control.Button
        exponent        matlab.ui.control.Button
        logarithm       matlab.ui.control.Button
        leftParen       matlab.ui.control.Button
        backspace       matlab.ui.control.Button
        rightParen      matlab.ui.control.Button
        subtraction     matlab.ui.control.Button
        multiplication  matlab.ui.control.Button
        factorialButton matlab.ui.control.Button
        answer          matlab.ui.control.EditField
    end

    methods (Access = private)
        
        % Called when the '0' button is pushed. This function adds a zero
        % to the end of the equation.
        function zeroButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'0');
        end
        
        % Called when the '1' button is pushed. This function adds a one
        % to the end of the equation.
        function oneButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'1');
        end

        % Called when the '2' button is pushed. This function adds a two
        % to the end of the equation.
        function twoButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'2');
        end

        % Called when the '3' button is pushed. This function adds a three
        % to the end of the equation.
        function threeButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'3');
        end

        % Called when the '4' button is pushed. This function adds a four
        % to the end of the equation.
        function fourButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'4');
        end

        % Called when the '5' button is pushed. This function adds a five
        % to the end of the equation.
        function fiveButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'5');
        end

        % Called when the '6' button is pushed. This function adds a six
        % to the end of the equation.
        function sixButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'6');
        end

        % Called when the '7' button is pushed. This function adds a seven
        % to the end of the equation.
        function sevenButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'7');
        end

        % Called when the '8' button is pushed. This function adds an eight
        % to the end of the equation.
        function eightButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'8');
        end

        % Called when the '9' button is pushed. This function adds a nine
        % to the end of the equation.
        function nineButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'9');
        end

        % Called when the '.' button is pushed. This function adds a
        % decimal to the end of the equation.
        function decimalButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'.');
        end

        % Called when the '-' button is pushed. This function adds a
        % negative sign to the end of the equation.
        function negativeButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'-');
        end
        
        % Called when the '/' button is pushed. This function adds a
        % division operator to the end of the equation.
        function divisionButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'/');
        end

        % Called when the '*' button is pushed. This function adds a
        % multiplication operator to the end of the equation.
        function multiplicationButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'*');
        end

        % Called when the '-' button is pushed. This function adds a
        % subtraction operator to the end of the equation.
        function subtractionButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'-');
        end

        % Called when the '+' button is pushed. This function adds an
        % addition operator to the end of the equation.
        function additionButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'+');
        end
        
        % Called when the '^' button is pushed. This function adds an
        % exponent operator to the end of the equation.
        function exponentButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'^');
        end

        % Called when the '<-' button is pushed. This function deletes the
        % last symbol of the equation.
        function backspaceButtonPushed(app, ~)
            app.answer.Value(end) = [];
        end
        
        % Called when the '!' button is pushed. This function adds a
        % factorial function call to the end of the equation.
        function factorialButtonButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'factorial(');
        end

        % Called when the 'ln' button is pushed. This function adds a log
        % function call to the end of the equation.
        function logarithmButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'log(');
        end

        % Called when the '(' button is pushed. This function adds an
        % opening parenthesis to the end of the equation.
        function leftParenButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,'(');
        end

        % Called when the ')' button is pushed. This function adds a
        % closing parenthesis to the end of the equation.
        function rightParenButtonPushed(app, ~)
            app.answer.Value = strcat(app.answer.Value,')');
        end

        % Called when the '=' button is pushed. This function evaluates the
        % expression and outputs the answer. If the expression cannot be
        % evaluated an error message is displayed.
        function equalButtonPushed(app, ~)
            try
                app.answer.Value = string(eval(app.answer.Value));
            catch
                app.answer.Value = 'Syntax Error';
            end
        end
        
        % Called when the 'C' button is pushed. This function clears the
        % expression field.
        function clearButtonPushed(app, ~)
            app.answer.Value = '';
        end
        
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)
            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 204 355];
            app.UIFigure.Name = 'Calculator';

            % Create zero
            app.zero = uibutton(app.UIFigure, 'push');
            app.zero.ButtonPushedFcn = createCallbackFcn(app, @zeroButtonPushed, true);
            app.zero.FontSize = 16;
            app.zero.FontWeight = 'bold';
            app.zero.Position = [53 6 50 50];
            app.zero.Text = '0';
            
            % Create one
            app.one = uibutton(app.UIFigure, 'push');
            app.one.ButtonPushedFcn = createCallbackFcn(app, @oneButtonPushed, true);
            app.one.FontSize = 16;
            app.one.FontWeight = 'bold';
            app.one.Position = [4 55 50 50];
            app.one.Text = '1';

            % Create two
            app.two = uibutton(app.UIFigure, 'push');
            app.two.ButtonPushedFcn = createCallbackFcn(app, @twoButtonPushed, true);
            app.two.FontSize = 16;
            app.two.FontWeight = 'bold';
            app.two.Position = [53 55 50 50];
            app.two.Text = '2';

            % Create three
            app.three = uibutton(app.UIFigure, 'push');
            app.three.ButtonPushedFcn = createCallbackFcn(app, @threeButtonPushed, true);
            app.three.FontSize = 16;
            app.three.FontWeight = 'bold';
            app.three.Position = [102 55 50 50];
            app.three.Text = '3';

            % Create four
            app.four = uibutton(app.UIFigure, 'push');
            app.four.ButtonPushedFcn = createCallbackFcn(app, @fourButtonPushed, true);
            app.four.FontSize = 16;
            app.four.FontWeight = 'bold';
            app.four.Position = [4 104 50 50];
            app.four.Text = '4';

            % Create five
            app.five = uibutton(app.UIFigure, 'push');
            app.five.ButtonPushedFcn = createCallbackFcn(app, @fiveButtonPushed, true);
            app.five.FontSize = 16;
            app.five.FontWeight = 'bold';
            app.five.Position = [53 104 50 50];
            app.five.Text = '5';

            % Create six
            app.six = uibutton(app.UIFigure, 'push');
            app.six.ButtonPushedFcn = createCallbackFcn(app, @sixButtonPushed, true);
            app.six.FontSize = 16;
            app.six.FontWeight = 'bold';
            app.six.Position = [102 104 50 50];
            app.six.Text = '6';

            % Create seven
            app.seven = uibutton(app.UIFigure, 'push');
            app.seven.ButtonPushedFcn = createCallbackFcn(app, @sevenButtonPushed, true);
            app.seven.FontSize = 16;
            app.seven.FontWeight = 'bold';
            app.seven.Position = [4 153 50 50];
            app.seven.Text = '7';

            % Create eight
            app.eight = uibutton(app.UIFigure, 'push');
            app.eight.ButtonPushedFcn = createCallbackFcn(app, @eightButtonPushed, true);
            app.eight.FontSize = 16;
            app.eight.FontWeight = 'bold';
            app.eight.Position = [53 153 50 50];
            app.eight.Text = '8';

            % Create nine
            app.nine = uibutton(app.UIFigure, 'push');
            app.nine.ButtonPushedFcn = createCallbackFcn(app, @nineButtonPushed, true);
            app.nine.FontSize = 16;
            app.nine.FontWeight = 'bold';
            app.nine.Position = [102 153 50 50];
            app.nine.Text = '9';

            % Create decimal
            app.decimal = uibutton(app.UIFigure, 'push');
            app.decimal.ButtonPushedFcn = createCallbackFcn(app, @decimalButtonPushed, true);
            app.decimal.FontSize = 16;
            app.decimal.FontWeight = 'bold';
            app.decimal.Position = [102 6 50 50];
            app.decimal.Text = '.';

            % Create negative
            app.negative = uibutton(app.UIFigure, 'push');
            app.negative.ButtonPushedFcn = createCallbackFcn(app, @negativeButtonPushed, true);
            app.negative.FontSize = 16;
            app.negative.FontWeight = 'bold';
            app.negative.Position = [4 6 50 50];
            app.negative.Text = '-';
            
            % Create division
            app.division = uibutton(app.UIFigure, 'push');
            app.division.ButtonPushedFcn = createCallbackFcn(app, @divisionButtonPushed, true);
            app.division.FontSize = 16;
            app.division.FontWeight = 'bold';
            app.division.Position = [151 202 50 50];
            app.division.Text = '/';

            % Create multiplication
            app.multiplication = uibutton(app.UIFigure, 'push');
            app.multiplication.ButtonPushedFcn = createCallbackFcn(app, @multiplicationButtonPushed, true);
            app.multiplication.FontSize = 16;
            app.multiplication.FontWeight = 'bold';
            app.multiplication.Position = [151 153 50 50];
            app.multiplication.Text = '*';

            % Create subtraction
            app.subtraction = uibutton(app.UIFigure, 'push');
            app.subtraction.ButtonPushedFcn = createCallbackFcn(app, @subtractionButtonPushed, true);
            app.subtraction.FontSize = 16;
            app.subtraction.FontWeight = 'bold';
            app.subtraction.Position = [151 104 50 50];
            app.subtraction.Text = '-';

            % Create addition
            app.addition = uibutton(app.UIFigure, 'push');
            app.addition.ButtonPushedFcn = createCallbackFcn(app, @additionButtonPushed, true);
            app.addition.FontSize = 16;
            app.addition.FontWeight = 'bold';
            app.addition.Position = [151 55 50 50];
            app.addition.Text = '+';
            
            % Create exponent
            app.exponent = uibutton(app.UIFigure, 'push');
            app.exponent.ButtonPushedFcn = createCallbackFcn(app, @exponentButtonPushed, true);
            app.exponent.FontSize = 16;
            app.exponent.FontWeight = 'bold';
            app.exponent.Position = [102 251 50 50];
            app.exponent.Text = '^';

            % Create backspace
            app.backspace = uibutton(app.UIFigure, 'push');
            app.backspace.ButtonPushedFcn = createCallbackFcn(app, @backspaceButtonPushed, true);
            app.backspace.FontSize = 16;
            app.backspace.FontWeight = 'bold';
            app.backspace.Position = [102 202 50 50];
            app.backspace.Text = '<-';

            % Create factorialButton
            app.factorialButton = uibutton(app.UIFigure, 'push');
            app.factorialButton.ButtonPushedFcn = createCallbackFcn(app, @factorialButtonButtonPushed, true);
            app.factorialButton.FontSize = 16;
            app.factorialButton.FontWeight = 'bold';
            app.factorialButton.Position = [4 202 50 50];
            app.factorialButton.Text = '!';

            % Create logarithm
            app.logarithm = uibutton(app.UIFigure, 'push');
            app.logarithm.ButtonPushedFcn = createCallbackFcn(app, @logarithmButtonPushed, true);
            app.logarithm.FontSize = 16;
            app.logarithm.FontWeight = 'bold';
            app.logarithm.Position = [151 251 50 50];
            app.logarithm.Text = 'ln';

            % Create leftParen
            app.leftParen = uibutton(app.UIFigure, 'push');
            app.leftParen.ButtonPushedFcn = createCallbackFcn(app, @leftParenButtonPushed, true);
            app.leftParen.FontSize = 16;
            app.leftParen.FontWeight = 'bold';
            app.leftParen.Position = [4 251 50 50];
            app.leftParen.Text = '(';

            % Create rightParen
            app.rightParen = uibutton(app.UIFigure, 'push');
            app.rightParen.ButtonPushedFcn = createCallbackFcn(app, @rightParenButtonPushed, true);
            app.rightParen.FontSize = 16;
            app.rightParen.FontWeight = 'bold';
            app.rightParen.Position = [53 251 50 50];
            app.rightParen.Text = ')';
            
            % Create equal
            app.equal = uibutton(app.UIFigure, 'push');
            app.equal.ButtonPushedFcn = createCallbackFcn(app, @equalButtonPushed, true);
            app.equal.FontSize = 16;
            app.equal.FontWeight = 'bold';
            app.equal.Position = [151 6 50 50];
            app.equal.Text = '=';
            
            % Create clear
            app.clear = uibutton(app.UIFigure, 'push');
            app.clear.ButtonPushedFcn = createCallbackFcn(app, @clearButtonPushed, true);
            app.clear.FontSize = 16;
            app.clear.FontWeight = 'bold';
            app.clear.Position = [53 202 50 50];
            app.clear.Text = 'C';

            % Create answer
            app.answer = uieditfield(app.UIFigure, 'text');
            app.answer.Editable = 'off';
            app.answer.HorizontalAlignment = 'right';
            app.answer.FontSize = 16;
            app.answer.FontWeight = 'bold';
            app.answer.Position = [4 301 197 50];
        end
        
    end

    methods (Access = public)

        % Construct app
        function app = Calculator
            % Create and configure components
            createComponents(app)

            % Register the app with App Denegativeer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)
            % backspace UIFigure when app is backspaced
            delete(app.UIFigure)
        end
        
    end
    
end