import xlrd
#import Test
from xlrd.sheet import ctype_text
xl_workbook = xlrd.open_workbook('../TestData/TestInputData.xlsx')
def read_excel_data ( sheetname, testcase, title):
    cell_value= basestring
    sheet_name = xl_workbook.sheet_names()
    xl_sheet = xl_workbook.sheet_by_name(sheetname)
    row = xl_sheet.row_values(0)
    #print(row)
    col = 0
    for col_idx in range(0, xl_sheet.ncols):
        cell_col = xl_sheet.cell(0, col_idx).value;
        if cell_col == title:
            col = col_idx
    for row_idx in range(0, xl_sheet.nrows):
        cell_Row = xl_sheet.cell(row_idx, 0).value;
        if cell_Row == testcase:
            cell_value = xl_sheet.cell(row_idx, col).value
            #print (cell_value)
    return cell_value
