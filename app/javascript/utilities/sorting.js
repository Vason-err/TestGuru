export class SortingTable {
  constructor(table_id) {
    this.table = document.getElementById(table_id)
    this.sortedRows = [];
    this.rows = this.table.querySelectorAll('tr');
    this.start()
  }

  start() {
    const control = document.querySelector(".sort-by-title")

    if (control) { control.addEventListener('click', this.sortRowsByTitle) }
  }

  sortRowsByTitle() {
    const element = this.table.querySelector(".sort-by-title");
    const position = element.cellIndex

    for (let i = 1; i < this.rows.length; i++) {
      this.sortedRows.push(this.rows[i])
    }

    if (element.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      this.sortedRows.sort((rowA, rowB) => rowA.cells[position].innerHTML > rowB.cells[position].innerHTML ? 1 : -1)
      element.querySelector('.octicon-arrow-up').classList.remove('hide')
      element.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
      this.sortedRows.sort((rowA, rowB) => rowA.cells[position].innerHTML > rowB.cells[position].innerHTML ? -1 : 1)
      element.querySelector('.octicon-arrow-down').classList.remove('hide')
      element.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    this.replaceWithSortedTable()
  }

  replaceWithSortedTable() {
    const sortedTable = document.createElement('table');

    sortedTable.classList.add('table')
    sortedTable.appendChild(this.rows[0])

    this.sortedRows.forEach(function (row) {
      sortedTable.appendChild(this.row)
    })

    this.table.parentNode.replaceChild(sortedTable, this.table)
 }
}


