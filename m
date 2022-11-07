Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D33C23AA
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 05:22:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 465B75C00E4;
	Mon,  7 Nov 2022 00:22:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 07 Nov 2022 00:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1667798524; x=1667884924; bh=XD
	A3FKsc76rlojguBycbOIx3Fn5VWhQv5XilLE+sJ+A=; b=PJJ03aomEKNvG4K++e
	y1aLwfUnffFpdWsTfmTKJpxoXP7t59VqioldNaNEti2Cb7+rjVjmNgjsirdgfGOV
	UmMJw+hzGgjLmj4xwSqlJYwtRWofjcsRqENODjO2MCdFCQHKwhvHY/LDe97q0FQe
	wU82LfaqWvNotZKToK0iC9AhfhTF4zynFsAsxNIZZme3ztaSL0e5uFbmzmIOm77Y
	fMBeEqeCmxcXTC4VlyxVyUWJTpinvjLcEFfTbKIfz0AudlbCro2R69AeE/xOrO1q
	wfmAU3GfU9a9T5DM7VhTI06I/FoPFpiPHpH8ZPHNXU83AFoPt60Rfkv0/TM7EPsq
	xloQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1667798524; x=1667884924; bh=XDA3FKsc76rlo
	jguBycbOIx3Fn5VWhQv5XilLE+sJ+A=; b=LO2jjsdMv3AVo4I43Pu1T2H1FSvhI
	bgWREETf65iS8638m79Tnm6/qLCLDhBP+yab6F+QaUxIXiuQjhIv5b/tUVE3Uk2k
	TJ0bpgFsMm7QWG/qnn2CCYS06m6QnTMBQGBpcXTsHXOsVcGgG9YN+wASHeTArSC+
	ErUFW+oh3BQgxBrRmoOrhgHh6rHgfaoSHjNv9DjTVQPquhSZDKAcjJ0zQbuYNgsB
	1FgYX9Cbyor5yU2LY6bnbv2iDZyA0cyvMa8CGxNMBvBiMyvV81RBqlvrnigFS1LC
	NCNmDt2obSbmBgxYQ7xyDXlf3wKNp50MLf9xDEfKTxU7MRvz5nSa75VvA==
X-ME-Sender: <xms:_JVoY3si8I-auicL329w1gGD_AoH88pEuD4AMidzgjrJlRbbY4_ggg>
    <xme:_JVoY4dMk8N8sAlXgxPMerML94zaCuNwdKWVSkyoV2xOlheAHGCkfnq1tiu6MGkSr
    hxjv37lP97-p6NlDg>
X-ME-Received: <xmr:_JVoY6w3TTJ6dll9n9hr9icLzXBf8CHz4_3Bov7FgjrucinmLTziNeYKrTHh8hJfroCkta5NOJi0W682Hax7gRn0qmcTdxWy55DaMC2U-mWbLZfSMIYfb8hoy6cnYa0HXEVBWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdejgdekvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:_JVoY2OoWIoJ4jHBKgHISppBN6nOXyg_-yFjodwqLRGjqiv9inLpbg>
    <xmx:_JVoY39okOD9a9kufzLpnnJ6ddJrUxcBmTADBTG21kwWvG5NBBuFog>
    <xmx:_JVoY2U0WVMRaHjyk1nknA0ncR1qhRDymv-QFlT-kL7uuYXkB7RqWA>
    <xmx:_JVoYykcCPs9r_ILBS6-V0RdLtOCP8nAJDqTSK0xWaM69wYwpkruWA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 00:22:03 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 1/2] bus: sunxi-rsb: Remove shutdown callback
Date: Sun,  6 Nov 2022 23:21:59 -0600
Message-Id: <20221107052201.65477-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221107052201.65477-1-samuel@sholland.org>
References: <20221107052201.65477-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shutting down the RSB controller prevents communicating with a PMIC
inside pm_power_off(), so it breaks system poweroff on some boards.

Reported-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Fixes: 843107498f91 ("bus: sunxi-rsb: Implement suspend/resume/shutdown callbacks")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

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

