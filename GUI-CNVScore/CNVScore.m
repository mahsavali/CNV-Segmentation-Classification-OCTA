function varargout = CNVScore(varargin)
% CNVSCORE MATLAB code for CNVScore.fig
%      CNVSCORE, by itself, creates a new CNVSCORE or raises the existing
%      singleton*.
%
%      H = CNVSCORE returns the handle to a new CNVSCORE or the handle to
%      the existing singleton*.
%
%      CNVSCORE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CNVSCORE.M with the given input arguments.
%
%      CNVSCORE('Property','Value',...) creates a new CNVSCORE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CNVScore_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CNVScore_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CNVScore

% Last Modified by GUIDE v2.5 05-Jan-2021 02:26:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CNVScore_OpeningFcn, ...
                   'gui_OutputFcn',  @CNVScore_OutputFcn, ...
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


% --- Executes just before CNVScore is made visible.
function CNVScore_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CNVScore (see VARARGIN)

% Choose default command line output for CNVScore
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global startingFolder;
global fullFileName;
global baseFileName;
global folder;
global image_index;
global N;
global permutation
global im_order;

% UIWAIT makes CNVScore wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CNVScore_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in LoadDatapb.
function LoadDatapb_Callback(hObject, eventdata, handles)
% hObject    handle to LoadDatapb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% % guidata(hObject, handles);
startingFolder = pwd;  % or 'C:\wherever';
if ~exist(startingFolder, 'dir')
	% If that folder doesn't exist, just start in the current folder.
	startingFolder = pwd;
end
% Get the name of the file that the user wants to use.
defaultFileName = fullfile(startingFolder, '*.*');
jpegFiles = dir(defaultFileName);
[baseFileName, folder] = uigetfile(defaultFileName, 'Select a file');
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName);
%imagepath=str_cat(fullFileName,'jpg');
handles.output=hObject;
set(handles.edit1,'string',fullFileName);
I=imread(fullFileName);
imshow(I,[]);
guidata(hObject, handles);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkboxScore1.
function checkboxScore1_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxScore1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxScore1
CheckBoxValue=get(handles.checkboxScore1,'Value');
if isequal(CheckBoxValue,1)
    evalin('base', 'MyArray(1)=1;');       %Save "TRUE" in the array "MyArray()"
else
    evalin('base', 'MyArray(1)=0;');
end
handles = guidata(hObject);


% --- Executes on button press in nextPushButton.
function nextPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to nextPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global jpegFile;
global startingFolder;
global fullFileName;
global baseFileName;
global folder;
handles.output=hObject;
% % [fn pn]=uigetfile('*.png','select CNVimage file');
% % complete=strcat(pn,fn);
guidata(hObject, handles);
% Get the name of the file that the user wants to use.
complete=str_cat(baseFileName,folder);
for k=1:length(jpegFiles)
    baseFileName = jpegFiles(k).name;
    fullFileName = fullfile(handles.sourceFolder, baseFileName);
    fprintf(1,'Now reading %s\n', fullFileName);
    imageArray=imread(fullFileName);
end
%image_index=str2num(complete(1:end-4));
%imagepath=str_cat(fullFileName,'jpg');
handles.output=hObject;
% % [fn pn]=uigetfile('*.png','select CNVimage file');
% % complete=strcat(pn,fn);
set(handles.edit1,'string',complete);
I=imread(complete);
imshow(I,[]);
complete=complete+1;
guidata(hObject, handles);






% --- Executes on button press in checkboxScore2.
function checkboxScore2_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxScore2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CheckBoxValue2=get(handles.checkboxScore2,'Value');
if isequal(CheckBoxValue2,1)
    evalin('base', 'MyArray(1)=2;');       %Save "TRUE" in the array "MyArray()"
else
    evalin('base', 'MyArray(1)=0;');
end
handles = guidata(hObject);

% Hint: get(hObject,'Value') returns toggle state of checkboxScore2


% --- Executes on button press in checkboxScore3.
function checkboxScore3_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxScore3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CheckBoxValue3=get(handles.checkboxScore3,'Value');
if isequal(CheckBoxValue3,1)
    evalin('base', 'MyArray(1)=3;');       %Save "TRUE" in the array "MyArray()"
else
    evalin('base', 'MyArray(1)=0;');
end
handles = guidata(hObject);

% Hint: get(hObject,'Value') returns toggle state of checkboxScore3


% --- Executes on button press in checkboxScore4.
function checkboxScore4_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxScore4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CheckBoxValue4=get(handles.checkboxScore4,'Value');
if isequal(CheckBoxValue4,1)
    evalin('base', 'MyArray(1)=4;');       %Save "TRUE" in the array "MyArray()"
else
    evalin('base', 'MyArray(1)=0;');
end
handles = guidata(hObject);

% Hint: get(hObject,'Value') returns toggle state of checkboxScore4


% --- Executes on button press in checkboxScore5.
function checkboxScore5_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxScore5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CheckBoxValue5=get(handles.checkboxScore5,'Value');
if isequal(CheckBoxValue5,1)
    evalin('base', 'MyArray(1)=5;');       %Save "TRUE" in the array "MyArray()"
else
    evalin('base', 'MyArray(1)=0;');
end
handles = guidata(hObject);

% Hint: get(hObject,'Value') returns toggle state of checkboxScore5
