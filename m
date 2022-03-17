Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91BD2F30
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 18:30:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CA36168F;
	Thu, 17 Mar 2022 11:30:55 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0B313F7F5;
	Thu, 17 Mar 2022 11:30:53 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: soc@kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/5] ARM: configs: multi_v5_defconfig: re-enable CONFIG_V4L_PLATFORM_DRIVERS
Date: Thu, 17 Mar 2022 18:30:40 +0000
Message-Id: <20220317183043.948432-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317183043.948432-1-andre.przywara@arm.com>
References: <20220317183043.948432-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 06b93644f4d1 ("media: Kconfig: add an option to filter in/out
platform drivers") introduced CONFIG_MEDIA_PLATFORM_SUPPORT, to allow
more fine grained control over the inclusion of certain Kconfig files.
multi_v5_defconfig was selecting some drivers described in
drivers/media/platform/Kconfig, which now wasn't included anymore.

Explicitly set the new symbol in multi_v5_defconfig to bring those
drivers back.
This enables some new V4L2 and VIDEOBUF2 features, but as modules only.

Fixes: 06b93644f4d1 ("media: Kconfig: add an option to filter in/out platform drivers")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/configs/multi_v5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 5d754aad0272..dfbca8a683e2 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -181,6 +181,7 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_ASPEED=m
 CONFIG_VIDEO_ATMEL_ISI=m
-- 
2.25.1

