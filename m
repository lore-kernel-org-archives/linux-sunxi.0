Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A309114F107
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 18:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712945049; cv=none; b=UUdMKGe+jwVPfqjL/e7FHQAHKI9MbYYr69iJMQM2yOga4v6KWIIH9H1wNoz1FNUvj1RBfi3nJJcXLhlfF860zCgWujYPSlN3S3mmrZLohSe4vPJQEksCwbQMBxyHrPH3jDDZTVEuQVLXNLFNxz8cA0vu0KAtgCMVAehsR/GPfVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712945049; c=relaxed/simple;
	bh=H+DJg0zEQr8LzbY3dt0QnLd4raAs9+rzlHWu2fQFx4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+orR2rGAlCIInQt1ZzPBxZflACTA8HZgdA+6lCoDzqK6SsxS3FXgz5a4nJabV56ryz95PrBMdOzy1e8VgsOQDrgUqzAJo9+gUFMWuWpN3fnKUWJctLzkjT3IrXPKedW8gTjWbdeXKBexTkGBd38Yr04t4O5H2E5UvskGFA4RS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6FmzP5G; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6FmzP5G"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso12898171fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Apr 2024 11:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712945046; x=1713549846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cN13xKrisJWzHEEUXlM2Kj3W0urUTpSnKk1qxa6jOEk=;
        b=a6FmzP5GexGcfNscYCL3VoIuKS95NgKdE6LJW64J5YRWOkPNbKDrK/0CN0dz1euaK6
         okQM7E9cEqvdeBEWm5f+Jkrt5lLsvKlYdaWzvCBj8SVeYtvDRrUHISFJJmYXuRcYOgM3
         pz2+FaNo+/pdtOUCXRPe/ztB5dZ/isTBfnELokvwHRYfSDYZehOU8MJHhQ71osUBlAwS
         rmhynMtZRjfUDj13aDlEP2LgQ1UxoDO7fU8Xx76BrRvNcemv+6oLI+FYCKVcXZ2lpLBH
         SkYEhhEzh6gejgki96d7huVJUxS8BMO1J7J/NsGagMI9udVnZBORhghPSqFyrUjmm9F1
         S8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712945046; x=1713549846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cN13xKrisJWzHEEUXlM2Kj3W0urUTpSnKk1qxa6jOEk=;
        b=ULFTdGvnHwcdtkZLjNoeoqan+hRToJYaCQbGHxGNxe4NthQWWxn0tc5Om9NL1Mw4mp
         ZgGCGplzVPo7G2Cs++lXUGX7OSl4vMWJdI54lfHt1ljBoB7wQXS0fBrii98OEJB5fWG4
         Frd8BMcf8f0FfO6bSrrhap4KFKRk611QiTt64/ecWf5wfXmrOHJg9YfDJolBh9rn8/p/
         MYKHoGHpMQ1XoNuH3NqQprtoofU946HMvWPNsSuCfJESXvjSQMARj6ZFUQj6U3ve7KYl
         CbsE0SlCAeSjGWKhYHHWe3kt7/JIMWUELJs2pBznzZiE6MNQO8uIz4YT3cLieMKT84qd
         YnjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYMHqDOiG9FSEwpBmlGm8oWIRwzrU8iOMmLmN/k1BUWdt7Ep2OjCoooxLqHN7ylWoWvOpW/CKwqud6sRi4XHn3c1J+WiWK0HhzUZQ=
X-Gm-Message-State: AOJu0Yx9XWRetWZklEnEoAhdp7R3nyMM5Ye+xjLpwjdb7G+4XjaYVw0f
	I4hQpDCE2ysEvGaLMLBAzBB+NQnjLt8Aw34MUDM8iB9EtQCKQecb
X-Google-Smtp-Source: AGHT+IEOHDnXn4A0X8osVWAoYeNfoKuOFh0OduIqkCo7A2A3nIvR3DQ2+Flg9QxnlP2QZA+Omg958Q==
X-Received: by 2002:a05:651c:b0b:b0:2d8:3e07:5651 with SMTP id b11-20020a05651c0b0b00b002d83e075651mr3195379ljr.34.1712945045603;
        Fri, 12 Apr 2024 11:04:05 -0700 (PDT)
Received: from localhost ([95.79.241.172])
        by smtp.gmail.com with ESMTPSA id f28-20020a05651c02dc00b002d2dfe8a36csm560225ljo.96.2024.04.12.11.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:04:05 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Yanteng Si <siyanteng@loongson.cn>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
	"Gan, Yi Fang" <yi.fang.gan@intel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/4] net: stmmac: Fix max-speed being ignored on queue re-init
Date: Fri, 12 Apr 2024 21:03:15 +0300
Message-ID: <20240412180340.7965-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240412180340.7965-1-fancer.lancer@gmail.com>
References: <20240412180340.7965-1-fancer.lancer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's possible to have the maximum link speed being artificially limited on
the platform-specific basis. It's done either by setting up the
plat_stmmacenet_data::max_speed field or by specifying the "max-speed"
DT-property. In such cases it's required that any specific
MAC-capabilities re-initializations would take the limit into account. In
particular the link speed capabilities may change during the number of
active Tx/Rx queues re-initialization. But the currently implemented
procedure doesn't take the speed limit into account.

Fix that by calling phylink_limit_mac_speed() in the
stmmac_reinit_queues() method if the speed limitation was required in the
same way as it's done in the stmmac_phy_setup() function.

Fixes: 95201f36f395 ("net: stmmac: update MAC capabilities when tx queues are updated")
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index dd58c21b53ee..b8a1f02398ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7328,6 +7328,7 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	int ret = 0, i;
+	int max_speed;
 
 	if (netif_running(dev))
 		stmmac_release(dev);
@@ -7343,6 +7344,10 @@ int stmmac_reinit_queues(struct net_device *dev, u32 rx_cnt, u32 tx_cnt)
 
 	stmmac_mac_phylink_get_caps(priv);
 
+	max_speed = priv->plat->max_speed;
+	if (max_speed)
+		phylink_limit_mac_speed(&priv->phylink_config, max_speed);
+
 	stmmac_napi_add(dev);
 
 	if (netif_running(dev))
-- 
2.43.0

