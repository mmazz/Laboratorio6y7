% Copyright (c) 2015, Sebastian Cuenca,Armando Arevalo, Wilmer Guaño.
% All rights reserved.
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>

function varargout = ROBOTICA_INDUSTRIAL(varargin)
% ROBOTICA_INDUSTRIAL MATLAB code for TICA_INDUSTRIAL.fig
%      ROBOTICA_INDUSTRIAL, by itself, creates a new ROBOTICA_INDUSTRIAL or raises the existing
%      singleton*.
%
%      H = ROBOTICA_INDUSTRIAL returns the handle to a new ROBOTICA_INDUSTRIAL or the handle to
%      the existing singleton*.
%
%      ROBOTICA_INDUSTRIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOTICA_INDUSTRIAL.M with the given input arguments.
%
%      ROBOTICA_INDUSTRIAL('Property','Value',...) creates a new ROBOTICA_INDUSTRIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ROBOTICA_INDUSTRIAL_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ROBOTICA_INDUSTRIAL_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ROBOTICA_INDUSTRIAL

% Last Modified by GUIDE v2.5 22-Jun-2016 13:29:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ROBOTICA_INDUSTRIAL_OpeningFcn, ...
                   'gui_OutputFcn',  @ROBOTICA_INDUSTRIAL_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ROBOTICA_INDUSTRIAL is made visible.
function ROBOTICA_INDUSTRIAL_OpeningFcn(hObject, eventdata, handles, varargin)


% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ROBOTICA_INDUSTRIAL (see VARARGIN)
axes(handles.axes3)

imagen=imread('descarga.jpg');
imagesc(imagen);
axis off     

axes(handles.axes4)
imagen=imread('image_preview.gif');
imshow(imagen);
axis off     

axes(handles.axes6)
imagen=imread('logo.png');
imshow(imagen);
axis off  

set(handles.Q1,'Max',180);
set(handles.Q1,'Min',-180);
set(handles.Q2,'Max',180);
set(handles.Q2,'Min',-180);
set(handles.Q3,'Max',180);
set(handles.Q3,'Min',-180);
set(handles.Q4,'Max',180);
set(handles.Q4,'Min',-180);
set(handles.Q5,'Max',180);
set(handles.Q5,'Min',-180);
set(handles.Q6,'Max',180);
set(handles.Q6,'Min',-180);

set(handles.valq6,'String',0);
set(handles.valq5,'String',0);
set(handles.valq4,'String',0);
set(handles.valq3,'String',0);
set(handles.valq2,'String',0);
set(handles.valq1,'String',0);


set(handles.t1,'String',0);
set(handles.t2,'String',0);
set(handles.t3,'String',0);
set(handles.t4,'String',0);
set(handles.t5,'String',0);
set(handles.t6,'String',0);

set(handles.d1,'String',0);
set(handles.d2,'String',0);
set(handles.d3,'String',0);
set(handles.d4,'String',0);
set(handles.d5,'String',0);
set(handles.d6,'String',0);

set(handles.a1,'String',0);
set(handles.a2,'String',0);
set(handles.a3,'String',0);
set(handles.a4,'String',0);
set(handles.a5,'String',0);
set(handles.a6,'String',0);

set(handles.af1,'String',0);
set(handles.af2,'String',0);
set(handles.af3,'String',0);
set(handles.af4,'String',0);
set(handles.af5,'String',0);
set(handles.af6,'String',0);
% Choose default command line output for ROBOTICA_INDUSTRIAL
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ROBOTICA_INDUSTRIAL wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ROBOTICA_INDUSTRIAL_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


     



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cla(handles.axes8,'reset')



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d=questdlg('¿Desea salir del programa?','SALIR','Si','No','No');
if strcmp(d,'No')
return;
end
close ROBOTICA_INDUSTRIAL;

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
   


% --- Executes during object creation, after setting all properties.

% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tablas;


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ll1_Callback(hObject, eventdata, handles)
% hObject    handle to ll1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ll1 as text
%        str2double(get(hObject,'String')) returns contents of ll1 as a double


