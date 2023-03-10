Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F8C8820
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Mar 2023 14:47:51 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1763e201bb4so6096533fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 10 Mar 2023 06:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72GZ6tt+NtMByXBprOsf1R5lfkGwkm3Xw8kwN9b+yWo=;
        b=g4o1Lb4CtznAJJE9tTXMnJbLAXprSv72/iyGFozsR+ZpxFjk1xxtjTlxbZRzNHe/Et
         I7IbhEdfJHPFihK4TXp9xw7k/gf6RqEmkQndon+kyuwN0BUwN98DU2ZALknfNV7QW898
         tlotLG+uDV3KjyC4bhiyd5FjRan6dHOxp/sRfPhiGNM8J1TpkBIDJCUwM2SV+/9DlISi
         twQN5LjaXcVzbYtcnzUiY57AuCuFTCQLCzBWWwBlIiPITEuGorsX6Fo5+FJ3UV5rKZn3
         lDf26q8mX0ISIJsuHsa0LcG0YmLmWPTGurfW8AsdwJemCDPcxYmR7qVZ7nHi2wwKgaEP
         6TjA==
X-Gm-Message-State: AO0yUKWS7mKKYGJ2whteaIVJ4McC6T0k8/jG/K9RRsijxeiWC4Vcu5AP
	ktgt7XwxQ4bCEGYtonU5uQ==
X-Google-Smtp-Source: AK7set9JuJayVFavWfSPxdB9MZVNOuRYl8Z6r6VhwjgRJ6ZHv32dVupXnUJFExVxqSPdm4Mkjz4oFw==
X-Received: by 2002:a05:6870:e886:b0:15e:c4e1:c9fb with SMTP id q6-20020a056870e88600b0015ec4e1c9fbmr5624135oan.31.1678459670465;
        Fri, 10 Mar 2023 06:47:50 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o20-20020a9d7194000000b0068657984c22sm124712otj.32.2023.03.10.06.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:50 -0800 (PST)
Received: (nullmailer pid 1547067 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:36 -0000
From: Rob Herring <robh@kernel.org>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: sun6i: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:36 -0600
Message-Id: <20230310144736.1547041-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/rtc/rtc-sun6i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7038f47d77ff..dc76537f1b62 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -260,7 +260,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	}
 
 	/* Switch to the external, more precise, oscillator, if present */
-	if (of_get_property(node, "clocks", NULL)) {
+	if (of_property_present(node, "clocks")) {
 		reg |= SUN6I_LOSC_CTRL_EXT_OSC;
 		if (rtc->data->has_losc_en)
 			reg |= SUN6I_LOSC_CTRL_EXT_LOSC_EN;
-- 
2.39.2

