Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2370469E
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Sep 2022 17:16:11 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id d5so5560364wms.5
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Sep 2022 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xKKdd8knaUF4CfPFiItNEFQjHw2lmLd2sFP0gotQUoc=;
        b=OhBlx7noH+o5DvkRo55BFAvGqEBFZcHvM076WOAMakk4X1YAbEnD/4zZSPoUbMLKn8
         GCqLozvfg3sM4eF/Z3B8AN6BGh3DmqameOTtjxVdiOmRt9/s8lmsuJjlipE/lJpt4KIa
         i6PNhjzwlOIk8MVESBsN7sSFzU8kOocHRA2kEEatE0iZdD4cIYt0gYLkQ65bDDnpfebw
         4jhXzF8iOqpcFee11lLITmknguDUQOJ+TzZ6/gMKNBraL4smwbOgPKYNd7zrlzOyizXO
         LqG9iD19V4ooKXT/p1JlKI5lGjlShW45Zgp11uP6mEbh2Jhk448+GFJ2pxY29k92mIm3
         CzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xKKdd8knaUF4CfPFiItNEFQjHw2lmLd2sFP0gotQUoc=;
        b=52DvY3yMX+q5CV4k28LyhLZB/QPI4ll/vVYNzIucoLEetkoQoA2+tsB2bZPOKhUHqF
         K9Np9NZk64tXkMdcYoIpf/4UvAtr23XmuO3gOynD1yzbePkFYAr6f7G1GiNjKHrQNOZd
         +Fmd0oZgpuTD9o2+iuPrSa7X/rJuzM3bQQPjbNlWtBZ/HTKKJfmphJIEtprL5Bc/TEts
         spyoX8PDQm0iXAooEMtcfFoRM7CPRg4EiMyl70gLiCeH5UYjDylq+25189if0R5Gyfb/
         OJB1kRE6ZYz91M5nPBvFv6uxxLwTGziSr9NfOuYMzX4jXkzL5igrVhu/lG35PHpprx3T
         LOrA==
X-Gm-Message-State: ACgBeo1ffnJDyFVqzkJv99urK7KV5IJPxU6Pojw9Y8QDmFaYx6UpokOa
	5cODCPk11+IDHePGUvmv2tw=
X-Google-Smtp-Source: AA6agR5ueP099YrXQqJOQ1y3ebsmQjU3lSxyWHTXdI0uL4Aptie+Igfzf06D0NoHF6W2grQdgoviIw==
X-Received: by 2002:a05:600c:1912:b0:3a5:f4fc:cd40 with SMTP id j18-20020a05600c191200b003a5f4fccd40mr11400213wmq.205.1662398170173;
        Mon, 05 Sep 2022 10:16:10 -0700 (PDT)
Received: from Clement-Blade14.home (2a01cb000c0d3d00995730c36491d21b.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:9957:30c3:6491:d21b])
        by smtp.gmail.com with ESMTPSA id v22-20020a7bcb56000000b003a5ad7f6de2sm11437072wmj.15.2022.09.05.10.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 10:16:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 3/5] arm64: dts: allwinner: h6: Add GPU OPP table
Date: Mon,  5 Sep 2022 19:15:59 +0200
Message-Id: <20220905171601.79284-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905171601.79284-1-peron.clem@gmail.com>
References: <20220905171601.79284-1-peron.clem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an Operating Performance Points table for the GPU to
enable Dynamic Voltage & Frequency Scaling on the H6.

The voltage range is set with minival voltage set to the target
and the maximal voltage set to 1.2V. This allow DVFS framework to
work properly on board with fixed regulator.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
new file mode 100644
index 000000000000..b48049c4fc85
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-gpu-opp.dtsi
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (C) 2022 Clément Péron <peron.clem@gmail.com>
+
+/ {
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-216000000 {
+			opp-hz = /bits/ 64 <216000000>;
+			opp-microvolt = <810000 810000 1200000>;
+		};
+
+		opp-264000000 {
+			opp-hz = /bits/ 64 <264000000>;
+			opp-microvolt = <810000 810000 1200000>;
+		};
+
+		opp-312000000 {
+			opp-hz = /bits/ 64 <312000000>;
+			opp-microvolt = <810000 810000 1200000>;
+		};
+
+		opp-336000000 {
+			opp-hz = /bits/ 64 <336000000>;
+			opp-microvolt = <810000 810000 1200000>;
+		};
+
+		opp-360000000 {
+			opp-hz = /bits/ 64 <360000000>;
+			opp-microvolt = <820000 820000 1200000>;
+		};
+
+		opp-384000000 {
+			opp-hz = /bits/ 64 <384000000>;
+			opp-microvolt = <830000 830000 1200000>;
+		};
+
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <840000 840000 1200000>;
+		};
+
+		opp-420000000 {
+			opp-hz = /bits/ 64 <420000000>;
+			opp-microvolt = <850000 850000 1200000>;
+		};
+
+		opp-432000000 {
+			opp-hz = /bits/ 64 <432000000>;
+			opp-microvolt = <860000 860000 1200000>;
+		};
+
+		opp-456000000 {
+			opp-hz = /bits/ 64 <456000000>;
+			opp-microvolt = <870000 870000 1200000>;
+		};
+
+		opp-504000000 {
+			opp-hz = /bits/ 64 <504000000>;
+			opp-microvolt = <890000 890000 1200000>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+			opp-microvolt = <910000 910000 1200000>;
+		};
+
+		opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-microvolt = <930000 930000 1200000>;
+		};
+
+		opp-624000000 {
+			opp-hz = /bits/ 64 <624000000>;
+			opp-microvolt = <950000 950000 1200000>;
+		};
+
+		opp-756000000 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-microvolt = <1040000 1040000 1200000>;
+		};
+	};
+};
+
+&gpu {
+	operating-points-v2 = <&gpu_opp_table>;
+};
-- 
2.34.1

