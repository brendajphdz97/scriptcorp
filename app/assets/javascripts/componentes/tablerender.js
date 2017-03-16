function TableRender() {

    //Variables
    this.render;
    this.data;
    this.pagesize;
    this.header;
    this.tableclass;
    this.emptyMsg;
    var parent;
    var table = document.createElement("table");
    var container = document.createElement("div");
    var currentPage = 0;


    this.setParentId = function(identifier) {
        parent = document.getElementById(identifier);
        parent.appendChild(container);
        parent.appendChild(document.createElement("br"));
        parent.appendChild(table);
        this.data = JSON.parse(parent.getAttribute("datos"));
    }

    this.make = function() {
        this.buildPaggin();
        buildTable(this);
    }

    this.buildPaggin = function() {
        if(this.pagesize != undefined && this.data != undefined) {
            if(this.data.length > this.pagesize) {
                select = document.createElement("select");
                select.classList.add("form-control");
                select.style.width = "128px";
                container.appendChild(select);

                pages = Math.ceil(this.data.length/this.pagesize);
                for (var i = 0; i < pages; i++) {
                    option = document.createElement("option");
                    option.appendChild(document.createTextNode((i+1) + ""));
                    select.appendChild(option);
                }

                var primary = this;
                select.onchange = function() {
                    table.innerHTML = "";
                    currentPage = parseInt(select.value) - 1;
                    buildTable(primary);
                }
            }
        }
    }

    function buildTable(tableElement) {
        if(parent != undefined) {
            //Si el encabezado esta definido lo agregamos
            if(header != undefined){
                table.appendChild(header.getComponent());
            }
            tbody = document.createElement("tbody");
            //Si el modelo trae información y hay un render lo ejecutamos por cada linea
            if(tableElement.data != undefined && tableElement.data.length > 0 && tableElement.render != undefined){
                //Si hay paginado, pagina
                min = 0;
                max = tableElement.data.length;
                if(tableElement.pagesize != undefined && tableElement.pagesize > 0) {
                    min = currentPage * tableElement.pagesize;
                    max = (currentPage + 1) * tableElement.pagesize;
                    //Si el maximo es mayor que el total, entonces es el total
                    if(max > tableElement.data.length) {
                        max = tableElement.data.length;
                    }
                }

                for (index = min; index < max; index++) {
                    var elemento = tableElement.data[index];
                    var item = new Item();
                    tableElement.render(item, elemento);
                    tbody.appendChild(item.getComponent());
                }
            } else {
                //Añadimos el mensaje de empty
                var line = document.createElement("tr");
                var element = document.createElement("td");
                element.appendChild(document.createTextNode(tableElement.emptyMsg == undefined ? "": tableElement.emptyMsg));
                element.colspan = header == undefined ? 1: header.getCount();
                line.appendChild(element);
                tbody.appendChild(line);

            }
            //Si existe un estilo lo agregamos
            if(tableElement.tableclass != undefined) {
                var res = tableElement.tableclass.split(" ");
                for (var index in res) {
                    var cssclass = res[index];
                    table.classList.add(cssclass);
                }
            }
            //Añadimos todo al padre
            table.appendChild(tbody);
        }
    }
}

function Header() {
    var count = 0;
    var header = document.createElement("thead");
    var headerRow = document.createElement("tr");
    header.appendChild(headerRow);

    this.addCol = function functionName(label, tooltip) {
        count++;
        element = document.createElement("th");
        element.title = tooltip == undefined ? "": tooltip;
        element.appendChild(document.createTextNode(label == undefined ? "": label));
        headerRow.appendChild(element);
    }

    this.getComponent = function() {
        return header;
    }

    this.getCount = function(){
        return count;
    }
}

function Item() {
    var line = document.createElement("tr");

    this.createCell = function functionName(label, tooltip, html) {
        element = document.createElement("td");
        element.title = tooltip == undefined ? "": tooltip;
        if(html != undefined) {
            element.innerHTML = html;
        } else if(label != undefined) {
            element.appendChild(document.createTextNode(label == undefined ? "": label));
        }
        line.appendChild(element);
    }

    this.getComponent = function() {
        return line;
    }
}
