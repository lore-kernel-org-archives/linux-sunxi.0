Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904962;
	b=ra1IobgxkwN8TFy8ao1Ft8xI83JI8gV/PfoxGoAtaTw8siR9/gCIRXLSWf4gaQ//JzRD
	 10gGwV0bYfS7MRy1MipaDLP11ZMBSdm/LRbKCZRfdsmFiEyWuuynmSo2mtRk0R2dKOi2C
	 2TiKB0lBeRTa4Wr6k1o0gKT/vGIJUD15FnkuUSI8HVk8PiIoRG1y0eKuM7JbApJS7TbmB
	 UbnEYHUCEb+tRpaLPT7eDuTQP4x7U68Y7tVlk1yW3sctUewDdmVTEmOXWJ+8bOPjJ1mGT
	 DdaljPJThgbgtipS1cj1C4Q9HNnKH/4qysWRfN1r7xenJ9UefRYYeyVLoBDUQyGWXzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
	b=t6ay5RMPZUgIbrzyqeR0YaGdoxQq51MadK7vHQsyNwWVqr9V1aVcKlkgUeOs1bI/HEWH
	 e8n2rgoV8Ri/AIlbA/6vUTnIKA0+G5udvXMrlWOfHeO82yRGKOe0PsGRYYnW/G+aIAe50
	 n3EN/zMB7DjNmMmnVQvP/mQ0yJqKFaWmdP9Z1dFgD7W7tQQX+7Zt3lKPMiRfRKhh3hWjq
	 uFFFNQFwz5oyKy3TnbljQUn/qXRuygBZO+H3yhjmwoVg5sbOF5QZogFBdPp5pb9DgQFbu
	 mqiN7cOG3RsqbrVY+vyxScOxpsRUdilEuoBd55IOtvqM5Q3iwZaowYWBHgB5tGEqZrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vW13S7nZ;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B634608360A
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B634608360A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vW13S7nZ
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6d68de53053so1245035eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904961; x=1794509761; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
        b=vW13S7nZtE5OC+TEc9iUsQh0H3bSAH8TlJYKF/J+n8ISE4/eZz4u8FR7A5nZKyIPIO
         VPvEIfUnXVrHPV5opobNN/EnH3VfgF7pixPGp/E9VY6AvUTF/jSyLtLULQNyTLXp7P/l
         aZNCQp2YX/IfZHCkv8P9lov2eVOs7uYKET8CqANLP6d9D/tntwaYWAvdztQBcEOQMhAO
         /7E+IrItKyKOXzGk10wRyVPQW6DnKz3B0IKlm+W5RGDyKmtcZysXeDWy3j5LiKZvGWv8
         Fxw2lDqvqbIWHb5207rHeu63AnNnkZlVZOMMslPZpUDhC0+o4TFqOqD0bxZdRwLylm3C
         tA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904961; x=1794509761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
        b=PQGjvVlSmi+dXhO4HeCPVb82HYVkjEIe+mEoKlb6TaUCbSdSe9NJVts+F7mp7RFqk8
         HnmK8jweNWQgA8xunFKdOOXBhS3KF4IddtRe8nPDD4OCB5JehvlrzdqmXbUMVAUf7v8F
         RdONuLE8QvsgGgAMv5hLSd+UrWX1C4o9aoh/111dAKqoiZoqkzeCfeJAfHLeXpxivCjX
         UsmfpO+0x45B9dqwDK53XOuC7B99ccupDetF4P6VGNgDsvbMEhoiKfjuo7xh9iQRYVIH
         xujUuvmw0cwJCJD/SBPWvUHqEH0gOcNVe5cqjyP8wp6JT5Cb3tMX+la/OScxILI4HA0z
         GnlA==
X-Forwarded-Encrypted: i=1; AKwUvBxv6HJ8BzhO8vJxc6+J7JFJNjKUcTAowc/NSNwK+eD52OHAUZogie1psuSKUl8FXFY0Zj2QLvEjqz3vVg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8kd7nHNJnn2iiYhXk7FfBWmgm9OK4KxPJIdF2QtCk1r78x60K9
	6uTnKwmzQ5vMd6eMw8pgZcatP0p6CUx0dUUcBf3asex+aHZwWtuXkTD+
