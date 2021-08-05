Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B0170
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Aug 2021 05:12:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.west.internal (Postfix) with ESMTP id 62E3E2B00475;
	Thu,  5 Aug 2021 01:12:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 05 Aug 2021 01:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm3; bh=twhTTkXFTaNa0
	JKFc4hyiam+oxDA9ilOzTNkxYn0QVU=; b=PkXgn16HgvSTUUdp6giJJ9zviZhK5
	YoexSA5yHmTUNPltoiP5mAxmqsWqgUCAFZE9ck3QdGZTqRC/vtAM8R4VJIWB+dan
	BHlYAj/FRZH5J8p4tWMd8xf+V9LK1jsbDbPdsjIhzKBq50zp6VSCjae3oIvSkoRN
	XmhXcUJwn0R8z0jfTweb1SaTF44lplH/G5fkKyRMUgFZVLwjNT2rXS+OnnYABXlF
	fYMwwB6BIa6FOgPfBsyyU55jW7OzY2EA5QQuJxZDR0eXIpgx4Snrwck0FrzURLwY
	jpg3stCs9G9kKmtSwgcoTK9E5uyEvx6cYdTxoiD3sA+CNrP0PDMguZYBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=twhTTkXFTaNa0JKFc4hyiam+oxDA9ilOzTNkxYn0QVU=; b=N91rrRY5
	cU4Qo/kWYt562kutCyBFODu28K8np5yaqzV2WJD+iZCVFY7nam/DScOE3Qrm2P0g
	nlbkOojuvniVOAkcDpY7ZnZnb46NzVtLFPFO6MLzISFjK1Nw8L2nLOhTZYIXY94z
	zThs9JdJw8qOMfg8ipCzSPc0+oUd7yY3hj65llYkElpMYzOHSj41vFzFYnwbmhKY
	JB1K+64R6y78VQZimEM8oJYlEgP69h9mqe4syOb9Gv45LP00CXaARLYkRqJDZBB4
	4w0iIgAPEkbap92NYBvUswR3qMmcpSmuEbWBtna9699VNyQ1elDnj16X5xX3iU0W
	5/0kpuf+3K/PDA==
X-ME-Sender: <xms:T3MLYWK6nCm4i-mYnGmkteOFDD1aCVb_G5BdRaH-tjiCPYFOvr_BOA>
    <xme:T3MLYeKDfZ1nJfGM4oS8kiKpdj1U37rR81uGRturVC7SIKi6ovQQZGy2JmJ0kh6yB
    CY16AGukMX3xIU8bw>
X-ME-Received: <xmr:T3MLYWuLplqQJKYJ-ZHws7fvEMBEwB9e7gH0doed8V2P98UJLWrlBkjNjWyaBXiVyiM3XOPE2xEEaZoSu6qg0FGri3Tr7pySAfzAEMWpBYgfcJSC8laqn5ucPPUHsnvdzjyROw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:T3MLYbbqss8FZWj0XX95tEdKX2-GRp5eNXjiiz9qFXZOR-th-7iacw>
    <xmx:T3MLYdY3GZ4Z9redfNmlvcCCsBjFUbqHWv5RscupUckzgU39W7_kbA>
    <xmx:T3MLYXCmFYed_WBYgpPCRlzJA0OuSlEHpvAcNpFA5A8KnmPT9qrGrQ>
    <xmx:UHMLYaRrNXS7u6bEAL8qs-tiRjPOZZ-gMY0gh8VKeU-M1SMVxyOBQCcBg4M>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 01:12:47 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Ondrej Jirman <megous@megous.com>
Subject: [PATCH resend v3 2/2] input: sun4i-lradc-keys - Add wakup support
Date: Thu,  5 Aug 2021 00:12:41 -0500
Message-Id: <20210805051241.47168-3-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805051241.47168-1-samuel@sholland.org>
References: <20210805051241.47168-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ondrej Jirman <megous@megous.com>

Allow the driver to wake the system on key press if the "wakeup-source"
property is provided in the device tree. Using the LRADC as a wakeup
source requires keeping the AVCC domain active during sleep. Since this
has a nontrivial impact on power consumption (sometimes doubling it),
disable the LRADC wakeup source by default.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 4a796bed48ac..af1683d68c8c 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -22,6 +22,8 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/pm_wakeup.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -226,8 +228,7 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 {
 	struct sun4i_lradc_data *lradc;
 	struct device *dev = &pdev->dev;
-	int i;
-	int error;
+	int error, i, irq;
 
 	lradc = devm_kzalloc(dev, sizeof(struct sun4i_lradc_data), GFP_KERNEL);
 	if (!lradc)
@@ -272,8 +273,11 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 	if (IS_ERR(lradc->base))
 		return PTR_ERR(lradc->base);
 
-	error = devm_request_irq(dev, platform_get_irq(pdev, 0),
-				 sun4i_lradc_irq, 0,
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	error = devm_request_irq(dev, irq, sun4i_lradc_irq, 0,
 				 "sun4i-a10-lradc-keys", lradc);
 	if (error)
 		return error;
@@ -282,6 +286,14 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	if (device_property_read_bool(dev, "wakeup-source")) {
+		device_set_wakeup_capable(dev, true);
+
+		error = dev_pm_set_wake_irq(dev, irq);
+		if (error)
+			dev_warn(dev, "Failed to set wake IRQ\n");
+	}
+
 	return 0;
 }
 
-- 
2.26.3

