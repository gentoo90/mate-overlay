# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2 eutils versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://www.zavedil.com/wp-content/uploads/2013/12/${P}.tar.gz"
DESCRIPTION="MATE panel applet that shows which of the Lock keys are on and which are off"
HOMEPAGE="http://www.zavedil.com/mate-lock-keys-applet/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
RESTRICT="mirror"

RDEPEND=">=dev-libs/glib-2.26:2
	x11-libs/libX11
	>=mate-base/mate-panel-1.6:0
	>=dev-libs/dbus-glib-0.80:0
	virtual/libintl:0
	>=x11-libs/gtk+-2.14:2"

DEPEND="${RDEPEND}
	>=app-text/scrollkeeper-dtd-1:1.0
	dev-util/intltool:*
	sys-devel/gettext:*
	virtual/pkgconfig:*"

src_install() {
	gnome2_src_install
	rm -f "${ED}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
