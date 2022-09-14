Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D27E3D62
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Sep 2022 15:12:35 +0000 (UTC)
Received: from dimapc.. (109-252-122-187.nat.spd-mgts.ru [109.252.122.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F2E056601D89;
	Wed, 14 Sep 2022 16:12:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663168353;
	bh=ydjcQ1QOFS4WSgFT533j3Ns+CFkrINqmO/sGexuEFqg=;
	h=From:To:Cc:Subject:Date:From;
	b=Mx2EmglggWsdosfaVzyUtCqlosAam1q3Gq4svO37Op5pjDeyYwEDmhVtmVx/7cuSJ
	 13oO3Hf7QXSKUvt3W5erP3NrKdF4k2E3VOtWHo7B/GlLe2d/J8IyfmXnmGvAIP3qtA
	 nVq3nBzfZUDUshJW7Cp67Th75nIGt3frnLX4mnQls93RV7ti4L6/EnieZGdJyYLP2M
	 0AcJ9i0SHY195qfrFLmCpCSV5reMg/cSYC/JQiFH6coRAjjQa7r9NlLLddWQpQC5yj
	 XISb0U2l0LIEvoLer2JNrgXmejoeSkHacqL3pVrrmJAHKpPHRnUzEgBOoJ2PpmA0t6
	 bjO/ku+XNqpLw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1] ARM: dts: sun8i: h3: orangepi-pc: Add CMA reserved memory node
Date: Wed, 14 Sep 2022 18:11:25 +0300
Message-Id: <20220914151125.212876-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 256MB CMA node to the Orange Pi PC board. This fixes memory allocation
failures for Cedrus video decoder on trying to play a 1080p video with
gstreamer.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
index b96e015f54ee..e655346a9fb4 100644
--- a/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts
@@ -60,6 +60,20 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,cma@40000000 {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x40000000 0x40000000>;
+			size = <0x10000000>; /* 256MiB */
+			linux,cma-default;
+			reusable;
+		};
+	};
+
 	connector {
 		compatible = "hdmi-connector";
 		type = "a";
-- 
2.37.3

