Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7461367
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jun 2023 00:08:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48AF915BF;
	Tue,  6 Jun 2023 17:09:05 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61A7C3F587;
	Tue,  6 Jun 2023 17:08:18 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/5] sunxi: dram: make MBUS configuration functions static
Date: Wed,  7 Jun 2023 01:07:41 +0100
Message-Id: <20230607000745.10245-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20230607000745.10245-1-andre.przywara@arm.com>
References: <20230607000745.10245-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usage of the C keyword "inline" seems to be a common
misunderstanding: it's a *hint* only, and modern compilers will inline
(or not) functions based on their own judgement and provided compiler
options.
So while marking functions as "inline" does not do much, missing the
"static" keyword will force to compiler to spell out a version of the
function for potential external callers, which actually increases the
code size (though hopefully the linker will drop the function).

Change the "inline" attribute for the mbus_configure_port() functions in
some Allwinner DRAM drivers to "static", so that the explicit version
can actually be dropped from the object file, reducing the code size.

"static inline" has a use case in header files, where it avoids a warning
if a .c file including this header does not use the particular function.
In a .c file itself "static inline" is not useful otherwise, so just use
static here as well.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h6.c   |  3 ++-
 arch/arm/mach-sunxi/dram_sun50i_h616.c |  2 +-
 arch/arm/mach-sunxi/dram_sunxi_dw.c    | 18 +++++++++---------
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
index b332f3a3e4a..bff2e42513c 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
@@ -93,7 +93,8 @@ enum {
 	MBUS_QOS_HIGH,
 	MBUS_QOS_HIGHEST
 };
-inline void mbus_configure_port(u8 port,
+
+static void mbus_configure_port(u8 port,
 				bool bwlimit,
 				bool priority,
 				u8 qos,
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 1f9416d6eaf..02f6b2a06d4 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -31,7 +31,7 @@ enum {
 	MBUS_QOS_HIGHEST
 };
 
-inline void mbus_configure_port(u8 port,
+static void mbus_configure_port(u8 port,
 				bool bwlimit,
 				bool priority,
 				u8 qos,
diff --git a/arch/arm/mach-sunxi/dram_sunxi_dw.c b/arch/arm/mach-sunxi/dram_sunxi_dw.c
index 4af5922f334..9382d3d0be8 100644
--- a/arch/arm/mach-sunxi/dram_sunxi_dw.c
+++ b/arch/arm/mach-sunxi/dram_sunxi_dw.c
@@ -81,15 +81,15 @@ enum {
 	MBUS_QOS_HIGHEST
 };
 
-static inline void mbus_configure_port(u8 port,
-				       bool bwlimit,
-				       bool priority,
-				       u8 qos,         /* MBUS_QOS_LOWEST .. MBUS_QOS_HIGEST */
-				       u8 waittime,    /* 0 .. 0xf */
-				       u8 acs,         /* 0 .. 0xff */
-				       u16 bwl0,       /* 0 .. 0xffff, bandwidth limit in MB/s */
-				       u16 bwl1,
-				       u16 bwl2)
+static void mbus_configure_port(u8 port,
+				bool bwlimit,
+				bool priority,
+				u8 qos,         /* MBUS_QOS_LOWEST .. MBUS_QOS_HIGEST */
+				u8 waittime,    /* 0 .. 0xf */
+				u8 acs,         /* 0 .. 0xff */
+				u16 bwl0,       /* 0 .. 0xffff, bandwidth limit in MB/s */
+				u16 bwl1,
+				u16 bwl2)
 {
 	struct sunxi_mctl_com_reg * const mctl_com =
 			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
-- 
2.35.8

