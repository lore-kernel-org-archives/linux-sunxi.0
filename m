Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137632C80
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jan 2022 13:37:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 241FD101E;
	Fri, 21 Jan 2022 05:37:38 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E11853F766;
	Fri, 21 Jan 2022 05:37:36 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chris Morgan <macromorgan@hotmail.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 0/2] sunxi: Add option to prevent boot on plug-in
Date: Fri, 21 Jan 2022 13:37:30 +0000
Message-Id: <20220121133732.2397273-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sometimes it is desirable to prevent a board from automatically booting
as soon as the power cable is plugged in. For boards with an AXP PMIC,
we can actually query the power up source.

Add a AXP_DISABLE_BOOT_ON_POWERON Kconfig option to enable this
behaviour.
Patch 1 prepares the PMIC header files to export the same symbol, which
Chris' patch 2 then uses to do the actual work.

I rearranged Chris' code to get rid of the nasty #ifdef's. This function
is already a "good" example of why #ifdefs are bad, we don't need to add
to that. I will try to clean that up further, but for now this doesn't
need to block this patch.

Cheers,
Andre.

Andre Przywara (1):
  pmic: axp: define ALDO_IN startup bit

Chris Morgan (1):
  sunxi: Add option to prevent booting on power plug-in

 arch/arm/mach-sunxi/Kconfig | 10 ++++++++++
 board/sunxi/board.c         | 11 +++++++++++
 include/axp152.h            |  2 ++
 include/axp209.h            |  3 ++-
 include/axp221.h            |  3 ++-
 include/axp305.h            |  3 +++
 include/axp809.h            |  3 ++-
 include/axp818.h            |  3 ++-
 8 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.25.1

