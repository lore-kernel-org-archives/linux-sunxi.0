Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AC3489FB6
	for <linux-sunxi@lists.linux.dev>; Sun, 20 Sep 2026 19:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933549; cv=none; b=FEIcfnE/kAMO5QpNFzpHLIxa6jGHZwKcVk66vIY0dmP33WFd768W7Q8TdJRosdYVG4PXIxJliLXajZeebfnk8PB//VmRqE5Ji/VkCxmw+gknAj5JIis+lJFUMmCeerysA1YUn8ZjnRiE/MC3O2bevsH3c+C624ewn98NmtanHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933549; c=relaxed/simple;
	bh=L/gVslUU4Nj87gMlJ1iN5b89DCxQ3qLLsz8MQD+nnKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WKRPg5+ULLLuwhA9gzvlfrFvSV6FIqgNmFsrXftx6XP+CCj4KMMPF2WshZ0JceBf2gd+s68OJp+p989J5fVEEqzMwzej8t2aofksPxzSMNmfgFC9xkNvPPiRDxd5MFXn6bbC28yER9Fwc9PEozk8+7cu4CGfc8DC2pqQjEEr00M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWrc5cPQ; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWrc5cPQ"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-478cbd5b48aso1678685fac.2
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Sep 2026 12:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933544; x=1790538344; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3aFq2H0KJohvHytlOdYBRSeWux+yzT03AinuuVRvEmM=;
        b=CWrc5cPQkpnoDNYxuEL+u62OxLXCGuGb4/vKDV918uIxoUnEmv4GNf0Esjja3YkeHd
         E0jSwcGBPaJXaqSGfYxM2KrNf+W122TlmGyJk5cGzcDVsDAeaHpNp3kB7CoZH2ZV/CTq
         p2x7VXKxgks6FzNZbOHM29a1oO0yw2QJ6SGBn3twC7ShetRaJR/D5umVqEYzg2fp6Jcx
         eHPg9hHKqoMPR3YeMKu2XaM8Dye5DQqZQeTtOK86r2GAJfiXA8mWAJ5HkA+c4F42h2ES
         2KiZEbcwi60AxHh9M1/g14JGdht//BQPictLfiTR/ZpkEelieONcXzewywXeVp8Ly8ZQ
         DxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933544; x=1790538344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3aFq2H0KJohvHytlOdYBRSeWux+yzT03AinuuVRvEmM=;
        b=mFSO4bvA/WOTR66FQ2YCmlARBwso6bzaoIyXtP7FBMJwsWAM+7oIaRTZZfnN3ZhfYA
         TS2VFVBi8oxj+og/jyIAfY0t0iziX8eSghF7kaSNP8xc+n2mLj3ybFimJPBIJ9BTcTGo
         NLGkeg8xS6N+9/uCJA8diOIOohF9Rd8PL3Y49NmJw70VKvHoiJT2gjgFVFy6i5sHSVsZ
         La5t/9GP7J4Jo1P3GST4MVVSha68xXZ3Odcp5zeiJARktBJIaCDI6dpUPpb8nNC5aPQS
         hZJ2ivgT4gkDJ7b8SMJAzXubx+KRUUlncmY3UEzKrGvrJqJtS0d8drzYEitN+/FupDz7
         s/pg==
X-Forwarded-Encrypted: i=1; AKwUvBwBWqYX+vB3n09z3rNRsjSgN+rPK6mV42PW8nr4iDx5yWm8JDQVdJwOpw2KGllQ5Kcyu71yULZcU1YUHw==@lists.linux.dev
X-Gm-Message-State: AFuF++mUcx/jCxuh5L+vUKaR1/EOs1nUukuPRNX6zsOvASxgmEowHaAs
	hxDv//pN3peyCT7c6N/jQfQlq8TJHaGuFeh/1semTXRB6Y3VpKq2ST+Y
