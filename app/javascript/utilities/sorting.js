class SortingTable {
  constructor(tableID) {
    this.table = document.getElementById(tableID)
  }

  sortRowsByTitle() {
    const rows = this.table.querySelectorAll('tr')
    const sortedRows = []

    for(let i = 1; i < rows.length; i++) {
      sortedRows.push(rows[i])
    }

    const arrowUpClassList = this.table.querySelector('.octicon-arrow-up').classList;
    const arrowDownClassList = this.table.querySelector('.octicon-arrow-down').classList;

    if (arrowUpClassList.contains('hide')) {
      sortedRows.sort(this.compareRowsAsc)
      arrowUpClassList.remove('hide')
      arrowDownClassList.add('hide')
    }
    else {
      sortedRows.sort(this.compareRowsDesc)
      arrowDownClassList.remove('hide')
      arrowUpClassList.add('hide')
    }

    const sortedTable = document.createElement('table')
    sortedTable.classList.add('table')
    sortedTable.setAttribute("id", this.table.id);

    sortedTable.appendChild(rows[0])

    for (let row of sortedRows) {
      sortedTable.appendChild(row)
    }

    this.table.parentNode.replaceChild(sortedTable, this.table)
  }

  compareRowsAsc(row1, row2) {
    const columnIndex = document.querySelector('.sort-by-title').cellIndex
    const testTitle1 = row1.getElementsByTagName("td")[columnIndex].textContent
    const testTitle2 = row2.getElementsByTagName("td")[columnIndex].textContent

    if (testTitle1 < testTitle2) {return -1}
    if (testTitle1 > testTitle2) {return 1}
    return 0
  }

  compareRowsDesc(row1, row2) {
    const columnIndex = document.querySelector('.sort-by-title').cellIndex
    const testTitle1 = row1.getElementsByTagName("td")[columnIndex].textContent
    const testTitle2 = row2.getElementsByTagName("td")[columnIndex].textContent

    if (testTitle1 > testTitle2) {return -1}
    if (testTitle1 < testTitle2) {return 1}
    return 0
  }
}
export default SortingTable