% --- Executes during object creation, after setting all properties.
function ll1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ll1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ll3_Callback(hObject, eventdata, handles)
% hObject    handle to ll3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ll3 as text
%        str2double(get(hObject,'String')) returns contents of ll3 as a double


% --- Executes during object creation, after setting all properties.
function ll3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ll3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end








% --- Executes during object creation, after setting all properties.
function axes8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes8


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valor=get(hObject,'Value');
axes(handles.axes8);
az = valor;
el = 22;
view(az, el);
set(handles.val,'string',az);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3



function t1_Callback(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t1 as text
%        str2double(get(hObject,'String')) returns contents of t1 as a double


% --- Executes during object creation, after setting all properties.
function t1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t2_Callback(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t2 as text
%        str2double(get(hObject,'String')) returns contents of t2 as a double


% --- Executes during object creation, after setting all properties.
function t2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t3_Callback(hObject, eventdata, handles)
% hObject    handle to t3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t3 as text
%        str2double(get(hObject,'String')) returns contents of t3 as a double


% --- Executes during object creation, after setting all properties.
function t3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t4_Callback(hObject, eventdata, handles)
% hObject    handle to t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t4 as text
%        str2double(get(hObject,'String')) returns contents of t4 as a double


% --- Executes during object creation, after setting all properties.
function t4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d1_Callback(hObject, eventdata, handles)
% hObject    handle to d1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d1 as text
%        str2double(get(hObject,'String')) returns contents of d1 as a double


% --- Executes during object creation, after setting all properties.
function d1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d2_Callback(hObject, eventdata, handles)
% hObject    handle to d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d2 as text
%        str2double(get(hObject,'String')) returns contents of d2 as a double


% --- Executes during object creation, after setting all properties.
function d2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d3_Callback(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d3 as text
%        str2double(get(hObject,'String')) returns contents of d3 as a double


% --- Executes during object creation, after setting all properties.
function d3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d4_Callback(hObject, eventdata, handles)
% hObject    handle to d4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d4 as text
%        str2double(get(hObject,'String')) returns contents of d4 as a double


% --- Executes during object creation, after setting all properties.
function d4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a1_Callback(hObject, eventdata, handles)
% hObject    handle to a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a1 as text
%        str2double(get(hObject,'String')) returns contents of a1 as a double


% --- Executes during object creation, after setting all properties.
function a1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a2_Callback(hObject, eventdata, handles)
% hObject    handle to a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a2 as text
%        str2double(get(hObject,'String')) returns contents of a2 as a double


% --- Executes during object creation, after setting all properties.
function a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a3_Callback(hObject, eventdata, handles)
% hObject    handle to a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a3 as text
%        str2double(get(hObject,'String')) returns contents of a3 as a double


% --- Executes during object creation, after setting all properties.
function a3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a4_Callback(hObject, eventdata, handles)
% hObject    handle to a4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a4 as text
%        str2double(get(hObject,'String')) returns contents of a4 as a double


% --- Executes during object creation, after setting all properties.
function a4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function af1_Callback(hObject, eventdata, handles)
% hObject    handle to af1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of af1 as text
%        str2double(get(hObject,'String')) returns contents of af1 as a double


% --- Executes during object creation, after setting all properties.
function af1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to af1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function af2_Callback(hObject, eventdata, handles)
% hObject    handle to af2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of af2 as text
%        str2double(get(hObject,'String')) returns contents of af2 as a double


% --- Executes during object creation, after setting all properties.
function af2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to af2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function af3_Callback(hObject, eventdata, handles)
% hObject    handle to af3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of af3 as text
%        str2double(get(hObject,'String')) returns contents of af3 as a double


% --- Executes during object creation, after setting all properties.
function af3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to af3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function af4_Callback(hObject, eventdata, handles)
% hObject    handle to af4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of af4 as text
%        str2double(get(hObject,'String')) returns contents of af4 as a double


% --- Executes during object creation, after setting all properties.
function af4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to af4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pri1.
function pri1_Callback(hObject, eventdata, handles)
rango=get(handles.ran,'string');
rango=str2double(rango);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	set(handles.Q1,'Value',0);
if (get(hObject,'Value') == get(hObject,'Max'))
	set(handles.Q1,'Max',rango);
    set(handles.Q1,'Min',0);
else
	set(handles.Q1,'Max',180);
    set(handles.Q1,'Min',-180);
end
set(handles.valq1,'String',0);
% Hint: get(hObject,'Value') returns toggle state of pri1


% --- Executes on button press in pri2.
function pri2_Callback(hObject, eventdata, handles)
rango=get(handles.ran,'string');
rango=str2double(rango);
% hObject    handle to pri2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	set(handles.Q2,'Value',0);
if (get(hObject,'Value') == get(hObject,'Max'))
	set(handles.Q2,'Max',rango);
    set(handles.Q2,'Min',0);
else
	set(handles.Q2,'Max',180);
    set(handles.Q2,'Min',-180);
end

set(handles.valq2,'String',0);
% Hint: get(hObject,'Value') returns toggle state of pri2


% --- Executes on button press in pri3.
function pri3_Callback(hObject, eventdata, handles)
rango=get(handles.ran,'string');
rango=str2double(rango);
% hObject    handle to pri3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	set(handles.Q3,'Value',0);
if (get(hObject,'Value') == get(hObject,'Max'))
	set(handles.Q3,'Max',rango);
    set(handles.Q3,'Min',0);
else
	set(handles.Q3,'Max',180);
    set(handles.Q3,'Min',-180);
end

set(handles.valq3,'String',0);
% Hint: get(hObject,'Value') returns toggle state of pri3


% --- Executes on button press in pri4.
function pri4_Callback(hObject, eventdata, handles)
rango=get(handles.ran,'string');
rango=str2double(rango);
% hObject    handle to pri4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	set(handles.Q4,'Value',0);
if (get(hObject,'Value') == get(hObject,'Max'))
	set(handles.Q4,'Max',rango);
    set(handles.Q4,'Min',0);
else
	set(handles.Q4,'Max',180);
set(handles.Q4,'Min',-180);
end

set(handles.valq4,'String',0);
% Hint: get(hObject,'Value') returns toggle state of pri4


% --- Executes on slider movement.
function Q1_Callback(hObject, eventdata, handles)
% hObject    handle to Q1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Q1 = get(hObject,'Value');
indSlide = round(handles.Q1);
set(handles.valq1,'String',indSlide);
pushbutton7_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Q1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Q2_Callback(hObject, eventdata, handles)
% hObject    handle to Q2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Q2 = get(hObject,'Value');
indSlide = round(handles.Q2);
set(handles.valq2,'String',indSlide);
pushbutton7_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Q2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Q3_Callback(hObject, eventdata, handles)
% hObject    handle to Q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Q3 = get(hObject,'Value');
indSlide = round(handles.Q3);
set(handles.valq3,'String',indSlide);
pushbutton7_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Q3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Q4_Callback(hObject, eventdata, handles)
% hObject    handle to Q4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Q4 = get(hObject,'Value');
indSlide = round(handles.Q4);
set(handles.valq4,'String',indSlide);
pushbutton7_Callback(hObject, eventdata, handles)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider



   


% --- Executes during object creation, after setting all properties.
function Q4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in ejemplo.
function ejemplo_Callback(hObject, eventdata, handles)
% hObject    handle to ejemplo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.t1,'String',0);
set(handles.t2,'String',0);
set(handles.t3,'String',0);
set(handles.t4,'String',0);
set(handles.t5,'String',0);
set(handles.t6,'String',0);

set(handles.d1,'String',35.2);
set(handles.d2,'String',0);
set(handles.d3,'String',10.2);
set(handles.d4,'String',38.0);
set(handles.d5,'String',0);
set(handles.d6,'String',38.0);


set(handles.a1,'String',7.0);
set(handles.a2,'String',36.0);
set(handles.a3,'String',10);
set(handles.a4,'String',0);
set(handles.a5,'String',0);
set(handles.a6,'String',5.2);

set(handles.af1,'String',-90);
set(handles.af2,'String',0);
set(handles.af3,'String',-90);
set(handles.af4,'String',90);
set(handles.af5,'String',-90);
set(handles.af6,'String',0);


% --- Executes during object creation, after setting all properties.
function pri1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pri1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pri2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pri2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pri3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pri3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pri4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pri4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function ran_Callback(hObject, eventdata, handles)
% hObject    handle to ran (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ran as text
%        str2double(get(hObject,'String')) returns contents of ran as a double


% --- Executes during object creation, after setting all properties.
function ran_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ran (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
teta1=get(handles.t1,'string');
teta1=deg2rad(str2double(teta1));
teta2=get(handles.t2,'string');
teta2=deg2rad(str2double(teta2));
teta3=get(handles.t3,'string');
teta3=deg2rad(str2double(teta3));
teta4=get(handles.t4,'string');
teta4=deg2rad(str2double(teta4));
teta5=get(handles.t5,'string');
teta5=deg2rad(str2double(teta5));
teta6=get(handles.t6,'string');
teta6=deg2rad(str2double(teta6));

dl1=get(handles.d1,'string');
dl1=str2double(dl1);
dl2=get(handles.d2,'string');
dl2=str2double(dl2);
dl3=get(handles.d3,'string');
dl3=str2double(dl3);
dl4=get(handles.d4,'string');
dl4=str2double(dl4);
dl5=get(handles.d5,'string');
dl5=str2double(dl5);
dl6=get(handles.d6,'string');
dl6=str2double(dl6);

al1=get(handles.a1,'string');
al1=str2double(al1);
al2=get(handles.a2,'string');
al2=str2double(al2);
al3=get(handles.a3,'string');
al3=str2double(al3);
al4=get(handles.a4,'string');
al4=str2double(al4);
al5=get(handles.a5,'string');
al5=str2double(al5);
al6=get(handles.a6,'string');
al6=str2double(al6);

alpha1=get(handles.af1,'string');
alpha1=deg2rad(str2double(alpha1));
alpha2=get(handles.af2,'string');
alpha2=deg2rad(str2double(alpha2));
alpha3=get(handles.af3,'string');
alpha3=deg2rad(str2double(alpha3));
alpha4=get(handles.af4,'string');
alpha4=deg2rad(str2double(alpha4));
alpha5=get(handles.af5,'string');
alpha5=deg2rad(str2double(alpha5));
alpha6=get(handles.af6,'string');
alpha6=deg2rad(str2double(alpha6));

if (get(handles.pri1,'Value') == get(handles.pri1,'Max'))
prisma1=1;
QA1=get(handles.valq1,'string');
QA1=str2double(QA1);
else
prisma1=0;
QA1=get(handles.valq1,'string');
QA1=degtorad(str2double(QA1));
end

if (get(handles.pri2,'Value') == get(handles.pri2,'Max'))
prisma2=1;
QA2=get(handles.valq2,'string');
QA2=str2double(QA2);
else
prisma2=0;
QA2=get(handles.valq2,'string');
QA2=degtorad(str2double(QA2));
end

if (get(handles.pri3,'Value') == get(handles.pri3,'Max'))
prisma3=1;
QA3=get(handles.valq3,'string');
QA3=str2double(QA3);
else
prisma3=0;
QA3=get(handles.valq3,'string');
QA3=degtorad(str2double(QA3));
end

if (get(handles.pri4,'Value') == get(handles.pri4,'Max'))
prisma4=1;
QA4=get(handles.valq4,'string');
QA4=str2double(QA4);
else
prisma4=0;
QA4=get(handles.valq4,'string');
QA4=degtorad(str2double(QA4));
end

if (get(handles.pri5,'Value') == get(handles.pri5,'Max'))
prisma5=1;
QA5=get(handles.valq5,'string');
QA5=str2double(QA5);
else
prisma5=0;
QA5=get(handles.valq5,'string');
QA5=degtorad(str2double(QA5));
end

if (get(handles.pri6,'Value') == get(handles.pri6,'Max'))
prisma6=1;
QA6=get(handles.valq6,'string');
QA6=str2double(QA6);
else
prisma6=0;
QA6=get(handles.valq6,'string');
QA6=degtorad(str2double(QA6));
end

L(1)=Link([teta1 dl1 al1 alpha1 prisma1]);
L(2)=Link([teta2 dl2 al2 alpha2 prisma2]);
L(3)=Link([teta3 dl3 al3 alpha3 prisma3]);
L(4)=Link([teta4 dl4 al4 alpha4 prisma4]);
L(5)=Link([teta5 dl5 al5 alpha5 prisma5]);
L(6)=Link([teta6 dl6 al6 alpha6 prisma6]);

r=SerialLink(L,'name','robot')
QT=[QA1 QA2 QA3 QA4 QA5 QA6]
AT=al1+al2+al3+al4+al5+al6;
AGG=dl1+dl2+dl3+dl4+dl5+dl6;
if(AT<=AGG)    
AT=AGG;
end
AT=AT/2;
RESUL=r.fkine([QT])
for i=1:4
for j=1:4
   if (-0.000001>RESUL(i,j)||RESUL(i,j)>0.00001)
   else
   RESUL(i,j)=0;    
   end
  
end    
end
tt=rad2deg(tr2rpy(RESUL,'zyx'));
set(handles.RZ,'String',tt(3));
set(handles.RY,'String',tt(2));
set(handles.RX,'String',tt(1));
set(handles.ZZ,'String',RESUL(3,4));
set(handles.YY,'String',RESUL(2,4));
set(handles.XX,'String',RESUL(1,4));
set(handles.RESPUESTA,'data',RESUL)
cla(handles.axes8,'reset')
%%ECUACIONES
axes(handles.axes8);
r.plot(QT,'workspace',[-AT AT -AT AT -AT AT])



% --- Executes when entered data in editable cell(s) in RESPUESTA.
function RESPUESTA_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to RESPUESTA (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function RESPUESTA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RESPUESTA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function valx_Callback(hObject, eventdata, handles)
% hObject    handle to valx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valx as text
%        str2double(get(hObject,'String')) returns contents of valx as a double


% --- Executes during object creation, after setting all properties.
function valx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valy_Callback(hObject, eventdata, handles)
% hObject    handle to valy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valy as text
%        str2double(get(hObject,'String')) returns contents of valy as a double


% --- Executes during object creation, after setting all properties.
function valy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valz_Callback(hObject, eventdata, handles)
% hObject    handle to valz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valz as text
%        str2double(get(hObject,'String')) returns contents of valz as a double


% --- Executes during object creation, after setting all properties.
function valz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)
% hObject    handle to calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
teta1=get(handles.t1,'string');
teta1=deg2rad(str2double(teta1));
teta2=get(handles.t2,'string');
teta2=deg2rad(str2double(teta2));
teta3=get(handles.t3,'string');
teta3=deg2rad(str2double(teta3));
teta4=get(handles.t4,'string');
teta4=deg2rad(str2double(teta4));
teta5=get(handles.t5,'string');
teta5=deg2rad(str2double(teta5));
teta6=get(handles.t6,'string');
teta6=deg2rad(str2double(teta6));

dl1=get(handles.d1,'string');
dl1=str2double(dl1);
dl2=get(handles.d2,'string');
dl2=str2double(dl2);
dl3=get(handles.d3,'string');
dl3=str2double(dl3);
dl4=get(handles.d4,'string');
dl4=str2double(dl4);
dl5=get(handles.d5,'string');
dl5=str2double(dl5);
dl6=get(handles.d6,'string');
dl6=str2double(dl6);

al1=get(handles.a1,'string');
al1=str2double(al1);
al2=get(handles.a2,'string');
al2=str2double(al2);
al3=get(handles.a3,'string');
al3=str2double(al3);
al4=get(handles.a4,'string');
al4=str2double(al4);
al5=get(handles.a5,'string');
al5=str2double(al5);
al6=get(handles.a6,'string');
al6=str2double(al6);

alpha1=get(handles.af1,'string');
alpha1=deg2rad(str2double(alpha1));
alpha2=get(handles.af2,'string');
alpha2=deg2rad(str2double(alpha2));
alpha3=get(handles.af3,'string');
alpha3=deg2rad(str2double(alpha3));
alpha4=get(handles.af4,'string');
alpha4=deg2rad(str2double(alpha4));
alpha5=get(handles.af5,'string');
alpha5=deg2rad(str2double(alpha5));
alpha6=get(handles.af6,'string');
alpha6=deg2rad(str2double(alpha6));

if (get(handles.pri1,'Value') == get(handles.pri1,'Max'))
prisma1=1;
QA1=get(handles.valq1,'string');
QA1=str2double(QA1);
else
prisma1=0;
QA1=get(handles.valq1,'string');
QA1=degtorad(str2double(QA1));
end

if (get(handles.pri2,'Value') == get(handles.pri2,'Max'))
prisma2=1;
QA2=get(handles.valq2,'string');
QA2=str2double(QA2);
else
prisma2=0;
QA2=get(handles.valq2,'string');
QA2=degtorad(str2double(QA2));
end

if (get(handles.pri3,'Value') == get(handles.pri3,'Max'))
prisma3=1;
QA3=get(handles.valq3,'string');
QA3=str2double(QA3);
else
prisma3=0;
QA3=get(handles.valq3,'string');
QA3=degtorad(str2double(QA3));
end

if (get(handles.pri4,'Value') == get(handles.pri4,'Max'))
prisma4=1;
QA4=get(handles.valq4,'string');
QA4=str2double(QA4);
else
prisma4=0;
QA4=get(handles.valq4,'string');
QA4=degtorad(str2double(QA4));
end

if (get(handles.pri5,'Value') == get(handles.pri5,'Max'))
prisma5=1;
QA5=get(handles.valq5,'string');
QA5=str2double(QA5);
else
prisma5=0;
QA5=get(handles.valq5,'string');
QA5=degtorad(str2double(QA5));
end

if (get(handles.pri6,'Value') == get(handles.pri6,'Max'))
prisma6=1;
QA6=get(handles.valq6,'string');
QA6=str2double(QA6);
else
prisma6=0;
QA6=get(handles.valq6,'string');
QA6=degtorad(str2double(QA6));
end

L(1)=Link([teta1 dl1 al1 alpha1 prisma1]);
L(2)=Link([teta2 dl2 al2 alpha2 prisma2]);
L(3)=Link([teta3 dl3 al3 alpha3 prisma3]);
L(4)=Link([teta4 dl4 al4 alpha4 prisma4]);
L(5)=Link([teta5 dl5 al5 alpha5 prisma5]);
L(6)=Link([teta6 dl6 al6 alpha6 prisma6]);

r=SerialLink(L,'name','robot')


xvalor=get(handles.valx,'string');
xvalor=str2double(xvalor);

yvalor=get(handles.valy,'string');
yvalor=str2double(yvalor);

zvalor=get(handles.valz,'string');
zvalor=str2double(zvalor);

T=[1 0 0 xvalor;
   0 1 0 yvalor;
   0 0 1 zvalor;
   0 0 0 1
]
 CI=r.ikine(T,[0 0 0 0 0 0],[1 1 1 1 1 1])
 
 %0000000000000000000000
 
 if (get(handles.pri1,'Value') == get(handles.pri1,'Max'))
 CI(1)=round(CI(1));
 else
 CI(1)=round(rad2deg(CI(1)));  
 end
 
 if (get(handles.pri2,'Value') == get(handles.pri2,'Max'))
 CI(2)=round(CI(2));
 else
 CI(2)=round(rad2deg(CI(2)));  
 end
 
 if (get(handles.pri3,'Value') == get(handles.pri3,'Max'))
 CI(3)=round(CI(3));
 else
 CI(3)=round(rad2deg(CI(3)));  
 end
if (get(handles.pri4,'Value') == get(handles.pri4,'Max'))
 CI(4)=round(CI(4));
 else
 CI(4)=round(rad2deg(CI(4)));  
end
 
if (get(handles.pri5,'Value') == get(handles.pri5,'Max'))
 CI(5)=round(CI(5));
 else
 CI(5)=round(rad2deg(CI(5)));  
end

if (get(handles.pri6,'Value') == get(handles.pri6,'Max'))
 CI(6)=round(CI(6));
 else
 CI(6)=round(rad2deg(CI(6)));  
 end
 
set(handles.valq1,'String',CI(1));
set(handles.valq2,'String',CI(2));
set(handles.valq3,'String',CI(3));
set(handles.valq4,'String',CI(4));
set(handles.valq5,'String',CI(5));
set(handles.valq6,'String',CI(6));
set(handles.Q1,'Value',CI(1));
set(handles.Q2,'Value',CI(2));
set(handles.Q3,'Value',CI(3));
set(handles.Q4,'Value',CI(4));
set(handles.Q5,'Value',CI(5));
set(handles.Q6,'Value',CI(6));
pushbutton7_Callback(hObject, eventdata, handles)
%0000000000000000000000000
 



function valq5_Callback(hObject, eventdata, handles)
% hObject    handle to valq5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valq5 as text
%        str2double(get(hObject,'String')) returns contents of valq5 as a double


% --- Executes during object creation, after setting all properties.
function valq5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valq5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valq6_Callback(hObject, eventdata, handles)
% hObject    handle to valq6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valq6 as text
%        str2double(get(hObject,'String')) returns contents of valq6 as a double


% --- Executes during object creation, after setting all properties.
function valq6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valq6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Q6_Callback(hObject, eventdata, handles)
% hObject    handle to Q6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Q6 = get(hObject,'Value');
indSlide = round(handles.Q6);
set(handles.valq6,'String',indSlide);
pushbutton7_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Q6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Q5_Callback(hObject, eventdata, handles)
% hObject    handle to Q5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Q5 = get(hObject,'Value');
indSlide = round(handles.Q5);
set(handles.valq5,'String',indSlide);
pushbutton7_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Q5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Q5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function t5_Callback(hObject, eventdata, handles)
% hObject    handle to t5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t5 as text
%        str2double(get(hObject,'String')) returns contents of t5 as a double


% --- Executes during object creation, after setting all properties.
function t5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t6_Callback(hObject, eventdata, handles)
% hObject    handle to t6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t6 as text
%        str2double(get(hObject,'String')) returns contents of t6 as a double


% --- Executes during object creation, after setting all properties.
function t6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d5_Callback(hObject, eventdata, handles)
% hObject    handle to d5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d5 as text
%        str2double(get(hObject,'String')) returns contents of d5 as a double


% --- Executes during object creation, after setting all properties.
function d5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d6_Callback(hObject, eventdata, handles)
% hObject    handle to d6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d6 as text
%        str2double(get(hObject,'String')) returns contents of d6 as a double


% --- Executes during object creation, after setting all properties.
function d6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a5_Callback(hObject, eventdata, handles)
% hObject    handle to a5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a5 as text
%        str2double(get(hObject,'String')) returns contents of a5 as a double


% --- Executes during object creation, after setting all properties.
function a5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a6_Callback(hObject, eventdata, handles)
% hObject    handle to a6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a6 as text
%        str2double(get(hObject,'String')) returns contents of a6 as a double


% --- Executes during object creation, after setting all properties.
function a6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function af5_Callback(hObject, eventdata, handles)
% hObject    handle to af5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of af5 as text
%        str2double(get(hObject,'String')) returns contents of af5 as a double


% --- Executes during object creation, after setting all properties.
function af5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to af5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function af6_Callback(hObject, eventdata, handles)
% hObject    handle to af6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of af6 as text
%        str2double(get(hObject,'String')) returns contents of af6 as a double


% --- Executes during object creation, after setting all properties.
function af6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to af6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pri5.
function pri5_Callback(hObject, eventdata, handles)
rango=get(handles.ran,'string');
rango=str2double(rango);
% hObject    handle to pri4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	set(handles.Q5,'Value',0);
if (get(hObject,'Value') == get(hObject,'Max'))
	set(handles.Q5,'Max',rango);
    set(handles.Q5,'Min',0);
else
	set(handles.Q5,'Max',180);
set(handles.Q5,'Min',-180);
end

set(handles.valq5,'String',0);


% --- Executes on button press in pri6.
function pri6_Callback(hObject, eventdata, handles)
rango=get(handles.ran,'string');
rango=str2double(rango);
% hObject    handle to pri4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	set(handles.Q6,'Value',0);
if (get(hObject,'Value') == get(hObject,'Max'))
	set(handles.Q6,'Max',rango);
    set(handles.Q6,'Min',0);
else
	set(handles.Q6,'Max',180);
set(handles.Q6,'Min',-180);
end

set(handles.valq6,'String',0);
