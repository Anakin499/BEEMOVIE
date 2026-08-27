Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Text = "Bee Movie Script"
$form.Width = 900
$form.Height = 700
$form.StartPosition = "CenterScreen"

$text = New-Object System.Windows.Forms.TextBox
$text.Multiline = $true
$text.ReadOnly = $true
$text.ScrollBars = "Vertical"
$text.Dock = "Fill"
$text.Font = New-Object System.Drawing.Font("Consolas",11)

$text.Text = Get-Content ".\BeeMovie.txt" -Raw

$form.Controls.Add($text)

$form.ShowDialog()