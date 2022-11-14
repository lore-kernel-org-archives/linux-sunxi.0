Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A7610F2
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 01:57:54 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 982523200913;
	Sun, 13 Nov 2022 20:57:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 13 Nov 2022 20:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1668391073; x=1668477473; bh=E9
	uIAIxUjiZh/NqdAFhxdQQd6pb0o+DNnALIZuHYHOs=; b=OfbZpT/d/nCucpY8If
	Ivz1X1vBDXH5hM0CnqfATv4F0RBYtu3ri+xhPjSNzqa6EVAS74FI5DGhJUnMeZtB
	prKBAR2MBPoqmVT0h+90mRc+Mu1HCp7lo+S4WWyP3Hhse8FXmWl0ZhSxLd1xiygS
	Kcw6lsupErjYf9B3lEZoF3wekUSWiO+qdPwoEPUzOxC/jaQPviZXpjIxJ3F3MBVl
	qdt0892WkXxgGonzlOIezXS6MtB5Na6rdMy4MhL7yPDRlkvEiPGNVeDOHoMbTDuR
	43nLOPeS35A0oGcRhmY41jC5xCHygNqBuNOkZllpLGoiRWg/H1UrWsvyqqkqHMEw
	9oCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1668391073; x=1668477473; bh=E9uIAIxUjiZh/
	NqdAFhxdQQd6pb0o+DNnALIZuHYHOs=; b=tKxDvCrOnkcyDpWUGhUNVe+DjapTA
	+CI67IjdnEL+FPgyZ+uw3EbJFtY/pOT+MinYhI+WcRatng9gUZE7vlKnux+wQ7Hs
	AbQy5u1cGG0s5lJ5ktUzKTYfDwgwaEJ7VUF0A0kLzCELBiZ2vNJVln3lnCRBfvn/
	5gJHzsxRzy86xshLtvXABOHKe0+VIe2NAMJU/VeMDwTFEj0PYYjbDvKo00M8o2tG
	Gof4nKZvZUn78y6SNqlcN/hRAUai/4lkRSIzQ2fk2TB3W6yt6anWZR5MRbO3DVqj
	mONBzyqyHlkLr8gIDvi6SUaxwCXBnPBvzaJpXnZRE0Mgc7WJJkfPHksuA==
X-ME-Sender: <xms:oaBxYyzX8n4jkVtSziMogRwxt3wOm4Bi5cJ_Nw7pqmf3mR5pS0ifQg>
    <xme:oaBxY-RBPQdcNJcGi-W6VQbiGSLVZRgFH4Te9JCYl5fvtZ3TQDOKv48V6TgRRqQrC
    SOguGjskzmVKY0arA>
X-ME-Received: <xmr:oaBxY0U-2ItKgjgFBPEBHjkEcQWVPhtdIn9g6ImJYIyiMG4ZMWRe1hne_7u7wCH6-NILOj0vvELQT_KeVCx2TtUCbZJ0YKBKpLgikPfN8wDGMaaoDjRZcybFWPVEYc4nltxMmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedugdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:oaBxY4jtg1V_8juU0A0-CMfelEQ3tbsmgzbh8Cwiwf4-FqLLm8V-jw>
    <xmx:oaBxY0AXOBbcdR6Y_ptc9t1V8MlpAGLjPQ4jus5aOCITwtuq8GIdwg>
    <xmx:oaBxY5ICrEogovIkMma7RrKVY9Gf9_Oto-EFklQaSkT4kLJg31kF4g>
    <xmx:oaBxY21ftMx1vY0nX7hJ5sfgAqaLU4Xe1craM-aTSGY9FV5otsDltg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Nov 2022 20:57:52 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 1/3] bus: sunxi-rsb: Remove the shutdown callback
Date: Sun, 13 Nov 2022 19:57:47 -0600
Message-Id: <20221114015749.28490-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221114015749.28490-1-samuel@sholland.org>
References: <20221114015749.28490-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shutting down the RSB controller prevents communicating with a PMIC
inside pm_power_off(), since that gets called after device_shutdown(),
so it breaks system poweroff on some boards.

Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Fixes: 843107498f91 ("bus: sunxi-rsb: Implement suspend/resume/shutdown callbacks")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v3:
 - Adjust patch 1 commit message

 drivers/bus/sunxi-rsb.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 4cd2e127946e..17343cd75338 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -812,14 +812,6 @@ static int sunxi_rsb_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static void sunxi_rsb_shutdown(struct platform_device *pdev)
-{
-	struct sunxi_rsb *rsb = platform_get_drvdata(pdev);
-
-	pm_runtime_disable(&pdev->dev);
-	sunxi_rsb_hw_exit(rsb);
-}
-
 static const struct dev_pm_ops sunxi_rsb_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(sunxi_rsb_runtime_suspend,
 			   sunxi_rsb_runtime_resume, NULL)
@@ -835,7 +827,6 @@ MODULE_DEVICE_TABLE(of, sunxi_rsb_of_match_table);
 static struct platform_driver sunxi_rsb_driver = {
 	.probe = sunxi_rsb_probe,
 	.remove	= sunxi_rsb_remove,
-	.shutdown = sunxi_rsb_shutdown,
 	.driver	= {
 		.name = RSB_CTRL_NAME,
 		.of_match_table = sunxi_rsb_of_match_table,
-- 
2.37.3

