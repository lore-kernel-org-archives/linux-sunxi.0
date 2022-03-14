Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0AE138F
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Mar 2022 07:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E7BC36AFD;
	Mon, 14 Mar 2022 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647244562;
	bh=q3oaScT2EmtXSaRkzmR6NjuVY1KCMcgFf9MDlddpwi0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kgUxgcyA0L4EzWgUW+0GZdu7zjJndYSGtySAhri+wyitNI2zSCTSi66GQp68sx/Ro
	 aOb/LslsPI3rZuirNjLOiUk38BdfqGfXLJfh59A1+YiuBFRV1QXajbvRG0XgyFs+t4
	 q2Bv+kA9wXW4xAxzLcF+G99yGTiHMUW+/1jl3G8FtikcXXnBl4kzRIgKeekVcB8FgW
	 2ZMShfRfFxh3IbM9/e6NLiKjW+OK4H5rhC4e0bLZkAPEk4bs/Yao6fMlN1xAXBkgTs
	 fW+6UaPALpkCxlwCFrpPdImt+cCEVp88s6NIL+VlfcVH7V6DzCXPyBDR92IZrbaZAX
	 8x4rzJKgfJnKw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1nTfYd-001kWd-RZ; Mon, 14 Mar 2022 08:55:59 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Ming Qian <ming.qian@nxp.com>,
	Robert Foss <robert.foss@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 38/64] media: platform: move some manufacturer entries
Date: Mon, 14 Mar 2022 08:55:30 +0100
Message-Id: <0ba67acab6a8757cb0d2588881d5a0907b0bb178.1647242579.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647242578.git.mchehab@kernel.org>
References: <cover.1647242578.git.mchehab@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As there are 4 manufacturer's directories with multiple sources
(qcom, rockchip, sti and sunxi), move the sources from
platform/Kconfig to their specific Konfig files.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/

 drivers/media/platform/Kconfig          | 13 +++----------
 drivers/media/platform/qcom/Kconfig     |  4 ++++
 drivers/media/platform/rockchip/Kconfig |  3 +++
 drivers/media/platform/sti/Kconfig      |  5 +++++
 drivers/media/platform/sunxi/Kconfig    |  2 ++
 5 files changed, 17 insertions(+), 10 deletions(-)
 create mode 100644 drivers/media/platform/qcom/Kconfig
 create mode 100644 drivers/media/platform/rockchip/Kconfig
 create mode 100644 drivers/media/platform/sti/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index b7c60969c974..e3316fa37a8f 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -77,23 +77,16 @@ source "drivers/media/platform/mtk-vpu/Kconfig"
 source "drivers/media/platform/nxp/Kconfig"
 source "drivers/media/platform/omap/Kconfig"
 source "drivers/media/platform/omap3isp/Kconfig"
-source "drivers/media/platform/qcom/camss/Kconfig"
-source "drivers/media/platform/qcom/venus/Kconfig"
+source "drivers/media/platform/qcom/Kconfig"
 source "drivers/media/platform/renesas/Kconfig"
-source "drivers/media/platform/rockchip/rga/Kconfig"
-source "drivers/media/platform/rockchip/rkisp1/Kconfig"
+source "drivers/media/platform/rockchip/Kconfig"
 source "drivers/media/platform/s3c-camif/Kconfig"
 source "drivers/media/platform/s5p-g2d/Kconfig"
 source "drivers/media/platform/s5p-jpeg/Kconfig"
 source "drivers/media/platform/s5p-mfc/Kconfig"
-source "drivers/media/platform/sti/bdisp/Kconfig"
-source "drivers/media/platform/sti/c8sectpfe/Kconfig"
-source "drivers/media/platform/sti/delta/Kconfig"
-source "drivers/media/platform/sti/hva/Kconfig"
+source "drivers/media/platform/sti/Kconfig"
 source "drivers/media/platform/stm32/Kconfig"
 source "drivers/media/platform/sunxi/Kconfig"
-source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
-source "drivers/media/platform/sunxi/sun8i-rotate/Kconfig"
 source "drivers/media/platform/tegra/vde/Kconfig"
 source "drivers/media/platform/ti-vpe/Kconfig"
 source "drivers/media/platform/via/Kconfig"
diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
new file mode 100644
index 000000000000..9f6c91cc95ca
--- /dev/null
+++ b/drivers/media/platform/qcom/Kconfig
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+source "drivers/media/platform/qcom/camss/Kconfig"
+source "drivers/media/platform/qcom/venus/Kconfig"
diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
new file mode 100644
index 000000000000..2f97c0e0268a
--- /dev/null
+++ b/drivers/media/platform/rockchip/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+source "drivers/media/platform/rockchip/rga/Kconfig"
+source "drivers/media/platform/rockchip/rkisp1/Kconfig"
diff --git a/drivers/media/platform/sti/Kconfig b/drivers/media/platform/sti/Kconfig
new file mode 100644
index 000000000000..9fb5e78a92cf
--- /dev/null
+++ b/drivers/media/platform/sti/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+source "drivers/media/platform/sti/bdisp/Kconfig"
+source "drivers/media/platform/sti/c8sectpfe/Kconfig"
+source "drivers/media/platform/sti/delta/Kconfig"
+source "drivers/media/platform/sti/hva/Kconfig"
diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
index 7151cc249afa..a10032215b08 100644
--- a/drivers/media/platform/sunxi/Kconfig
+++ b/drivers/media/platform/sunxi/Kconfig
@@ -2,3 +2,5 @@
 
 source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
 source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
+source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
+source "drivers/media/platform/sunxi/sun8i-rotate/Kconfig"
-- 
2.35.1

