function Example {
    # Example script to demonstrate ps2exe functionality
    # This will create a simple GUI application that shows a message

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    # Create the main form
    $form = New-Object System.Windows.Forms.Form
    $form.Text = 'DisplayPad script Demo'
    $form.Size = New-Object System.Drawing.Size(400,200)
    $form.StartPosition = 'CenterScreen'

    # Add a label
    $label = New-Object System.Windows.Forms.Label
    $label.Location = New-Object System.Drawing.Point(10,20)
    $label.Size = New-Object System.Drawing.Size(380,40)
    $label.Text = 'This is a PowerShell script converted to EXE using PS2EXE, Triggered through your DisplayPad'
    $form.Controls.Add($label)

    # Add a button
    $button = New-Object System.Windows.Forms.Button
    $button.Location = New-Object System.Drawing.Point(150,100)
    $button.Size = New-Object System.Drawing.Size(100,30)
    $button.Text = 'Click Me!'
    $button.Add_Click({
        [System.Windows.Forms.MessageBox]::Show('Hello from PS2EXE! Triggered through your DisplayPad!', 'Message')
    })
    $form.Controls.Add($button)

    # Show the form
    $form.ShowDialog()
}

Example