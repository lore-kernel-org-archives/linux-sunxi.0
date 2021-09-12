Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696853FC3
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Sep 2021 09:50:47 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id i3so4409479wmq.3
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Sep 2021 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZfUDMjhaBW28irP63CnwhnXUauvV+ceBbmfpoRw/Bl8=;
        b=T1/hhsyBRS2DZ/592/U9LVU+905MkddkZ7e1nzYGxk3NrFdUaONbjuCPUU+gYQAHf6
         a1qCH3aWLd+2sKyN1+2zeYJQLYcEL/LZZwvW/b6O4juccBqfNW4nQncgbff+UwRkuXd4
         zKp96LxjFMOVlsVhsiJDad//D8305kdp21qeIu6Sd+AbbolgW+OSAkDc9EoWo9V8a48i
         nv9/oBTQwPlH4eCmKGCMoZTQ00ZQooVtNjRSwqL5zCep+fL3NLkM+nXrDeuo8xBKk/aH
         l0HebZCPiIoQrqZ6ZwIOfvpcBoeuQ861jdq4/sIkzWS9K030Sj/hYNhrbd5bZXL+ZUI5
         vzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZfUDMjhaBW28irP63CnwhnXUauvV+ceBbmfpoRw/Bl8=;
        b=fNeCfKr9tLIIuJhY/OoK5a7WV6NAdoypmI1qPrhz0/+VviszP2OMfIDLMYnnydJZLw
         qxQ2bbl6dGg7SVbz7xGU+sDdyHxdgEkdiBZ7h64oidnP1Z9qltLUU1axOmWxJXx4y0Os
         rGQW70Zk8xegNHFTpqSX3WWBpafcyXquNBi6F7EM49M8nUYYE5doVAgkEQOieekm2v59
         qidW/B6hmbhR0iwiW+Qf/pQJ0LjH3qUCRQ/Yw6SZYWQ3M2Tn5CtgdecRZ5U9P9gBU//s
         iQCMe1THZLdtqKprkap/rsFgxmLLudwJR2IyDka9BbMKoSii83nR1301PIoe32pSd4Rr
         zMdA==
X-Gm-Message-State: AOAM530nfk2s10ais/OAzfdf1mOW874jEEoYvTfBWDuwaSfN4B1w7kHT
	AyVL3OWFFhUYbMmG4vkQJOA=
X-Google-Smtp-Source: ABdhPJyzMQK6uGv0+edsUnseYhz0bylpHJqwuQWPA5iwYb8Cj0rz5723JiK4lVGjA+DXjoqok7/erg==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr1464839wmj.16.1631440245762;
        Sun, 12 Sep 2021 02:50:45 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id n13sm3471487wmq.3.2021.09.12.02.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 02:50:45 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: a64: Add GPU opp table
Date: Sun, 12 Sep 2021 11:50:32 +0200
Message-Id: <20210912095032.2397824-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPU on A64 currently runs at default frequency, which is 297 MHz. This
is a bit low in some cases and noticeable lag can be observed in GPU
rendered UIs. GPU is capable to run at 432 MHz.

Add GPU OPP table.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 6ddb717f2f98..5ba379078500 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -102,6 +102,22 @@ de: display-engine {
 		status = "disabled";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-120000000 {
+			opp-hz = /bits/ 64 <120000000>;
+		};
+
+		opp-312000000 {
+			opp-hz = /bits/ 64 <312000000>;
+		};
+
+		opp-432000000 {
+			opp-hz = /bits/ 64 <432000000>;
+		};
+	};
+
 	osc24M: osc24M_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
@@ -1103,6 +1119,7 @@ mali: gpu@1c40000 {
 			clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
 			clock-names = "bus", "core";
 			resets = <&ccu RST_BUS_GPU>;
+			operating-points-v2 = <&gpu_opp_table>;
 		};
 
 		gic: interrupt-controller@1c81000 {
-- 
2.33.0

