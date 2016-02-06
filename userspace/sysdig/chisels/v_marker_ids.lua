--[[
Copyright (C) 2013-2015 Draios inc.
 
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 2 as
published by the Free Software Foundation.


This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

view_info = 
{
	id = "marker_ids",
	name = "01Markers",
	description = "Show the top system calls in the system based on number of invocations and time spent calling them.",
	tags = {"Default"},
	view_type = "table",
	applies_to = {"", "container.id", "proc.pid", "proc.name", "thread.tid", "fd.directory", "evt.res", "k8s.pod.id", "k8s.rc.id", "k8s.svc.id", "k8s.ns.id"},
	use_defaults = true,
	filter = "marker.ntags>=%depth+1",
	drilldown_target = "markers",
	spectro_type = "markers",
	drilldown_increase_depth = true,
	columns = 
	{
		{
			name = "NA",
			field = "marker.id",
			is_key = true
		},
		{
			name = "ID",
			field = "marker.id",
			description = "The unique numeric ID of the marker.",
			colsize = 10,
		},
		{
			name = "TIME",
			field = "marker.latency.fortag[%depth]",
			description = "average time this marker took to complete",
			colsize = 10,
			aggregation = "AVG",
			is_sorting = true,
		},
		{
			name = "TAG",
			field = "marker.tag[%depth]",
			description = "Marker tag.",
			colsize = 32,
			aggregation = "SUM"
		},
	}
}
