Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624126;
	b=m7F2ztyMg5eE0TfrsSw9R1PxHKHsq4yA59pt3P4MLfiG8rU+lkYvumsrMp/1VzG++QSf
	 GK2yxHmtbYiKe/RMdf7JWqWYnzome215+5UKkOblp81B1JfhgB75DkfogpMyfCZglahLE
	 Y5YQeJ5HanA1HcPV6SeHg6pLrakuPJsvC+x97YolmnfCHdNQB0UiBJZ+E7+R90IAtFeGZ
	 c9WJjfEOOkxxU8FlLFn4RO25CfqIkylCyX/IPwhI20WOM8Rs0OqTXBwdXYZWMkw8L2MOH
	 816yWVK9nn0ZntVDFCZEjsihsMruUAhT2KV7twiMg0Jil/87CbbP7OY7vPjROly0mCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
	b=LcdeL64MIAxAgInUOJlJ78DmlKYuX6zQA+3myGagEYzo4UmrQy7pvDdqCtOJIjVFwNeZ
	 0BOFpNuAS1s1BgJBajqyzyYaTLx3YIQsP+Q4cIYz9G8kIBFXHr0trAqJ/hHX5Asqa0vjV
	 3EBey0EsTik1Vi22MNX1wQc39P/wvCGdkCaHthPLoFkKLHzJTXksoDjmysHDoVpTtOn+g
	 VMp0Wnxx1Zo1X17MLbKPpMwqf+arCTiFmmpEtyzDuWy4TLkn4t7RcKVSi8AvyKW/3h6I2
	 ln6016NLSVMvnTMTmxTuERhfm7tNOu5zWA1v/kI+l6r6tKNKHmpPEQaUPFy4jK7pYew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lt2SRHGT;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B8606A326
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 16:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lt2SRHGT
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3475679f8f.2
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 08:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624124; x=1796228924; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
        b=Lt2SRHGTJFXIq5tsQWOVxKi/dt57DYLhzEPIAcqVwCCxb8PbGa7+SLFBFQ7gpAYTyO
         9So8ijrf/wiqdicvfIykrUt1jqBUtl7U8rZgRD1HCkL/QIA42ybJC7OR/5k+iFy+6ZdP
         LkQrZz6gqF3lkK5xxB0p+CzYqpm4FMdz+YqH394nXbl/fUoWSb65lhUP5j0HdoOYI6SL
         gM3l99F7hKOFJSS0ZHdNCl3ZBgOJ1bJPDtw9LXXRiaGfdiYGppbQXNNOCFtyTERL6TYZ
         E8SBTnCmuZZwmcvd+by6koJgxm5I5oDcfM0egJOhqUb38DXk7V4mju4Vf2qiITweuUPj
         VfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624124; x=1796228924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
        b=aoXmWGBdJHZz8r3WFtM+A8FEXHPchaSJYdfj6kXITyczVp03A/5koVzsFsYIfDpHIQ
         rftt/Hjqrt21WtU0bMdMg9IH03shsjx9BRKfBJDtd9dm2nmAtzcBXD0g/gCsKPM0KZuF
         ePEs0jxgmyrgrXmunpaUH+wJec5zwNkErZNOqyPcZfd5LjRlcVQAaCb1o7wXyH3c1CW3
         otchRe/64Rqi0BJmO2Z0Er1xM9u+EE7FHee6B+HeT0TDPaMOmGVPqu/N1sl3RFb7diMP
         0BAZALzQEy0catsUSc//knEoFcJuX7qMtCWsFwbHJrartVnw9zOmX8vyJ0nWDdXKGTtW
         enVA==
X-Forwarded-Encrypted: i=1; AL+hErFCYF+ijvtRdyPs1n8FP0inoxHM7ufYFKnIG34RJcLHIGtplA03Z0ciGTT6CDDUaTpWAPL3FPojqBuLZw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+QSTfi/AdmUeHP65s+VqQ88dIITJcYwBm1iPG4VTHlkQKqb06s
	PgiSHFx/f0MXtVoS2o1GrTp76NHXCAr5D9awJeBtkc26qsLB24D1RdoVhfv78mEsPxA=
X-Gm-Gg: AZFdTZcHvBNuNxV2ByPjFySa29Au7kKwWDm2Uywc3q/cuZbfwO1a8eEZcOIwd8Iwpxr
	qK7oHoRWpKx8/YlrheN/d2h5rsHWO5w3YBOjUlfgsOE+mNk+myfeGMFKW7JnYnjtEBp006954/x
	VC5Uj9B2Yi1LBFqSw/fy5Z+NqnBLu2ISvhVNj9bIsSd7Uxu0me2KVKvdKOlvA2j050FEMP2R3g0
	2d3NxWdG54rN+STEIlGCxCrf0f7hVVCtabPXw9FbVQruSQeW2tKllylzNjzG76jbSnU2/uv+H8X
	eZ77KDRTgYJkd8vZfGm/GEKN5XOuvGtCJMxUKepgUGzyz6foYCOBZKGFU+6qokXJTD2HsKPaDbJ
	8Fk+DpGMWzUDIINqQBy57kREarBamHetGbjqGKl9JMYwiXAY1qNSXDWx5HCD12y8c3TXy5nnEtY
	ZEgxP1eRBngH6g/+iVIZQzMsabNzansEWwkmdw6U9vihQphzSwiWIinqS+W8Wn5FwBK8/LAwsoj
	ZRas1VJDZHqFMBJSk4s90RSPc1xwRO7UY/GQZhds6XRSghKmUmUaQ16HFl8hLYBSTKEh1G2ZIYY
	0S4euLmj30c5/eQ/BW6H83ObK5FcBqBkEESvYMfhmRd5mA==
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr361648545e9.16.1795624123960;
        Wed, 25 Nov 2026 08:28:43 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:43 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:29 +0000
Subject: [PATCH 03/10] mtd: maps: int0800: Use named initializers for
 acpi_device_id
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-3-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=833;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=blggJzzi34PPFng5frzDjV1f6bR0P7BZrevZFLsW314=;
 b=ZHZnM3Lf8DzUboiERoH/ypcNIiAQvRVlt4l5CMlhz7vJ+CymRE50z5L8UPm9qLmBzcXPpEYvV
 3V+SKJgc8HhAzjwEkWT9COXnLzIMM7NmIiKpGWF+rOcWTSAb6lbGtOg
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/int0800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
index 1f5a7c4936dd..feb721908989 100644
--- a/drivers/mtd/maps/int0800.c
+++ b/drivers/mtd/maps/int0800.c
@@ -88,7 +88,7 @@ static void int0800_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int0800_ids[] = {
-	{ "INT0800", 0 },
+	{ .id = "INT0800" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, int0800_ids);

-- 
2.53.0

