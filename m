Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223490;
	b=k59dc9qEOAZ95D/lkVSXKbjd63xakgC1gYCTmUh9ugL0yGq5fJx/ZLfZhwHRfMkOawXB
	 /VMizzHQOMaKC5WJJ2lYd5LRJ7NLT1R/z5ipo+mAHaWqavkf6umJi8yjcDbJ5tgvqUCW+
	 HgRvdqGrfcrreuUi+ENYI4QSPFIM8fDj1uorHtDyddP/I+K7ciR7gHNMFql+uTjwqwnk7
	 NXnK8XG5B5gfwGnVU97AMCzQfLD9ziu8tGgeNa079AeWShyHI/Zzz6cBRQ+Vk5fu5qm8m
	 LTd6kHmYKm1Ib7IdCiJEn9+n876pybPNslxPWpid5VQd50zdy7Mblc+Cu4G5eriHoow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
	b=LjDawBXKw/VCkhkI2IPOz6owoHxM8zC1o4zXV/3NN4Nr0UNAZ9q5FOt9igtlfBHng+j4
	 PuQCBkwJ8h602/+7AGTBfaMS/87Z7NLHIjz3cjoqZIHKMcvEtjtS1Y1dyh+EJm+sPCjND
	 HwEmYt5DCMQwzRtWAuiq+MGQwHXGKzJc0o48v8M7rgJY4BRvJVd6qiLf6+e3VpH1O41ve
	 mLJwrOclAdgtGcl4FHYhzeQzfebmbZ/k1FlqSkk82DREmw6vjv6tuhl48X2GGTt54WsgM
	 uGBFtVdHHTfvWVrk0/W9K0YSVky3o0ARpl9uNjt1hzsm1sGnCnRJeaP8nd2zpW50BVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRFXLhvY;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CF060A263E
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2CF060A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRFXLhvY
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-55650fe1f0dso924896b6e.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223488; x=1795828288; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
        b=oRFXLhvYkpJHHWopAfhW6I2PVzmZrjGr6MmnClk0OaD04hxy5uo5fyDN1dFHzbTtOs
         HY1f34bHm/7Eyq+SR2R9s5IR7eC53O9RCbPEuIzkKSQVOtgHd6frcY/1FIaMTVY+954v
         TLl5NM8+6MmlWEge+ifoauuw4LDFw4Doc/buWDxL7/ADUJ9qu8zLqJY/HSpdaMg+HLdv
         0gkdoKocANCwp3ELflQG+iuBlU7z6+Z9i5927yss+Y4bFngF2Ow9R5Z/rVPzqqKxC7wc
         4FaCJUVy41GjBI6scYpOAERSMhLyOKg5AH6SWQf/UJxu7IZeb3ncHrxKZQqV/poFOTZj
         9oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223488; x=1795828288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
        b=DCVkmeho4mg4KuWHLkbcpVNGlpmGYKZSP1cSuh6apc7/bWpv1WuOxaHMBK9a1MqCg/
         fhchNoj8q8jqAIfVXigjd4xd/LCoNldNrAivm6tUtFz0j9N3NqmpOtXMtEcYVIBQOS0G
         tP3IVZ9x+F66QIGdOZ0eWqdb7ZZlaKxAg49dinPN2wI5fCM9qaiw8lH0ZVh2B9KyjWe0
         A0kB/Rn0yrw6Mm/ougn3T8uwANFwFQ644sPgjrwKLdpZ1p5hP2bPm1rutxwFrNNeaBQz
         JvdTXX2UE5RxNI1aaSJrrb+ZBPd2tw2GMl/KDzjTwHqRjerTYb60SAMq9eekzTcllfBo
         Ht+w==
X-Forwarded-Encrypted: i=1; AL+hErE1JGKR84yi+hhrrylznl5VUMferC7kR3Z05zb/ikSTcOmSZFDzWt/dXBCbkCz8GDPN++jc3+UwjyLcWg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Av4sB4twj/rhrqa/jo5L+yx2EslvZ4a+ZISDW/9XkIW1mYA55
	WitnZnBySrfZGqDQUqVy7Y7jC1+kvUkCuPudRdDxXRospG89h7xBc/z+
X-Gm-Gg: AYBFou1HFuWv6yXoqo4s+oBCN3WHiZqcXTZjds1iBfAaI0RA6YihBAIZHVzBvGuPwN3
	0nc8NrUiOd7/CqNxkqpmWGoy69Rn3Jie4W4CEhF0qE2ph4jnqWPOrkpKGlWO/m5m5LRdNRsJoeG
	JAPtc5r8C9xE16F/coHfd9z6ZuO6POkWKM/180uGeaAxAkE2tktHyINsZpTvRV9/zK7Un5BvllW
	+qmt8b7lxpJPCLl6GyOWRyoL8pE+DTTDriq3DO6kYpSmPzV2yvFwKy1EK0oUTXMYZvmp5fi7TNb
	5by1/BEWUdcQaVl23zk84L9bxjD20hkQMKciOL6hVodJE4aNd9EQMJ7Hp0yHAdcknl0RH3QLxdK
	Q6yxuHRrUiEbU0AZUQGPUnlOVrUGprindcMCJcIkrQLFaG7oEprFWjJ1lUi07ygDyGVkO47Hwnr
	pGHqfFl3T76RQoBgQJBMqlqI9sPISydJve9PFF9HBItJYCZD0dXI4F2xw4N5NQMHJPRrJWM4LfO
	4RvxNFXsMW2Sbw5E3Dd7ki7BHChgrHEHj+x6XA9bGwq267uELEZW7xM8g2c3ioxu7GC/CKMP2a6
	mtgnemre6X9P4oDmcdFel0Et1rT7lPTv8sedHfMCFSFMA3V2hSsyfYqDOw43EWiyGsq2Pb0v+VM
	gCPB1yehr9z7F6Q3uDcgS5klGuQmjUYaQiEoDjro+FZfz5DkVJD5cBic2iG0mzJqFvdvuY4reeE
	EMVwbBiedrWlgTJchRv1310TWrzqMw8fDiRJJF0GiHgNg27gs3oRpB
X-Received: by 2002:a05:6808:2220:b0:572:e8eb:36a6 with SMTP id 5614622812f47-57a0bc9d273mr5655190b6e.56.1795223487680;
        Fri, 20 Nov 2026 17:11:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:46 -0700
Subject: [PATCH v11 23/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-23-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
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
X-Mailer: b4 0.17-dev

Normal NAND reads and writes worked on H616. Fault injection exposed a
failure when recovering from an aborted internal DMA transfer: the
controller's soft reset could leave the first subsequent read displaced,
sometimes without an ECC error. This was not observed during ordinary
I/O.

The controller needs its AHB reset to stop internal DMA and restore data
ordering after an aborted transfer. Require resets and reset-names for
the H616 compatible so the binding describes the reset needed for
recovery. The in-tree H616 SoC description already supplies the named
reset. Older descriptions that omit it were valid under the previous
binding and do not describe the reset needed after a DMA abort.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..ccf616fabc91 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -119,6 +119,9 @@ allOf:
           minItems: 4
         clock-names:
           minItems: 4
+      required:
+        - resets
+        - reset-names
 
 examples:
   - |

-- 
2.53.0

