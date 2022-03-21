
try:
	import mitosheet
	import pandas as pd
	import uuid

	def add_mito_button_to_df_output(obj):
		button_uuid = uuid.uuid4()
		try:
			max_rows = pd.get_option('display.min_rows') # NOTE: this is due to https://github.com/pandas-dev/pandas/issues/44304
			max_cols = pd.get_option('display.max_columns')
		except:
			max_rows = 10
			max_cols = 20
		return f'<div><div id={button_uuid} style="display:none; background-color:#9D6CFF; color:white; width:200px; height:30px; padding-left:5px; border-radius:4px; flex-direction:row; justify-content:space-around; align-items:center;" onmouseover="this.style.backgroundColor=\'#BA9BF8\'" onmouseout="this.style.backgroundColor=\'#9D6CFF\'" onclick="window.commands?.execute(\'create-mitosheet-from-dataframe-output\');">See Full Dataframe in Mito</div> <script> if (window.commands.hasCommand(\'create-mitosheet-from-dataframe-output\')) document.getElementById(\'{button_uuid}\').style.display = \'flex\' </script> {obj.to_html(max_rows=max_rows, max_cols=max_cols)}</div>'

	html_formatter = get_ipython().display_formatter.formatters['text/html']
	html_formatter.for_type(pd.DataFrame, add_mito_button_to_df_output)
except:
	print('Unable to automatically import mitosheet')
