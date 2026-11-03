Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700314;
	b=oTE29XMjjsr7brboa2iaGgdimGhmS+L2fWNf+cjQQPZm4FmxT73sPg9JXhfxe/A8tHpr
	 R37+F20rXa5j2iqH2r84lEyIRAKEerEti+21PIZIeE+OjwlCr63N4gkFofC5YIHbPk91u
	 mR0LaNvH2Gg6VgL2PC8eJH6hUEzdJzMXutEAbo99VWDzvr9dmA2hCAVAFdgHIKSKGuER8
	 aAWREd1G5mDdYwBnH/vNrHy5Wthq6y9eGoX+YDIpm45a/Dfwf5LTb+HeSUCDxqWU8OAWs
	 QblqVu70seiR2B8R/Ak2P4sC32V4yv57aOQgS9glEpg6DuFq4r2BcFDReLw/1zYr8kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700314;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=ZYeZZrG9ZKN5BZOL0KcRfGjiqSQEn+PAKI/JApuA7Lo=;
	b=AeMh+l1RUJgM+L8pcBoawC2UWtdMLJUYaKcu9u19QJAJcYgq1UfrvYuHeRGi45tD0Sv6
	 rDoICSqlwzUnu3AWtSl3e+7yfPWb5zvmAA1eaLOrFOGVSDakaP2kp+7icUo03YI6d8llK
	 IuC/PXv/3lWUYkUWpQr7a+f/2hDdDluXbT8wN2iibz7vX7Z5Dh8V5DvVZ+eS2+weH+S4v
	 wY8GxgkmP8PiqXxhGeQG7iJeVAcjNptxfYctGDMO/tgVwtGraK8SZZUYtItLGEhilLGsz
	 7V5x6XS4YPLU17SRLomg3z/KPAJI19clTouFiJbgECxacvvk/G1X8SdSvZfr/SMjEEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4874606A327
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 10:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4874606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADH0JHXselqA3s7AA--.6276S2;
	Tue, 03 Nov 2026 18:05:11 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] can: sun4i_can: Use devm_clk_get() for the CAN clock
Date: Tue,  3 Nov 2026 10:05:20 +0000
Message-Id: <20261103100520.1309743-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADH0JHXselqA3s7AA--.6276S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4UGw18KF4Duw47Zr1UKFg_yoW8Gr48pF
	sYgFWrCrZrGF4Ygw4UJF4kZF1Yvw4Ika4xKr9Yka1Sv3Z3Ar18GFy5tFWUZFW8ZFWkGa1U
	ur4UtF18tFs8Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU8nNVPUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgAAA2rpnIRixAAAs4

sun4ican_probe() obtains the CAN clock with of_clk_get(), but neither
the probe error paths nor sun4ican_remove() ever call clk_put(), so the
clock reference is leaked both when probing fails and when the driver is
unbound.

Use devm_clk_get() so that the reference is released with the device.

Fixes: 0738eff14d81 ("can: Allwinner A10/A20 CAN Controller support - Kernel module")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/can/sun4i_can.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index af52285d5a4e..9f5d31063b13 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -819,7 +819,6 @@ static void sun4ican_remove(struct platform_device *pdev)
 
 static int sun4ican_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct clk *clk;
 	struct reset_control *reset = NULL;
 	void __iomem *addr;
@@ -844,7 +843,7 @@ static int sun4ican_probe(struct platform_device *pdev)
 		}
 	}
 
-	clk = of_clk_get(np, 0);
+	clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "unable to request clock\n");
 		err = -ENODEV;
-- 
2.34.1

