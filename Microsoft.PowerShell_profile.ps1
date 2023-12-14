oh-my-posh init pwsh --config 'C:/Users/Sighhh/AppData/Local/Programs/oh-my-posh/themes/1_shell.omp.json' | Invoke-Expression

function getlist {Get-ChildItem -Name}

function getfile($path,$name) {Get-ChildItem -Path $path -Filter *$name* -Recurse | %{$_.FullName}}
function getfolder($path,$name) {Get-ChildItem -Path $Path -Filter *$Name* -Directory -Recurse | ForEach-Object{$_.FullName}}

function choose($index) {$input | Select -Index $index}

function getport($port) { netstat -ano | findstr $port}
function help($command) {Get-Help $command -detail}

function getportall {netstat -ano}

Set-Alias gettaskall tasklist

Set-Alias l getlist
Set-Alias ll ls

function GoDir{
	param(
		[parameter(Mandatory=$true, ValueFromPipeline=$true)]
		[string]$Path
	) 
	process{
		cd $Path
	}
}

function GoFile{
	param(
		[parameter(Mandatory=$true, ValueFromPipeline=$true)]
		[string]$Path
	) 
	process{
		cd (Get-Item $Path).Directory.FullName
	}
}