Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223475;
	b=Hs36n6YVkteX03Pb2K7WcxnjDOvu4AktnY5ZTexRWjjVA4aPnvj6O+rFyRSdj1VXt1my
	 1w+Lri1SGLrC0PLO4t3b9HQtEt2fxqi9e1Fc/23KGLw03MzIqPByik6F0nrkxWCjr8TSP
	 jKko4iNUg/HqAXTIcQSjtO3sdKbP8d9v5u3WU6TgN1I7JYBdowkrxyc0EKhZe5t9mFzsb
	 ARyBzTM8O0kZMwvjuc96/qKEzM52o+xJ9B+qUK5shf2upx2I3hsYQTjKe1SMvDgBO9fNi
	 v90xuncY3hRSwII2KMosKsgP7kQNp3X3+O0rW7RUdV3/SdO59WH+cfMnSU9s+21HPWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
	b=kFF1Vt+O12GyFOYyQdrKur9tD9moRGv9O7eLzdOYqSTGHK6p2xOCNzL3mjgeRhSdnhOi
	 hWkObI9d1qRb3gMtGD5viS5fo4d+SMsfJ+Ulvd6DHJamyJPuCPDIdoyUUU+Chzb83Bn+L
	 fGZ596l/DsfW+2ws/f2neb1HBymM+ytciuYekS+DLo489/eHB1g8u+CqcgA9m3jJ4jf2z
	 GvQ3D1J8+VO9DEQ0589IfmMzq/Z8iFkBik7zK83OQPTBAsmK8Omu7pbEVXi39ZO8RQpJw
	 cQepD0CMCAC5PgZUWyjzvRGNoIqnXaprVlfIfE/uhjhWLnpXV7lANqt2Y20nX4GQmTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3k0ylQY;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F29D60A380D
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F29D60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l3k0ylQY
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-483d290f398so909444fac.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223468; x=1795828268; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
        b=l3k0ylQYNt+RjrC/CfafjggpM+6tZ1pAumluBHy4eNGxB1anG+KtpzOwHbIehJXFa4
         DEVsspwN9HAHHEe+2tjzB363R2Cboyw54MilRtuLQkHXC9b56LsmvOBM9Vve8nezy1OG
         sePetdDwYpMup8tx5W42iOyQN3yY23PexRf7iu8u6ZP3Rk3kr5zjrzR70HWsjvowI0J+
         wzM4uqnJIwb3wQJ5TTEvNK9VWvrBWSgEyT3WlkrHw4BapnfSPozgKgumMVXOtG2EG/wF
         UmjhejV1FHIJoBaQBJY61UY1klAt3riS6jsWNYJGUSCiZelfozFkbqciBJNVQuZBETEl
         HryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223468; x=1795828268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q43OtFOdNFKAPwH+oRkUo2vplhtOIciQt2V0N0tE52g=;
        b=HEvPCh+/MF7nhJvX/MdaknkW4BOAroyYIPpf7GuQo3AB/g4aTGK9CmkjaRsB3nJbmH
         2idykh6xnXM9UlGCoVNQWLZadTZlKdwEfOTa+9kZbE61dCEpOrG5mEB/0JhfO1bWTt5m
         z3+nR/clhnQbnDzhEvBqSFBTjr5gwaqGIh/5vjJn/F1nqFM5aYGmQ/oQKgT1g/PzghKi
         m+UNh2vNAGgfs/5ptP3WZgpqqts7JIp6e90H3mcUFj8IjjdPyPrSqhumFFXpCeeu9XW/
         mRzMw8v5F+Rt1u27mu6pieVKQkDkK0bPhiDFXsae+9wpxPwt6Y5DVnT7e97ajfyF0Vpb
         FqmQ==
X-Forwarded-Encrypted: i=1; AL+hErGH8WBMFVr102qwnQC35JUuzOX7kHQouYXfl+eycTUz4zX/HIicy70C/roYWuVLF4z553MSdTtUcf5OTg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+gc3vRK75coL4/7VrO8PKReYAEezDNkhpHEZeOvfC3q+JKr278
	q3OWJ8RMwN5IWlxlptDQIS2dHwcR7mHrnIPcx9+lYPNHe3jqoNE/kUNN