X-Gm-Gg: AYBFou3ox/yaONzXBw5c7quSViA22pMGKvtQ0qb3XfW5uLOCkCzB9eDPwK9ZN/VenjL
	/JscFc/PLYhACyDCq/B8KRKq1Z/FWEx3WF7rs/lhDFcD9lLmpycJkNNoSAlxG9DddTgylsv31+d
	y4u7ml7Yn05aQcQyYETbZcC1ftEvRnybUolxhDEDFbwZAWtAZWM5kH1hMrUGZJQSyhz9Qr7BL2A
	1x8ro5HiD10B57vP/Hqsr6FfDMcEi7lRrtEXFLtW6eraCV2qZuOtcCP/FEff3On8SYgXHvkeqSH
	e+9uiKdOiE8KzwcsqJqQiVjYAtpxEFxVX5wH+VqRC0z3vA+nIgFotH42OQoTJXLFFz7FNeSSZCT
	dCD96XfnceG1y/uutxwB3iDaVQcjhNInEr5uAXISF2cA4o4TVEeJQ0WECpyA2pY3p14gYZwkRXn
	Zv0hG3M4/bCiAjGVxeFPIFl367lZicxbwQdMABhGLwGIWhdn8WsJbAkLGldjxZXqLqXsycvWr/G
	Bp7w5/d1q/06du+UdbuIinLsGgl0llq1nSgIU3f8o4e5glb+ctgHCvxmtFo3Jh8bH8bvF5wix+c
	G5Sj9h5VA/aEox+N/kMHVQPN8AFSg7n1Xl071DhbxaHpA0HRSBy9hpCKBnQRQLVSy7jOV1W444h
	NT3NjSCfoUNfD95kWjYi+
X-Received: by 2002:a05:6870:c205:b0:42c:49c7:a499 with SMTP id 586e51a60fabf-486e4ceaa22mr8316127fac.3.1789933544510;
        Sun, 20 Sep 2026 12:45:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:29 -0600
Subject: [PATCH net-next v4 3/6] net: stmmac: close the interface after
 failed hardware resume
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-3-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

System suspend disables NAPI and suspends phylink but retains the IRQs
and DMA resources. If hardware setup fails during resume, the interface
remains administratively up with NAPI still disabled. Closing it later
calls napi_disable() a second time and can hang indefinitely.

On hardware-setup or timestamping failure, stop DMA and disable the MAC,
then release the suspended data path without repeating NAPI disable.
Stop phylink directly from its suspended state rather than restarting
the link on hardware which failed to resume. Drop the driver mutex
before teardown, retaining RTNL across cleanup and network-core close.

Close the netdev to detach the PHY, release its runtime-PM reference and
clear its administrative state. Reattach the now-down netdev so a later
open can allocate new resources and retry. Preserve the original resume
error and leave successful resume unchanged.

Fixes: 6896c2449a18 ("net: stmmac: Check stmmac_hw_setup() in stmmac_resume()")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 89b773370894..18630ae62316 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4283,7 +4283,7 @@ static int stmmac_open(struct net_device *dev)
 	return ret;
 }
 
-static void __stmmac_release(struct net_device *dev)
+static void __stmmac_release(struct net_device *dev, bool napi_disabled)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
@@ -4296,7 +4296,9 @@ static void __stmmac_release(struct net_device *dev)
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
-	stmmac_disable_all_queues(priv);
+	/* Suspend has already disabled NAPI when hardware resume fails. */
+	if (!napi_disabled)
+		stmmac_disable_all_queues(priv);
 
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
@@ -4335,7 +4337,7 @@ static int stmmac_release(struct net_device *dev)
 	if (device_may_wakeup(priv->device))
 		phylink_speed_down(priv->phylink, false);
 
-	__stmmac_release(dev);
+	__stmmac_release(dev, false);
 
 	stmmac_legacy_serdes_power_down(priv);
 	phylink_disconnect_phy(priv->phylink);
@@ -6212,7 +6214,7 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 			return PTR_ERR(dma_conf);
 		}
 
-		__stmmac_release(dev);
+		__stmmac_release(dev, false);
 
 		ret = __stmmac_open(dev, dma_conf);
 		if (ret) {
@@ -8415,7 +8417,7 @@ int stmmac_resume(struct device *dev)
 	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		goto error_unlock;
+		goto error_stop_dma;
 	}
 
 	if (priv->ptp_enabled) {
@@ -8454,9 +8456,13 @@ int stmmac_resume(struct device *dev)
 error_stop_dma:
 	stmmac_stop_all_dma(priv);
 	stmmac_mac_set(priv, priv->ioaddr, false);
-error_unlock:
-	stmmac_legacy_serdes_power_down(priv);
 	mutex_unlock(&priv->lock);
+	/* Release the suspended data path before ndo_stop(), which must not
+	 * disable NAPI or free these resources a second time.
+	 */
+	__stmmac_release(ndev, true);
+	netif_close(ndev);
+	netif_device_attach(ndev);
 	rtnl_unlock();
 
 	return ret;

-- 
2.53.0

