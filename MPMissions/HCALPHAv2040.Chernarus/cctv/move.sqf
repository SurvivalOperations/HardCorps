/****************************************************************************
Copyright (C) 2013 Maca134
This program is free software under the terms of the GNU General Public License version 3.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
@authors maca134.co.uk
@version 1.00
@date 20130707
*****************************************************************************/
private ["_cam", "_positions"];

_cam = _this select 0;
_positions = _this select 1;

while {true} do {
	_cam camSetTarget (_positions select 1);
	_cam camCommit CCTV_time_int;
	waitUntil {camCommitted _cam};
	sleep CCTV_time_int;

	_cam camSetTarget  (_positions select 0);
	_cam camCommit CCTV_time_int;
	waitUntil {camCommitted _cam};
	sleep CCTV_time_int;
};