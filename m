Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6542560
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Jan 2023 13:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4544C433D2;
	Mon, 30 Jan 2023 13:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675083897;
	bh=mmPMPIPmQMBoM9TxOjnSVNcnUXCZeV3N+dzz5BQ8urI=;
	h=From:To:Cc:Subject:Date:From;
	b=ss/YBlVwPSRzs68eTT278PeUuCwFSeUvVRaBWbMkEovzKNJSh9hA8CXy0R6NarH4Z
	 xexXO/NA2ryynCT0d4dIwEuN7c4CpOdsoIO+1eQOLLf5CmOvl7+HnvPU9ptQ+juVdi
	 ryJMEEBmez8NHlPbyyuS9HPNdkNxoF9upX6d2f5wy36c+qsz54eeVmX2Pe9kXdYQpV
	 VhusaCAykFEHQoknQx12e2NJGBbTpInzV2tUVlAIzotJgduSqEa8yREdu2+Js9QqIR
	 w2RiclDurtDUfsS4lTn7GI4VoWMrO4lRdg6oc6wBVxBVDKjLkFBMGg39mVuY++WFVK
	 q0CfgpeOYMeoQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: sunxi: select CONFIG_PM
Date: Mon, 30 Jan 2023 14:04:47 +0100
Message-Id: <20230130130453.379749-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Selecting CONFIG_PM_GENERIC_DOMAINS without CONFIG_PM leads to a
build failure:

WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
  Depends on [n]: PM [=n]
  Selected by [y]:
  - SUN20I_PPU [=y] && (ARCH_SUNXI [=n] || COMPILE_TEST [=y])

drivers/base/power/domain_governor.c: In function 'default_suspend_ok':
drivers/base/power/domain_governor.c:85:24: error: 'struct dev_pm_info' has no member named 'ignore_children'
   85 |         if (!dev->power.ignore_children)
      |                        ^
drivers/base/power/domain.c: In function 'genpd_queue_power_off_work':
drivers/base/power/domain.c:657:20: error: 'pm_wq' undeclared (first use in this function)
  657 |         queue_work(pm_wq, &genpd->power_off_work);
      |                    ^~~~~

Unfortunately platforms are inconsistent between using 'select PM'
and 'depends on PM' here. CONFIG_PM is a user-visible symbol, so
in principle we should be using 'depends on', but on the other hand
using 'select' here is more common among drivers/soc. Go with the
majority for now, as this has a smaller risk of introducing circular
dependencies. We may need to clean this up for consistency later.

Fixes: 0e30ca5ab0a8 ("soc: sunxi: Add Allwinner D1 PPU driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/sunxi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/sunxi/Kconfig b/drivers/soc/sunxi/Kconfig
index 29e9ba2d520d..02d0b338feb3 100644
--- a/drivers/soc/sunxi/Kconfig
+++ b/drivers/soc/sunxi/Kconfig
@@ -23,6 +23,7 @@ config SUNXI_SRAM
 config SUN20I_PPU
 	bool "Allwinner D1 PPU power domain driver"
 	depends on ARCH_SUNXI || COMPILE_TEST
+	select PM
 	select PM_GENERIC_DOMAINS
 	help
 	  Say y to enable the PPU power domain driver. This saves power
-- 
2.39.0

