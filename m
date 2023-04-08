Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE88EA1
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 00:26:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3814613D5;
	Fri,  7 Apr 2023 17:27:32 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 896513F6C4;
	Fri,  7 Apr 2023 17:26:46 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Anatolij Gustschin <agust@denx.de>
Cc: Lukasz Majewski <lukma@denx.de>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sean Anderson <seanga2@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/2] video: sunxi: dw-hdmi: complement partial OF conversion
Date: Sat,  8 Apr 2023 01:26:37 +0100
Message-Id: <20230408002639.26241-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.7
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Out of the initial "video: sunxi: dw-hdmi: Partial OF conversion" series
the last two patches have not been merged that, because I had some
comments about the proper split between of_to_plat() and probe().

Those two patches are those remaining ones, but with the reset/clocks
and power supply setup split between of_to_plat() and probe().

Please have a look!
Thanks,
Andre

Changelog v1 ... v2:
- drop first three patches: already merged
- do DT property reads in of_to_plat(), enable in probe()

Samuel Holland (2):
  video: sunxi: dw-hdmi: Use DM for clock gates and resets
  video: sunxi: dw-hdmi: Use DM for HVCC regulator

 drivers/video/sunxi/sunxi_dw_hdmi.c | 36 ++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 6 deletions(-)

-- 
2.35.7

