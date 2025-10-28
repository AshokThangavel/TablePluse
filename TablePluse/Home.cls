Class TablePluse.Home Extends %CSP.Page
{
Parameter Title As STRING = "TablePluse";

ClassMethod OnPage() As %Status
{
	Do ..OnPageCSPROOT()
	Quit 1
}

ClassMethod AppDescription()
{
	Q ""
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

ClassMethod LoadCSS()
{
	Set obj = ##class(%Dictionary.CompiledXData).%OpenId($Classname()_"||Style")
	Return:(obj = "") $$$OK
	Set xdata = obj.Data
	Set status = ##class(%XML.TextReader).ParseStream(xdata, .textreader)
	While textreader.Read() { If (textreader.NodeType="chars") { Write textreader.Value } }
	Return $$$OK
}

ClassMethod OnRenderScreen() As %Status
{
	&HTML<

<body>
    <div class="app-container">
        <!-- Main Application Screen -->
        <div class="main-screen" id="mainScreen">
            <!-- Sidebar -->
            <div class="sidebar" id="sidebar">
                <div class="sidebar-header">
                    <h2>TablePluse</h2>
                    <button class="toggle-btn" id="toggleBtn">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                </div>

                <div class="sidebar-content">
                    <ul class="menu-list">
                        <li class="menu-item active">
                            <i class="fas fa-home"></i>
                            <span>Dashboard</span>
                        </li>
                        <a href="TablePluse.TableMeta.Table.KnowYourTable.cls" target="_blank"><li class="menu-item" id="irisTablesMenuItem">
                            <i class="fas fa-database"></i>
                            <span>IRIS Tables</span>
                        </li></a>
                        <!--li class="menu-item">
                            <i class="fas fa-chart-bar"></i>
                            <span>Analytics</span>
                        </li>
                        <li class="menu-item">
                            <i class="fas fa-cog"></i>
                            <span>Settings</span>
                        </li>
                        <li class="menu-item">
                            <i class="fas fa-question-circle"></i>
                            <span>Help</span>
                        </li-->
                    </ul>
                </div>
            </div>

            <!-- Main Content -->
            <div class="main-content" id="mainContent">
                <div class="welcome-section">
                    <h1>Welcome to TablePluse</h1>
                    <p>Your comprehensive table management and analytics platform. Explore, analyze, and optimize your database tables with powerful tools and insights.</p>
                </div>

                <div class="features-grid">
                    <div class="feature-card">
                        <i class="fas fa-database"></i>
                        <h3>Table Schema</h3>
                        <p>Manage and organize your database tables with an intuitive interface.</p>
                    </div>
                    <!--div class="feature-card">
                        <i class="fas fa-search"></i>
                        <h3>Advanced Search</h3>
                        <p>Find the data you need quickly with our powerful search capabilities.</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-chart-line"></i>
                        <h3>Performance Analytics</h3>
                        <p>Monitor and optimize table performance with detailed analytics.</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-sync-alt"></i>
                        <h3>Data Synchronization</h3>
                        <p>Keep your data synchronized across multiple systems seamlessly.</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-shield-alt"></i>
                        <h3>Security & Compliance</h3>
                        <p>Ensure your data is secure and meets compliance requirements.</p>
                    </div>
                    <div class="feature-card">
                        <i class="fas fa-users"></i>
                        <h3>Collaboration Tools</h3>
                        <p>Work together with your team using our collaboration features.</p>
                    </div-->
                </div>
            </div>
        </div>
        </div>
    </div>

	>
	q 1
}

/// Write your styles here
XData Style
{
<data>
	<![CDATA[
:root{--primary-color:#4361ee;--primary-dark:#3a56d4;--primary-light:#5a7aff;--secondary-color:#3498db;--accent-color:#e74c3c;--success-color:#2ecc71;--warning-color:#f39c12;--light-color:#ecf0f1;--dark-color:#2c3e50;--border-radius:5px;--box-shadow:0 2px 10px rgba(0,0,0,0.1);--transition:all 0.3s ease}*{margin:0;padding:0;box-sizing:border-box}body{font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;background-color:#f5f7fa;color:var(--dark-color);line-height:1.6}.app-container{display:flex;min-height:100vh}.main-screen{display:flex;width:100%}.sidebar{width:300px;background-color:var(--primary-color);color:#fff;box-shadow:2px 0 5px rgba(0,0,0,0.1);transition:var(--transition);overflow:hidden;display:flex;flex-direction:column}.sidebar.collapsed{width:60px}.sidebar-header{background-color:var(--primary-dark);padding:15px;display:flex;justify-content:space-between;align-items:center}.sidebar-header h2{font-size:1.2rem;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.sidebar.collapsed .sidebar-header h2{display:none}.sidebar-content{padding:20px;flex:1;overflow-y:auto;transition:var(--transition)}.sidebar.collapsed .sidebar-content{padding:10px}.toggle-btn{background:none;border:none;color:#fff;cursor:pointer;font-size:1.2rem;transition:var(--transition)}.toggle-btn:hover{transform:rotate(180deg)}.menu-list{list-style:none;margin-top:20px}.menu-item{padding:12px 15px;margin-bottom:5px;border-radius:var(--border-radius);cursor:pointer;transition:var(--transition);display:flex;align-items:center}.menu-item:hover{background-color:rgba(255,255,255,0.1)}.menu-item.active{background-color:var(--primary-light)}.menu-item i{margin-right:10px;font-size:1.1rem}.sidebar.collapsed .menu-item span{display:none}.main-content{flex:1;padding:30px;overflow-y:auto;transition:var(--transition)}.main-content.expanded{margin-left:0}.welcome-section{background-color:#fff;border-radius:var(--border-radius);box-shadow:var(--box-shadow);padding:30px;margin-bottom:30px;text-align:center}.welcome-section h1{color:var(--primary-color);font-size:2.5rem;margin-bottom:15px}.welcome-section p{color:#666;font-size:1.1rem;max-width:800px;margin:0 auto}.features-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(300px,1fr));gap:25px;margin-top:30px}.feature-card{background-color:#fff;border-radius:var(--border-radius);box-shadow:var(--box-shadow);padding:25px;text-align:center;transition:var(--transition)}.feature-card:hover{transform:translateY(-5px);box-shadow:0 5px 15px rgba(0,0,0,0.1)}.feature-card i{font-size:2.5rem;color:var(--primary-color);margin-bottom:15px}.feature-card h3{color:var(--primary-color);margin-bottom:10px}.feature-card p{color:#666}.iris-tables-screen{display:none;width:100%}.iris-tables-container{display:flex;min-height:100vh}.iris-tables-sidebar{width:300px;background-color:var(--primary-color);color:#fff;box-shadow:2px 0 5px rgba(0,0,0,0.1);transition:var(--transition);overflow:hidden;display:flex;flex-direction:column}.iris-tables-sidebar.collapsed{width:60px}.iris-tables-header{background-color:var(--primary-dark);padding:15px;display:flex;justify-content:space-between;align-items:center}.iris-tables-header h2{font-size:1.2rem;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.iris-tables-sidebar.collapsed .iris-tables-header h2{display:none}.iris-tables-sidebar-content{padding:20px;flex:1;overflow-y:auto;transition:var(--transition)}.iris-tables-sidebar.collapsed .iris-tables-sidebar-content{padding:10px}.back-btn{background-color:var(--primary-color);color:#fff;border:none;padding:10px 20px;border-radius:var(--border-radius);cursor:pointer;display:flex;align-items:center;transition:var(--transition);margin-bottom:20px}.back-btn:hover{background-color:var(--primary-dark)}.back-btn i{margin-right:8px}.iris-tables-main-content{flex:1;padding:30px;overflow-y:auto;transition:var(--transition)}.iris-tables-main-content.expanded{margin-left:0}.iris-tables-header-section{display:flex;justify-content:space-between;align-items:center;margin-bottom:30px;padding-bottom:15px;border-bottom:1px solid #ddd}.iris-tables-header-section h1{font-size:2rem;color:var(--primary-color)}.iris-tables-refresh-btn{background-color:var(--primary-color);color:#fff;border:none;padding:10px 20px;border-radius:var(--border-radius);cursor:pointer;display:flex;align-items:center;transition:var(--transition)}.iris-tables-refresh-btn:hover{background-color:var(--primary-dark)}.iris-tables-refresh-btn i{margin-right:8px}.content-section{background-color:#fff;border-radius:var(--border-radius);box-shadow:var(--box-shadow);padding:25px;margin-bottom:25px}.section-title{font-size:1.4rem;margin-bottom:20px;color:var(--primary-color);display:flex;align-items:center}.section-title i{margin-right:10px;color:var(--primary-color)}.info-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(250px,1fr));gap:15px;margin-bottom:20px}.info-card{background-color:#f8f9fa;border-left:4px solid var(--primary-color);padding:15px;border-radius:var(--border-radius)}.info-card h4{color:var(--dark-color);margin-bottom:8px;font-size:.9rem;text-transform:uppercase;letter-spacing:.5px}.info-card p{font-size:1.2rem;font-weight:600;color:var(--primary-color)}.data-table{width:100%;border-collapse:collapse;margin-top:15px}.data-table th,.data-table td{padding:12px 15px;text-align:left;border-bottom:1px solid #eee}.data-table th{background-color:#f8f9fa;font-weight:600;color:var(--primary-color)}.data-table tr:hover{background-color:#f8f9fa}.data-table .type-badge{display:inline-block;padding:3px 8px;border-radius:10px;font-size:.75rem;font-weight:500}.data-table .type-primary{background-color:rgba(67,97,238,0.1);color:var(--primary-color)}.data-table .type-foreign{background-color:rgba(231,76,60,0.1);color:var(--accent-color)}.data-table .type-unique{background-color:rgba(46,204,113,0.1);color:var(--success-color)}.suggestion-list{list-style:none}.suggestion-item{padding:15px;margin-bottom:10px;border-radius:var(--border-radius);background-color:#f8f9fa;border-left:4px solid var(--warning-color)}.suggestion-item h4{display:flex;align-items:center;margin-bottom:8px;color:var(--warning-color)}.suggestion-item h4 i{margin-right:8px}.suggestion-item p{color:#555}.stats-container{display:flex;gap:20px;margin-bottom:20px}.stat-card{flex:1;background-color:#f8f9fa;border-radius:var(--border-radius);padding:20px;text-align:center;box-shadow:0 2px 5px rgba(0,0,0,0.05)}.stat-card .stat-value{font-size:2rem;font-weight:700;color:var(--primary-color);margin-bottom:5px}.stat-card .stat-label{color:#777;font-size:.9rem}.query-list{margin-top:20px}.query-item{padding:15px;margin-bottom:10px;border-radius:var(--border-radius);background-color:#f8f9fa;border-left:4px solid var(--accent-color)}.query-item .query-time{font-weight:600;color:var(--accent-color);margin-bottom:5px}.query-item .query-text{font-family:monospace;background-color:#eee;padding:10px;border-radius:var(--border-radius);margin-top:10px;overflow-x:auto}.loading{display:flex;justify-content:center;align-items:center;height:200px}.loading i{font-size:2rem;color:var(--primary-color);animation:spin 1s linear infinite}@keyframes spin{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}.error-message{padding:15px;background-color:rgba(231,76,60,0.1);color:var(--accent-color);border-radius:var(--border-radius);margin:20px 0;display:flex;align-items:center}.error-message i{margin-right:10px}.search-box{position:relative;margin-bottom:20px;transition:var(--transition)}.iris-tables-sidebar.collapsed .search-box{display:none}.search-box input{width:100%;padding:10px 40px 10px 15px;border-radius:var(--border-radius);border:none;background-color:rgba(255,255,255,0.1);color:#fff;font-size:14px}.search-box input::placeholder{color:rgba(255,255,255,0.7)}.search-box i{position:absolute;right:15px;top:50%;transform:translateY(-50%);color:rgba(255,255,255,0.7)}.table-list{list-style:none;transition:var(--transition)}.iris-tables-sidebar.collapsed .table-list{display:none}.table-item{padding:12px 15px;margin-bottom:5px;border-radius:var(--border-radius);cursor:pointer;transition:var(--transition);display:flex;justify-content:space-between;align-items:center}a{text-decoration:none;color:#fff}.table-item:hover{background-color:rgba(255,255,255,0.1)}.table-item.active{background-color:var(--primary-light)}.table-item i{margin-right:10px}.table-badge{background-color:rgba(255,255,255,0.2);padding:2px 8px;border-radius:10px;font-size:.7rem}@media(max-width:768px){.main-screen,.iris-tables-container{flex-direction:column}.sidebar,.iris-tables-sidebar{width:100%;height:auto}.sidebar.collapsed,.iris-tables-sidebar.collapsed{width:100%;height:auto}.stats-container{flex-direction:column}}
	]]>>
</data>
}

ClassMethod Scripts()
{
	&HTML<
    <script language="javascript">
    const toggleBtn = document.getElementById('toggleBtn');
    document.addEventListener('DOMContentLoaded', () => {
            // Main screen event listeners
            toggleBtn.addEventListener('click', toggleMainSidebar);
			}
			);
        function toggleMainSidebar() {
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
    </script>
	>
}

}