X-Gm-Gg: AYBFou0ILVdHa+dG5PIoCQYSFvVb/D7HyCof6JcfwhdLfT+RAIY1Xa6+BS6stIKIy6J
	lEw5SjGQeEBNk3dX9ox3EFB5ETSaWpA7nAZnu8fPmJCwRPeNQwq05gozUbNyN7KvmXdx3WiWxJu
	UTuu06qZtBkK1VxpcXti3jR5Jahjx0nL38CMNIoArU9mmtpdppvcJaq/nwxHgDQ8haJ0KfrO2jq
	XvxNlVWwdPxmm5jiX9n9ldavJQFtrtzvsU21TOMuzfk9ye60AjW1mWS/w8BXwTlf2a+OQ1gzkg3
	wkbsm3BOmcXyOcY3njDcVNL1uX2a8UQoF2JhwXa2+mRSy1a5nlTHhghIDbNmP1vTjbduJBP9/ZT
	Mj18BZU0Apv43UH0r1M87w/Stq0kk6HDylbYfqra2jspFD6YMKN16a/TQ7ZNDxt7K+xwryU9SOL
	O3xbk1awxr3u/7fEC4PpoVXUU445fJrdJ5dyh7vqgjw9U6aOyzfJi9bwHjaFBWbnBK/4os12Rjl
	vmnp+uaA/WIR77xC39wB0oVQHR5oav24WymLcnTJ3121SVMn7ySt07kf2Pw3BwXUMgd22agYL8n
	riWfgy52+xfNRnGv4JflBfAyWoFUGqdBvA4d9FoMb+BJjh3ezUcrEpUq2upGo/rNV9eZUnId8uz
	8qTmOot7/oA0bR7YVgxi32kIMHpaJQazvVFngaTk1R/qCY0C20/TZ5Yeifny/X4YOG+Jlf5tqhU
	TJSXzFYUOZbkT9iFC0gRtOiibsr47+FCFlgqhvtODKWgWVMaKqMIm9KQ==
X-Received: by 2002:a05:6808:4f6a:b0:572:75e6:1d0e with SMTP id 5614622812f47-57a06d1a870mr5691634b6e.5.1795223468341;
        Fri, 20 Nov 2026 17:11:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:32 -0700
Subject: [PATCH v11 09/26] mtd: rawnand: sunxi: stop failed program
 operations and disable ECC
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-9-9721b1905ef4@gmail.com>
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

A page or subpage write can issue PAGEPROG and report success even
though sending the setup command or address timed out. The PIO and DMA
writers ignore errors from nand_prog_page_begin_op(), transfer the data
and send the program confirm as if setup had succeeded.

Check setup before enabling ECC or transferring data. DMA preparation
occurs before setup and may already have queued a descriptor and mapped
the buffer, so use its existing abort and cleanup helpers before
returning that error.

The PIO writers also return directly when a chunk reports failure,
leaving ECC enabled for the next controller operation. Route those exits
through ECC disable, preserve the reported error and skip program-end.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6d7384aac917..76f60fde7a86 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1578,7 +1578,9 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1593,14 +1595,17 @@ static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_hw_ecc_write_extra_oob(nand, nand->oob_poi,
 						 &cur_off, page);
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1616,7 +1621,9 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	int ret, i, cur_off = 0;
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1632,10 +1639,13 @@ static int sunxi_nfc_hw_ecc_write_subpage(struct nand_chip *nand,
 						   oob_off + mtd->writesize,
 						   &cur_off, i, page);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(nand);
 }
@@ -1676,7 +1686,12 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		reg_index += user_data_sz / 4;
 	}
 
-	nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+	if (ret) {
+		sunxi_nfc_dma_op_abort(nfc);
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		return ret;
+	}
 
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_randomizer_config(nand, page, false);

-- 
2.53.0