X-Gm-Gg: AYBFou3IyaghMQ/asfpotGvKofEzhrRcRDnATuoaFsLekk/Ajpg5Cqv6xst+SBRLFJ3
	IK/VS6+zvhGAhqYpixllf1HZiI+b067nrCUCnh0Fo5LySk3XDprSJ7h16q/4kLldueXGR09/VN6
	4e7NAhUKSuqoeuDn151dHxdAjGuy0/z4TDQUKmHAwXJAmxMyL+OBnp3iRUWdpgNsf0HK0pmnNFQ
	TbFlRBQNGJQIJrZdrIaLMLeXwvGybVDARnxpn0UZp4yX5QCatDVkWFZcsidIp2xvAmepdAEYJtn
	vOH94dxMIYINIPxwyRfP14A9lUMJucy6h5zeDRVdmQjOvhixBAAQJyc+gV+eUcL9J2L06pQKqIv
	YjTIO9VvGWwI45BBv/6hWzqbmEWCyOJUY9IWbyAyKmTOg+ESsAd8dieOV4I00fsKiVQNPc+AZCl
	keQMRQotezaeXDkTC4GEsoAjeWoS2BJ1VwIX5yrLgDjdfx1aEoDbA+j3ByGzOOLu+wAMHInNAzb
	4UnE4inswXjQVsWWdg7eHNoNQYyeWJB5mHHuy87Z5413C+ij3WHHRYh3Hc5a30c9xk5Yu9dPu08
	hf5i19HmjQFVjy/pl9waslARLULZeoXHNsqMYHDac6YR4lcUuuD+g57GhsR+LHU1EhunPy/hhoI
	uGzYzyLRSVnlZzu0YHJBi1LDWgzMdmkW1iQumrvGEiIKfwPEUvWV143jqQAoBTKHiCQzEo2gNNE
	OgxSB4+tJ7A9UpOPwitYqwta+aHHKDsjw+c9AxZMjWlJazbeyqVhV5
X-Received: by 2002:a05:6820:4812:b0:713:da3b:901e with SMTP id 006d021491bc7-716e794cfa5mr279031eaf.48.1793904961203;
        Thu, 05 Nov 2026 10:56:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:35 -0700
Subject: [PATCH v10 19/26] mtd: rawnand: sunxi: scan all chips before
 registering MTD devices
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-19-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

sunxi_nand_chips_init() scans and registers each NAND child before
starting the next one. Registering the first MTD device allows users to
access it while the next child is being identified on the same NFC.

Normal NAND I/O holds the controller mutex, but nand_scan_ident() does
not take it. Its RESET and READ ID operations can therefore change the
shared chip select and timing while an operation on an already
registered chip is in progress. The normal I/O can likewise interfere
with identification.

Scan all chips before registering any MTD devices. Add each successfully
scanned chip to the controller's list and track whether its MTD has been
registered, so a scan or registration failure cleans up every scanned
chip and unregisters only the devices that were successfully registered.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3de9ed6795fe..e1306d14ab3a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -298,6 +298,7 @@ struct sunxi_nfc_oob_ops {
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
+ * @registered: whether the MTD device has been registered
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -308,6 +309,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool registered;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -2672,8 +2674,10 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 					      struct sunxi_nand_chip,
 					      node);
 		chip = &sunxi_nand->nand;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
+		if (sunxi_nand->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(chip);
 		list_del(&sunxi_nand->node);
 	}
@@ -2754,13 +2758,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret) {
-		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
-		return ret;
-	}
-
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
@@ -2768,6 +2765,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 {
+	struct sunxi_nand_chip *sunxi_nand;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -2779,6 +2777,18 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 		}
 	}
 
+	/* NAND identification must finish before MTD users can access the NFC. */
+	list_for_each_entry(sunxi_nand, &nfc->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&sunxi_nand->nand), NULL, 0);
+		if (ret) {
+			dev_err(dev, "failed to register mtd device: %d\n", ret);
+			sunxi_nand_chips_cleanup(nfc);
+			return ret;
+		}
+
+		sunxi_nand->registered = true;
+	}
+
 	return 0;
 }
 

-- 
2.53.0

