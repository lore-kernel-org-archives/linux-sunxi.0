Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF9C3B14A4
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 03:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122342; cv=none; b=oLshG+CWTs1YCdcwurDEfk2D4zlc2zJMFg9B+jG1lj0B5Th2pCwlcYtp5X4z2ajAKgFsINQtMf4xv0iKN7dCTtfAQWPownFRPVWj/IvTx1P1EwbUavRfBIDd6rG/+DD61mdeQJrI0pr5gjEFajIMRbG/n8irnTG7JKc9MFau4go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122342; c=relaxed/simple;
	bh=H5TfgRr2Bv5tbABipMunxtVTh9+p1lSGxQCm++Vk00I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZZh7RoqQf4Nj7nHCU9Urqab/LYFpJqrtSb2ceItItmTS0itMp1+iglxUFNHTyKML9sOdp3Ao5mr142Cy15wa9f+ibB72/C1hMTZnO4jwVngWTTLDD21Mr1Smm3wRu1M2qMTwzKl6AQzVQt7dLwM6C97mWhgNsgN53lQOiLl5dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qeOsXU1e; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeOsXU1e"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8241a56cd70so3923479a34.3
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 20:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122339; x=1792727139; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+uyWszwAFvFc8JbK1nSE8GaRzk3E1Kb/gXy0IKu03o=;
        b=qeOsXU1eJDEYBy5tDXm0y5PlG+CY3MG9GoXxylyVe74nEkml8ZQNPlT23n3iZSnCFj
         ND4cyxZkkY0SzPL8LVbSa6+2u5fFaDOfCj/ofNj5tXq6BrtRCdTJK9A+sAjOrJtAX7Bu
         XLJyRY7NhuemNhwqe0AJMwkaublHQznQk1sSM+6dn67esCyvxjOvMR64Exak/d4ly9q4
         Ca2eIpA/XuhcuiNrpJFe9bJVT9OXuoxpEwvfFTqGIwLGqpOkEIwAMUb43k+b1FkT58vO
         b+g63ZmrGxT+apTE8ytgaiqxweA8YVQBAzHxyPEIB+DlKNqQQevCJrnzXocjjTjEdAv2
         AA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122339; x=1792727139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+uyWszwAFvFc8JbK1nSE8GaRzk3E1Kb/gXy0IKu03o=;
        b=E3E1lvxvLOPPhov/3IAxlFETsahD9wi867F/Dog9g+8/ZHWI+erSc9ez3m/bBygnbL
         7zdvr69klJ5su1iQKnjOg6OTTgtPFibucnObmece44b2bUlHxXDuj5WB10s43KaecSOp
         +kusOf1mH/9TNlF6G9E46N4Aa9sXZbdASWH+Fw4X2XDQl7sxH/CgNGbnZVsaDjnv/SZR
         kjOohYstzKjPOwJSAADix8DU/IYJNb2vI124RE6Nc4Uq9wsAEvfRaB7uuhhHNdA/igxw
         oCjsi5mZpqTRAzQrC7XotWC7gPgYT1ZM7yvjp93xRvI6T6yPn1o5YtWq8Q75Pmv+ijgM
         9lAg==
X-Forwarded-Encrypted: i=1; AKwUvBwraqwBvbAkcj/ZfkAudREubkO4LukQENQWJsZ9fjcJftUSPqvhWk1QuuwpxosODUZoeDc8tuEnaX+CMQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK0ax4AKejvyF8jwNoIzk1JxU2i97nM4ocnT1ilCL0wiUnQGTH4
	rJbCi5bbe9h+S9LhnlziU+8jsb8ZXP15yrrACe7s03ZCnXLfnuWF4AxI
X-Gm-Gg: AYBFou07PKrB1CE/WNHB7vcrE+x5F8mY4mG/g7TCqR++BR39xpAzsIck8RdTXM2KfAb
	YwFrH5RWVRX3w0IbfX5Fti+ZPLCer+ckpd6OYWSwUAGuIt7B5SSLZen+iPmN9ZgIKaOCFpOFkp2
	rxuyqxzpU4i7wWopm3vL/jShco02MBUTHgxad7XYStM5fEbENjZR4XVgtU5Er+vGKHfv0dM6wBe
	fbO2a/RIbUFngwstheEeXZYURb9bDBXTKCFSPML6/LRyUvMOpsUrCHmoSTJdt/LIt3JsR+0hCRl
	7EbVjz+RqGX0nX3YZdfJirWXtORmN7QELZ2cBGmb0uii4a+yVMsVTb0BkHO98OM6P0TPLkyZMW/
	d4WVSDkPTXma9LOmlPHWujFOcJI0HOSJrFruI8RWs4B0E5YxBz/h6p7bdkn9zvC+TZ4sjxD6eif
	NWyGYxEOMsuCUz7UpF5FLROZ3REYezXcqT3lUUZv2QjCJN0159VlkkFmTM8JwNpsoVEyEpgOMSz
	15UKUX7DWSgAQJFz6jvejlF7k3AlxxvM2Pfgk4noqYg5u/dOvpCq7s8PQyXb/7Mwf3t4mx7KY2j
	d1ecEEMQlfRUw2aFVyg3Rt77RnhCakF2OeYERLLnsDwjs39a2iCefDE1uyLxWaLf6Fqer8Ny6EX
	sOOp5bMf2NoLlRnCcqlN2m2ZRyzRv/L/fpw==
X-Received: by 2002:a05:6830:82b9:b0:822:27d6:c281 with SMTP id 46e09a7af769-83094f728ebmr20703536a34.8.1792122338629;
        Thu, 15 Oct 2026 20:45:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:22 -0600
Subject: [PATCH v8 07/17] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-7-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

ECC exception mode recognizes physical all-zero and all-ones chunks.
sunxi_nfc_hw_ecc_correct() fills their data and requested OOB buffers with
the detected pattern, but sets its erased flag only for all-ones chunks.

The caller skips normal buffer retrieval only when that flag is set. For
an all-zero chunk, PIO therefore overwrites the synthesized zeros with
SRAM contents. With scrambling enabled, those contents are descrambled
data rather than the physical zero pattern, yet the read reports success.
Requested OOB is also reloaded after synthesis, in both PIO and DMA.

After checking for ECC errors, skip buffer retrieval for either detected
pattern. Keep the erased flag separate: only all-ones chunks may set the
page's has_erased_chunk state, which controls randomization when reading
the trailing OOB. Preserve that state if an earlier chunk was erased.
ECC-error steps still take the existing raw reread and erased-page check.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 661ced4e07de..a244d2158d76 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1219,8 +1219,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		if (erased) {
-			read->has_erased_chunk = true;
+		/* Both patterns are already filled; only all-ones is erased. */
+		if (pattern_found & BIT(i)) {
+			read->has_erased_chunk |= erased;
 			continue;
 		}
 

-- 
2.53.0

