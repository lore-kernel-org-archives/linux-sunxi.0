Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A48E2C82
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Nov 2021 01:52:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 682B8101E;
	Tue,  9 Nov 2021 17:52:46 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16ED53F800;
	Tue,  9 Nov 2021 17:52:44 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Simon Glass <sjg@chromium.org>,
	Samuel Holland <samuel@sholland.org>
Subject: Pull request: u-boot-sunxi/master fix for 2022.01
Date: Wed, 10 Nov 2021 01:51:14 +0000
Message-Id: <20211110015114.32585-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Hi Tom,

as discussed, please pull this patch to disable the watchdog on sunxi
boards by default. The watchdog only got enabled in this release cycle,
and its short period breaks actual users (Debian installer).

Thanks,
Andre

========================
The following changes since commit e8e9c6f48400989c5fc54467576f8d535bd713e6:

  Merge https://source.denx.de/u-boot/custodians/u-boot-samsung (2021-11-09 15:05:33 -0500)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 86798ee0c148db248d8e3e9b6395bbe9e24d9149:

  watchdog: don't autostart watchdog on Sunxi boards (2021-11-10 01:38:07 +0000)

----------------------------------------------------------------
Heinrich Schuchardt (1):
      watchdog: don't autostart watchdog on Sunxi boards

 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)
