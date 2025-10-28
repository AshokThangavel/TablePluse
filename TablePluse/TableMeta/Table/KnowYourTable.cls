Class TablePluse.TableMeta.Table.KnowYourTable Extends %CSP.Page
{

Parameter Title As STRING = "KYT - Know Your Table";

ClassMethod OnPage() As %Status
{
	Do ..OnPageCSPROOT()
	Return $$$OK
}

ClassMethod OnPageCSPROOT() As %Boolean
{
	Do ..OnPageHTML()
}

ClassMethod OnPageHTML() As %Boolean
{
	Write "<html>"
	Write !
	Do ..OnPageHEAD()
	Do ..OnPageBODY()
	Write !,"</html>"
	Return $$$OK
}

ClassMethod OnPageHEAD() As %Boolean
{
	Write "<head>",!
	Write !,"<title>"_..#Title_"</title>",!
	Write "<link rel=""stylesheet"" href=""https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"">"
	Write "<style>",!
	Do ..LoadCSS()
	Write "</style>",!
	Write "</head>",!
	Write ..HyperEventHead(0,0)
	Return $$$OK
}

ClassMethod OnPageBODY() As %Boolean
{
	Do ..RenderScreen()
	Return $$$OK
}

/// Override this method to render your screens in UI
ClassMethod RenderScreen()
{
	Do ..OnRenderScreen()
	Do ..Scripts()
}

ClassMethod OnRenderScreen()
{
	&HTML<
<body>

    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <h2>IRIS Tables</h2>
                <button class="toggle-btn" id="toggleBtn">
                    <i class="fas fa-chevron-left"></i>
                </button>
            </div>

            <div class="sidebar-content">
                <div class="search-box">
                    <input type="text" id="tableSearch" placeholder="Search tables...">
                    <i class="fas fa-search"></i>
                </div>

                <ul class="table-list" id="tableList">
                    <!-- Table items will be dynamically added here -->
                </ul>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content" id="mainContent">
            <div class="header">
                <h1 id="pageTitle">Select a Table</h1>
                <button class="refresh-btn" id="refreshBtn">
                    <i class="fas fa-sync-alt"></i> Refresh
                </button>
            </div>

            <!-- Table Schema Section -->
            <div class="content-section" id="schemaSection" style="display: none;">
                <h2 class="section-title">
                    <i class="fas fa-info-circle"></i> Table Schema Information
                    <!--button id="toggle1SchemaBtn" style="border: none; background: none; font-size: 1.2em; cursor: pointer;">
            		<span id="toggleIcon">▼</span-->
        </button>
                </h2>

                <div class="info-grid" id="schemaInfo">
                    <!-- Schema info will be dynamically added here -->
                </div>

            </div>

            <!-- Column Information Section -->
            <div class="content-section" id="columnsSection" style="display: none;">
                <h2 class="section-title">
                    <i class="fas fa-columns"></i> Column Information
                </h2>

                <table class="data-table" id="columnsTable">
                    <thead>
                        <tr>
                            <th>Column Name</th>
                            <th>Data Type</th>
                            <th>Nullable</th>
                            <th>Default Value</th>
                            <th>Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Column data will be dynamically added here -->
                    </tbody>
                </table>
            </div>

            <!-- Index Structure Section -->
            <div class="content-section" id="indexesSection" style="display: none;">
                <h2 class="section-title">
                    <i class="fas fa-sitemap"></i> Index Structure
                </h2>

                <table class="data-table" id="indexesTable">
                    <thead>
                        <tr>
                            <th>Index Name</th>
                            <th>Fields</th>
                            <th>Asc or Desc</th>
                            <th>Unique</th>
                            <th>Primary</th>
                            <th>Selectable</th>
                            <!--th>Description</th-->
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Index data will be dynamically added here -->
                    </tbody>
                </table>
            </div>

            <!-- Trigger Information Section -->
            <div class="content-section" id="triggerSection" style="display: none;">
                <h2 class="section-title">
                    <i class="fas fa-columns"></i> Trigger Information
                </h2>

                <table class="data-table" id="triggersTable">
                    <thead>
                        <tr>
                            <th>Trigger Name</th>
                            <th>Event</th>
                            <th>When</th>
                            <th>ActionOrientation</th>
                            <th>CreatedDateTime</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Column data will be dynamically added here -->
                    </tbody>
                </table>
            </div>

 			<!-- SQL Procedure Information Section -->
            <div class="content-section" id="sqlprocSection" style="display: none;">
                <h2 class="section-title">
                    <i class="fas fa-columns"></i> SQL Procedure Information
                </h2>

                <table class="data-table" id="sqlprocTable">
                    <thead>
                        <tr>
                            <th>SQL Procedure Name</th>
                            <th>Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Column data will be dynamically added here -->
                    </tbody>
                </table>
            </div>

            <!-- Views Information Section -->
            <div class="content-section" id="viewSection" style="display: none;">
                <h2 class="section-title">
                    <i class="fas fa-columns"></i> Views Information
                </h2>

                <table class="data-table" id="viewTable">
                    <thead>
                        <tr>
                            <th>View Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Column data will be dynamically added here -->
                    </tbody>
                </table>
            </div>

            <!-- Query Statistics Section -->
            <div class="content-section" id="queryStatsSection" style="display: none;">
                <h2 class="section-title">
                    <i class="fas fa-chart-line"></i> Query Execution Statistics
                </h2>

                <div class="stats-container" id="statsContainer">
                    <!-- Stats cards will be dynamically added here -->
                </div>

                <!--h3 style="margin-top: 25px; margin-bottom: 15px;">Most Time-Consuming Queries</h3-->
                <div class="query-list" id="queryList">
                    <!-- Query items will be dynamically added here -->
                </div>
            </div>

            <!-- Performance Suggestions Section -->
            <!--div class="content-section" id="suggestionsSection" style="display: none;">
                <h2 class="section-title">
                    <i class="fas fa-lightbulb"></i> Performance Suggestions
                </h2>

                <ul class="suggestion-list" id="suggestionList">
                    <!-- Suggestions will be dynamically added here -->
                <!--/ul>
            </div-->

            <!-- Loading State -->
            <div class="loading" id="loadingState" style="display: none;">
                <i class="fas fa-spinner"></i>
            </div>

            <!-- Error State -->
            <div class="error-message" id="errorMessage" style="display: none;">
                <i class="fas fa-exclamation-circle"></i>
                <span id="errorText">An error occurred while loading data.</span>
            </div>
        </div>
    </div>
</body>
	>
}

ClassMethod LoadCSS()
{
	Set obj = ##class(%Dictionary.CompiledXData).%OpenId($Classname()_"||Style")
	Return:(obj = "") $$$OK
	Set xdata = obj.Data
	Set status = ##class(%XML.TextReader).ParseStream(xdata, .textreader)
	While textreader.Read() { If (textreader.NodeType="chars") { Write textreader.Value } }
	Return $$$OK
}

XData Style
{
<data>
	<![CDATA[
	:root{--primary-color:#4361ee;--primary-dark:#3a56d4;--primary-light:#5a7aff;--secondary-color:#3498db;--accent-color:#e74c3c;--success-color:#2ecc71;--warning-color:#f39c12;--light-color:#ecf0f1;--dark-color:#2c3e50;--border-radius:5px;--box-shadow:0 2px 10px rgba(0,0,0,0.1);--transition:all 0.3s ease}*{margin:0;padding:0;box-sizing:border-box}body{font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;background-color:#f5f7fa;color:var(--dark-color);line-height:1.6}.container{display:flex;min-height:100vh}.sidebar{width:300px;background-color:var(--primary-color);color:#fff;box-shadow:2px 0 5px rgba(0,0,0,0.1);transition:var(--transition);display:flex;flex-direction:column;height:100vh;position:sticky;top:0}.sidebar.collapsed{width:60px}.sidebar-header{background-color:var(--primary-dark);padding:15px;display:flex;justify-content:space-between;align-items:center;flex-shrink:0}.sidebar-header h2{font-size:1.2rem;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.sidebar.collapsed .sidebar-header h2{display:none}.sidebar-content{padding:20px;flex:1;overflow-y:auto;transition:var(--transition)}.sidebar.collapsed .sidebar-content{padding:10px;overflow-y:hidden}.toggle-btn{background:none;border:none;color:#fff;cursor:pointer;font-size:1.2rem;transition:var(--transition)}.toggle-btn:hover{transform:rotate(180deg)}.search-box{position:relative;margin-bottom:20px;transition:var(--transition)}.sidebar.collapsed .search-box{display:none}.search-box input{width:100%;padding:10px 40px 10px 15px;border-radius:var(--border-radius);border:none;background-color:rgba(255,255,255,0.1);color:#fff;font-size:14px}.search-box input::placeholder{color:rgba(255,255,255,0.7)}.search-box i{position:absolute;right:15px;top:50%;transform:translateY(-50%);color:rgba(255,255,255,0.7)}.table-list{list-style:none;transition:var(--transition)}.sidebar.collapsed .table-list{display:none}.table-item{padding:12px 15px;margin-bottom:5px;border-radius:var(--border-radius);cursor:pointer;transition:var(--transition);display:flex;justify-content:space-between;align-items:center}.table-item:hover{background-color:rgba(255,255,255,0.1)}.table-item.active{background-color:var(--primary-light)}.table-item i{margin-right:10px}.table-badge{background-color:rgba(255,255,255,0.2);padding:2px 8px;border-radius:10px;font-size:.7rem}.main-content{flex:1;padding:30px;overflow-y:auto;transition:var(--transition)}.main-content.expanded{margin-left:0}.header{display:flex;justify-content:space-between;align-items:center;margin-bottom:30px;padding-bottom:15px;border-bottom:1px solid #ddd}.header h1{font-size:2rem;color:var(--primary-color)}.refresh-btn{background-color:var(--primary-color);color:#fff;border:none;padding:10px 20px;border-radius:var(--border-radius);cursor:pointer;display:flex;align-items:center;transition:var(--transition)}.refresh-btn:hover{background-color:var(--primary-dark)}.refresh-btn i{margin-right:8px}.content-section{background-color:#fff;border-radius:var(--border-radius);box-shadow:var(--box-shadow);padding:25px;margin-bottom:25px}.section-title{font-size:1.4rem;margin-bottom:20px;color:var(--primary-color);display:flex;align-items:center}.section-title i{margin-right:10px;color:var(--primary-color)}.info-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(250px,1fr));gap:15px;margin-bottom:20px}.info-card{background-color:#f8f9fa;border-left:4px solid var(--primary-color);padding:15px;border-radius:var(--border-radius)}.info-card h4{color:var(--dark-color);margin-bottom:8px;font-size:.9rem;text-transform:uppercase;letter-spacing:.5px}.info-card p{font-size:1.2rem;font-weight:600;color:var(--primary-color)}.data-table{width:100%;border-collapse:collapse;margin-top:15px}.data-table th,.data-table td{padding:12px 15px;text-align:left;border-bottom:1px solid #eee}.data-table th{background-color:#f8f9fa;font-weight:600;color:var(--primary-color)}.data-table tr:hover{background-color:#f8f9fa}.data-table .type-badge{display:inline-block;padding:3px 8px;border-radius:10px;font-size:.75rem;font-weight:500}.data-table .type-primary{background-color:rgba(67,97,238,0.1);color:var(--primary-color)}.data-table .type-foreign{background-color:rgba(231,76,60,0.1);color:var(--accent-color)}.data-table .type-unique{background-color:rgba(46,204,113,0.1);color:var(--success-color)}.suggestion-list{list-style:none}.suggestion-item{padding:15px;margin-bottom:10px;border-radius:var(--border-radius);background-color:#f8f9fa;border-left:4px solid var(--warning-color)}.suggestion-item h4{display:flex;align-items:center;margin-bottom:8px;color:var(--warning-color)}.suggestion-item h4 i{margin-right:8px}.suggestion-item p{color:#555}.stats-container{display:flex;gap:20px;margin-bottom:20px}.stat-card{flex:1;background-color:#f8f9fa;border-radius:var(--border-radius);padding:20px;text-align:center;box-shadow:0 2px 5px rgba(0,0,0,0.05)}.stat-card .stat-value{font-size:2rem;font-weight:700;color:var(--primary-color);margin-bottom:5px}.stat-card .stat-label{color:#777;font-size:.9rem}.query-list{margin-top:20px}.query-item{padding:15px;margin-bottom:10px;border-radius:var(--border-radius);background-color:#f8f9fa;border-left:4px solid var(--accent-color)}.query-item .query-time{font-weight:600;color:var(--accent-color);margin-bottom:5px}.query-item .query-text{font-family:monospace;background-color:#eee;padding:10px;border-radius:var(--border-radius);margin-top:10px;overflow-x:auto}.loading{display:flex;justify-content:center;align-items:center;height:200px}.loading i{font-size:2rem;color:var(--primary-color);animation:spin 1s linear infinite}@keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}.error-message{padding:15px;background-color:rgba(231,76,60,0.1);color:var(--accent-color);border-radius:var(--border-radius);margin:20px 0;display:flex;align-items:center}.error-message i{margin-right:10px}@media(max-width:768px){.container{flex-direction:column}.sidebar{width:100%;height:auto;position:relative}.sidebar.collapsed{width:100%;height:auto}.sidebar-content{overflow-y:visible}.stats-container{flex-direction:column}}
	]]>
	</data>
}

ClassMethod KnowYourTable(pTable As %String = "")
{
	Set json = {
	"schema": (..Schema(pTable)),
	"columns": (..Columns(pTable)),
	"indexes": (..Indices(pTable)),
	"triggers": (..Triggers(pTable)),
	"sqlProc": (..SQLProcedures(pTable)),
	"ForeignKey": (..ForeignKey(pTable)),
	"views": (..Views(pTable)),
	"queryStats": (..queryStats(pTable))
	}.%ToJSON()
	s ^za(pTable,$NOW())=json
	return json
}

ClassMethod Schema(pTable)
{
	Set pSchema = $P(pTable,".")
	Set pClass = $P(pTable,".",2)
#IF $$$CacheVersionMajor>=2024
	Set pQuery = "SELECT JSON_OBJECT('name': TABLE_NAME, 'owner': OWNER, 'shared': IS_SHARDED, 'schemaName': TABLE_SCHEMA) As tabledetails FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=? AND TABLE_NAME =?"
#ELSE
	Set pQuery = "SELECT JSON_OBJECT('name': TABLE_NAME, 'owner': OWNER, 'schemaName': TABLE_SCHEMA)As tabledetails FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=? AND TABLE_NAME =?"
#ENDIF
	Set tResult = ##class(%SQL.Statement).%ExecDirect(, pQuery, pSchema, pClass)
	Set SQLCODE = tResult.%SQLCODE
	If SQLCODE {
		Quit {}
	}
	Do tResult.%Next()
	Set json = ##class(%DynamicAbstractObject).%FromJSON(tResult.tabledetails)
	Set json.rowCount=..TableTotalCount(pTable)
	Return json
}

ClassMethod TableTotalCount(pTable As %String = "")
{
	Set tResult1 = ##class(%SQL.Statement).%ExecDirect(,"SELECT COUNT(*) As TCOUNT FROM "_pTable)
	Do tResult1.%Next()
	Return tResult1.TCOUNT
}

ClassMethod Columns(pTable As %String)
{
	Set pSchema = $P(pTable,".")
	Set pTable1 = $P(pTable,".",2)
	Set tResult = ##class(%SQL.Statement).%ExecDirect(,"SELECT COLUMN_NAME,ORDINAL_POSITION,IS_NULLABLE,IS_IDENTITY,DATA_TYPE,"_
						"COLUMN_DEFAULT,DESCRIPTION,CHARACTER_MAXIMUM_LENGTH,AUTO_INCREMENT,PRIMARY_KEY FROM INFORMATION_SCHEMA.COLUMNS where TABLE_SCHEMA=? AND TABLE_NAME=?"
						,pSchema,pTable1)
	Set SQLCODE = tResult.%SQLCODE
	If SQLCODE {
		Write $SYSTEM.SQL.Functions.SQLCODE(SQLCODE),!
		Quit 0
	}
	Set columns = []
	While tResult.%Next() {
		Set dt=tResult."DATA_TYPE"
		Set column ={
			"name":(tResult."COLUMN_NAME"),
			"position":(tResult."ORDINAL_POSITION"),
			"nullable":(tResult."IS_NULLABLE"),
			"idenity":(tResult."IS_IDENTITY"),
			"dataType":(dt_$S(dt="varchar":("("_tResult."CHARACTER_MAXIMUM_LENGTH"_")"),1:"")),
			"maxLength":(tResult."CHARACTER_MAXIMUM_LENGTH"),
			"autoIncrement":(tResult."AUTO_INCREMENT"),
			"primaryKey":(tResult."PRIMARY_KEY"),
			"description":(tResult.DESCRIPTION),
			"defaultValue":(tResult."COLUMN_DEFAULT")
		}
		Do columns.%Push(column)
	}
	Return columns
}

ClassMethod Indices(pTable As %String)
{
#IF $$$CacheVersionMajor>=2024
	Set pQuery = "SELECT JSON_ARRAYAGG(index_obj) AS all_indexes FROM (SELECT JSON_OBJECT('name': CAST(INDEX_NAME As VARCHAR),'fields': JSON_ARRAYAGG(COLUMN_NAME),'IsAsc': CAST(ASC_OR_DESC AS VARCHAR(1)),'mapStatus': MAP_STATUS,'isPrimary':PRIMARY_KEY,'unique':(1-NON_UNIQUE)) AS index_obj FROM INFORMATION_SCHEMA.INDEXES WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ? GROUP BY INDEX_NAME, ASC_OR_DESC, MAP_STATUS ) AS sub"
#ELSE
	Set pQuery = "SELECT JSON_ARRAYAGG(index_obj) AS all_indexes FROM (SELECT JSON_OBJECT('name': CAST(INDEX_NAME As VARCHAR),'fields': JSON_ARRAYAGG(COLUMN_NAME),'IsAsc': CAST(ASC_OR_DESC AS VARCHAR(1)),'mapStatus': '','isPrimary':PRIMARY_KEY,'unique':(1-NON_UNIQUE)) AS index_obj FROM INFORMATION_SCHEMA.INDEXES WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ? GROUP BY INDEX_NAME, ASC_OR_DESC ) AS sub"
#ENDIF
	Set tResult = ##class(%SQL.Statement).%ExecDirect(, pQuery, $P(pTable,"."),$P(pTable,".",2))
	Set SQLCODE = tResult.%SQLCODE
	If SQLCODE {
		Quit {}
	}
	Do tResult.%Next()
	Return ##class(%DynamicAbstractObject).%FromJSON(tResult."all_indexes")
}

ClassMethod Triggers(pTable As %String = "")
{
	Return:pTable="" {}
	Set tResult  =  ..TriggersListFunc($P(pTable,"."),$P(pTable,".",2))
	Do tResult.%Next()
	Return {}.%FromJSON(tResult.triggers)
}

Query TriggersList(pSchema As %String, pTable As %String) As %SQLQuery(ROWSPEC = "triggers:%String") [ SqlProc ]
{
SELECT
	JSON_ARRAYAGG(JSON_OBJECT(
	'name': TRIGGER_NAME,
	'event': EVENT_MANIPULATION,
	'when': ACTION_TIMING,
	'actionOrientation':ACTION_ORIENTATION,
	 'created':CREATED
	)) As triggers
FROM INFORMATION_SCHEMA.TRIGGERS WHERE TABLE_SCHEMA=:pSchema AND TABLE_NAME=:pTable
}

ClassMethod SQLProcedures(pTable)
{
	Return:pTable="" {}
	Set tResult  =  ..SQLProceduresListFunc($TR(pTable,"_","."))
	Do tResult.%Next()
	Return {}.%FromJSON(tResult.sqlproc)
}

Query SQLProceduresList(pTable) As %SQLQuery(ROWSPEC = "sqlproc:%String") [ SqlProc ]
{
	SELECT
JSON_ARRAYAGG(JSON_OBJECT(
'name':SPECIFIC_NAME ,
'type': ROUTINE_TYPE
)) As sqlproc
FROM INFORMATION_SCHEMA.ROUTINES WHERE CLASSNAME=:pTable
AND METHOD_OR_QUERY_NAME!='Extent'
}

ClassMethod ForeignKey(pTable = "zxk.frgnKeyTest.NewClass1")
{
	Set tResult = ..ForeignKeyListFunc(pTable)
	Do tResult.%Next()
	Return {}.%FromJSON(tResult.FKey)
}

Query ForeignKeyList(pTable) As %SQLQuery(ROWSPEC = "FKey:%String")
{

	SELECT
JSON_ARRAYAGG(JSON_OBJECT(
'name': Name,
'Properties':Properties,
'description': Description,
'OnDelete':OnDelete,
'OnUpdate':OnUpdate,
'sqlName':sqlName
) ) As FKey
FROM %Dictionary.CompiledForeignKey where parent=:pTable
}

/// Build array for Tables tree
ClassMethod GetTablesInt(pShowSystem, pFilter = "", Output TableJSON As %DynamicObject) As %Integer
{
	Set TableJSON = []
	Set tRS = ##class(%SQL.Manager.Catalog).TablesTreeFunc(pShowSystem, pFilter)
	While (tRS.%Next()) {
	 Do TableJSON.%Push({"name":(tRS.%Get("SCHEMA_NAME")_"."_tRS.%Get("TABLE_NAME"))})
	}
}

ClassMethod Views(pTable)
{
	Set pSchema = $P(pTable,".")
	Set pClass = $P(pTable,".",2)
	Set tResult = ..ViewsListFunc(pSchema,pClass)
	Do tResult.%Next()
	Return {}.%FromJSON(tResult.views)
}

Query ViewsList(pSchema, pTable) As %SQLQuery(ROWSPEC = "views:%String")
{

	SELECT
JSON_ARRAYAGG(
JSON_OBJECT(
'name':{fn CONCAT(VIEW_SCHEMA,{ fn CONCAT('.',VIEW_NAME)})}

)) As views
FROM INFORMATION_SCHEMA.VIEW_TABLE_USAGE
WHERE TABLE_SCHEMA=:pSchema AND TABLE_NAME=:pTable
}

ClassMethod GetTables(pShowSystem = 0)
{
	Do ..GetTablesInt(pShowSystem,,.tableJSON)
	Return tableJSON.%ToJSON()
}

ClassMethod queryStats(pTable)
{
	Set querystatus = {
		"totalQueries":(##class(%Library.SQLCatalog).GetCachedQueryTableCount(pTable))
	}
	Return querystatus
}

ClassMethod AppDescription()
{
	Q ""
}

ClassMethod Scripts()
{
	&HTML<
	<script language="javascript">
        // API endpoints (replace with your actual endpoints)
        const API_ENDPOINTS = {
            tables: '/api/tables',
            tableDetails: '/api/table-details/'
        };

        // DOM elements
         ///const toggleBtn1 = document.getElementById('toggle1SchemaBtn');
    	///const toggleIcon1 = document.getElementById('toggleIcon');
    	///const schemaInfo1 = document.getElementById('schemaInfo');

        const sidebar = document.getElementById('sidebar');
        const toggleBtn = document.getElementById('toggleBtn');
        const mainContent = document.getElementById('mainContent');
        const tableList = document.getElementById('tableList');
        const tableSearch = document.getElementById('tableSearch');
        const refreshBtn = document.getElementById('refreshBtn');
        const pageTitle = document.getElementById('pageTitle');
        const loadingState = document.getElementById('loadingState');
        const errorMessage = document.getElementById('errorMessage');
        const errorText = document.getElementById('errorText');

        // Section elements
        const schemaSection = document.getElementById('schemaSection');
        const schemaInfo = document.getElementById('schemaInfo');
        const columnsSection = document.getElementById('columnsSection');
        const columnsTable = document.getElementById('columnsTable').getElementsByTagName('tbody')[0];

        //
        const triggerSection = document.getElementById('triggerSection');
        const triggerTable = document.getElementById('triggersTable').getElementsByTagName('tbody')[0];
        //

        const sqlprocSection = document.getElementById('sqlprocSection');
        const sqlprocTable = document.getElementById('sqlprocTable').getElementsByTagName('tbody')[0];
        //
        const indexesSection = document.getElementById('indexesSection');
        const indexesTable = document.getElementById('indexesTable').getElementsByTagName('tbody')[0];
        ///
        const queryStatsSection = document.getElementById('queryStatsSection');
        const statsContainer = document.getElementById('statsContainer');
        const queryList = document.getElementById('queryList');
        //const suggestionsSection = document.getElementById('suggestionsSection');
        const suggestionList = document.getElementById('suggestionList');

        // State
        let currentTable = null;
        let tables = [];

        // Initialize the application
        document.addEventListener('DOMContentLoaded', () => {
            fetchTableList();

            // Event listeners
            toggleBtn.addEventListener('click', toggleSidebar);
            refreshBtn.addEventListener('click', () => {
                if (currentTable) {
                    fetchTableDetails(currentTable);
                } else {
                    fetchTableList();
                }
            });

            tableSearch.addEventListener('input', (e) => {
                const searchTerm = e.target.value.toLowerCase();
                filterTables(searchTerm);
            });
        });

        // Toggle sidebar visibility
        function toggleSidebar() {
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');

            // Change the icon based on sidebar state
            const icon = toggleBtn.querySelector('i');
            if (sidebar.classList.contains('collapsed')) {
                icon.classList.remove('fa-chevron-left');
                icon.classList.add('fa-chevron-right');
            } else {
                icon.classList.remove('fa-chevron-right');
                icon.classList.add('fa-chevron-left');
            }
        }

        // First API call: Get the table name list
        async function fetchTableList() {
            showLoading();
            hideError();
            hideAllSections();

            try {
                // In a real implementation, this would be:
                // const response = await fetch(API_ENDPOINTS.tables);
                // const data = await response.json();

                // Simulating API response for demo purposes
                setTimeout(() => {
                     data = #server(..GetTables())#;
                    data = JSON.parse(data);
                    tables = data;
                    renderTableList(data);
                    hideLoading();
                }, 800);
            } catch (error) {
                showError('Failed to fetch table list: ' + error.message);
                hideLoading();
            }
        }

        // Second API call: Get table details
        async function fetchTableDetails(tableName) {
            showLoading();
            hideError();
            currentTable = tableName;

            try {
                // In a real implementation, this would be:
                // const response = await fetch(`${API_ENDPOINTS.tableDetails}${tableName}`);
                // const data = await response.json();

                // Simulating API response for demo purposes
                setTimeout(() => {
                    //const data = generateMockTableDetails(tableName);

                    data = #server(..KnowYourTable(currentTable))#;

                    data = JSON.parse(data);
                    renderTableDetails(data);
                    hideLoading();
                }, 800);
            } catch (error) {
                showError('Failed to fetch table details: ' + error.message);
                hideLoading();
            }
        }

        // Render table list in sidebar
        function renderTableList(tables) {
            tableList.innerHTML = '';

            if (tables.length === 0) {
                const li = document.createElement('li');
                li.className = 'table-item';
                li.innerHTML = '<span>No tables found</span>';
                tableList.appendChild(li);
                return;
            }

            tables.forEach(table => {
                const li = document.createElement('li');
                li.className = 'table-item';
                li.innerHTML = `
                    <span><i class="fas fa-table"></i> ${table.name}</span>
                `;

                li.addEventListener('click', () => {
                    // Remove active class from all items
                    document.querySelectorAll('.table-item').forEach(item => {
                        item.classList.remove('active');
                    });

                    // Add active class to clicked item
                    li.classList.add('active');

                    // Fetch table details
                    fetchTableDetails(table.name);
                });

                tableList.appendChild(li);
            });
        }

        // Render table details
        function renderTableDetails(data) {
            // Update page title
            pageTitle.textContent = data.name;

            // Show all sections
            showAllSections();

            // Render schema info
            renderSchemaInfo(data.schema);

            // Render columns
            renderColumns(data.columns);

            // Render Triggers
            renderTriggers(data.triggers);

            // Render SQLProcedures
            renderSQLProcedures(data.sqlProc);

            // Render indexes
            renderIndexes(data.indexes);


 			// Render Views
 			renderViews(data.views);
            // Render query stats
            renderQueryStats(data.queryStats);

            // Render suggestions
            renderSuggestions(data.suggestions);
        }

        // Render schema information
        function renderSchemaInfo(schema) {
            if (!schema) {
                return 0;
            }
            schemaInfo.innerHTML = '';

            const schemaItems = [
                { title: 'Table Name', value: schema.name },
                { title: 'Schema', value: schema.schemaName },
                { title: 'Owner', value: schema.owner },
                { title: 'Rows', value: schema.rowCount.toLocaleString() },
                //{ title: 'Size', value: schema.size },
                //{ title: 'Created', value: new Date(schema.created).toLocaleDateString() },
                //{ title: 'Last Modified', value: new Date(schema.lastModified).toLocaleDateString() }
            ];

            schemaItems.forEach(item => {

                const card = document.createElement('div');
                card.className = 'info-card';
                card.innerHTML = `
                    <h4>${item.title}</h4>
                    <p>${item.value}</p>
                `;
                schemaInfo.appendChild(card);
            });
        }

        // Render columns
        function renderColumns(columns) {
            columnsTable.innerHTML = '';

            columns?.forEach(column => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${column.name}</td>
                    <td>${column.dataType}</td>
                    <td>${column.nullable ? 'Yes' : 'No'}</td>
                    <td>${column.defaultValue || '-'}</td>
                    <td>${column.description || '-'}</td>
                `;
                columnsTable.appendChild(row);
            });
        }

         // Render triggers
        function renderTriggers(triggers) {
            triggers.innerHTML = '';
            triggers?.forEach(trigger => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${trigger.name}</td>
                    <td>${trigger.event}</td>
                    <td>${trigger.when }</td>
                    <td>${trigger.actionOrientation || '-'}</td>
                    <td>${trigger.created || '-'}</td>
                `;
                triggerTable.appendChild(row);
            });
        }

        // Render SQLProcedures
        function renderSQLProcedures(sqlprocs) {
            sqlprocTable.innerHTML = '';
            sqlprocs?.forEach(sqlproc => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${sqlproc.name}</td>
                    <td>${sqlproc.type}</td>
                `;
               sqlprocTable.appendChild(row);
            });
        }

        // Render indexes
        function renderIndexes(indexes) {
            indexesTable.innerHTML = '';
 			if (Array.isArray(indexes) && indexes.length > 0) {
            indexes.forEach(index => {
                const row = document.createElement('tr');

                let typeClass = 'type-primary';
                if (index.type === 'Primary Key') typeClass = 'type-primary';
                else if (index.type === 'Foreign Key') typeClass = 'type-foreign';
                else if (index.type === 'Unique') typeClass = 'type-unique';

                row.innerHTML = `
                    <td>${index.name}</td>
                    <td>${Array.isArray(index.fields)
					        ? index.fields.join(', ')
					        : (index.fields ?? '')}</td>
                    <td>${index.IsAsc}</td>
                    <td>${index.unique ? 'Yes' : 'No'}</td>
                    <td>${index.isPrimary? 'Yes' : 'No'}</td>
                    <td>${index.mapStatus}</td>
                `;
                indexesTable.appendChild(row);
            });
 			}
        }

        // Render Views
        function renderViews(views) {
            viewTable.innerHTML = '';
 			if (Array.isArray(views) && views.length > 0) {
            views.forEach(view => {
                const row = document.createElement('tr');

                row.innerHTML = `
                    <td>${view.name}</td>

                `;
                viewTable.appendChild(row);
            });
 			}
        }

        // Render query statistics
        function renderQueryStats(queryStats) {
            // Render stats cards

            if (!queryStats) {
                return 0;
            }
            statsContainer.innerHTML = '';

            const stats = [
                { title: 'Total Cached Queries', value: queryStats.totalQueries },
                //{ title: 'Avg Execution Time', value: queryStats.avgExecutionTime + ' ms' },
                //{ title: 'Slowest Query', value: queryStats.slowestQueryTime + ' ms' },
                //{ title: 'Queries Last 24h', value: queryStats.recentQueries }
            ];

            stats?.forEach(stat => {
                const card = document.createElement('div');
                card.className = 'stat-card';
                card.innerHTML = `
                    <div class="stat-value">${stat.value}</div>
                    <div class="stat-label">${stat.title}</div>
                `;
                statsContainer.appendChild(card);
            });

            // Render query list
            queryList.innerHTML = '';

            queryStats.slowestQueries?.forEach(query => {
                const item = document.createElement('div');
                item.className = 'query-item';
                item.innerHTML = `
                    <div class="query-time">${query.executionTime} ms</div>
                    <div>Executed ${new Date(query.timestamp).toLocaleString()}</div>
                    <div class="query-text">${query.queryText}</div>
                `;
                queryList.appendChild(item);
            });
        }

        // Render performance suggestions
        function renderSuggestions(suggestions) {
            if (!suggestions){
                return 0;
            }

            suggestionList.innerHTML = '';

            suggestions.forEach(suggestion => {
                const item = document.createElement('li');
                item.className = 'suggestion-item';
                item.innerHTML = `
                    <h4><i class="fas fa-exclamation-triangle"></i> ${suggestion.title}</h4>
                    <p>${suggestion.description}</p>
                `;
                suggestionList.appendChild(item);
            });
        }

        // Filter tables based on search term
        function filterTables(searchTerm) {
            const filteredTables = tables.filter(table =>
                table.name.toLowerCase().includes(searchTerm)
            );
            renderTableList(filteredTables);
        }

        // Show loading state
        function showLoading() {
            loadingState.style.display = 'flex';
        }

        // Hide loading state
        function hideLoading() {
            loadingState.style.display = 'none';
        }

        // Show error message
        function showError(message) {
            errorText.textContent = message;
            errorMessage.style.display = 'flex';
        }

        // Hide error message
        function hideError() {
            errorMessage.style.display = 'none';
        }

        // Show all sections
        function showAllSections() {
            schemaSection.style.display = 'block';
            columnsSection.style.display = 'block';
            triggerSection.style.display = 'block';
            indexesSection.style.display = 'block';
            queryStatsSection.style.display = 'block';
            //suggestionsSection.style.display = 'block';
            viewSection.style.display = 'block';
            sqlprocSection.style.display = 'block';
        }

        // Hide all sections
        function hideAllSections() {
            schemaSection.style.display = 'none';
            columnsSection.style.display = 'none';
            indexesSection.style.display = 'none';
            queryStatsSection.style.display = 'none';
            //suggestionsSection.style.display = 'none';
            triggerSection.style.display = 'none';
            sqlprocSection.style.display = 'none';
            viewSection.style.display = 'none';
        }

    toggleBtn.addEventListener('click', () => {
        if (schemaInfo1.style.display === 'none') {
            schemaInfo1.style.display = 'flex'; // or 'block' depending on your CSS
            toggleIcon1.textContent = '▼'; // down arrow
        } else {
            schemaInfo1.style.display = 'none';
            toggleIcon1.textContent = '▶'; // right arrow
        }
    });
    </script>
	>
}

}
