Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED1363C46
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 01:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028082; cv=none; b=cFPFF768hQARVNUszSRPBmm3aPFJuVH9reWkJigUDSU15v1O1taQQmteGJktHmBroN+LfrAdfRolUA1BCFBlep5pSNnRC5iqPp3CXQB5uV0yzTgD2P/jIkI/hP1nQ8pr5D61QU6FIxbQ54gCzpDiSXh/nmANkx6hYxIME+BhJl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028082; c=relaxed/simple;
	bh=A1STkpE9307vxyyhV24//arWM0j0kn3Imh1Mn5JF96w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PnQ+RNceNICG3HX2c8JXGaQSz1rb4gvCVdD+J5TTWeXaN0pVkEhezYhlipfB8186Ipan3f8SaO4W2R5i177aa5ikzxJhrSuBzqiWG7UtWLC8RJ6e/Fw4PNf+yVRLDVqAc8BvizlLPVPseWz3nLGrRb13v+wKdQfISHpgNPm1y3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdV22Yl2; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdV22Yl2"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6fbf1ba31fbso814321eaf.0
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 18:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028080; x=1792632880; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=BdV22Yl2tYV/fHYoVkmBju3SjIsI6aRiVVQ0WJVD5Mc8cECV+AbbiL7g1bL52Zft3P
         fh7763Jd6aGPT0g1PNmtyspiV/7g4K1b56593a2z+YBTxGqhWG/Wxet2ERRiSErg0lVG
         QdOpAdzrURcucKmBCSdeDHmK2b/DAbluTEXARyR7GJDAoHixfP3mVwmdPTZne68t6MBM
         BU5DL5ZdkadH1lVhfiPJM3T1wgLK6d4wfbwJC71UJ3jcMILUW5DHGOL1qc/pDJJMt3Oc
         IzS4RebpJWc4hq0szQhJ+5GXLAhsDHWCXjikHUeRHfFWZVMpHVeo5vQqQh52E4S++45I
         LBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028080; x=1792632880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=QJCcLedSPtcQyAb43lkwEr/9DmmUbqltxGyBsJUDDx0KfKaDataUN+dnw6tIneJf0c
         ADOQmXRyWUhxERIPqIO2F44QzSR6jnIsKrEmwmvH79h8uSecUzlWfE5WBvPGU6Ok3Reu
         5a4Xqct97CQxiIPqrZ+lnV3usf51htHdIbEX6CfIcHEMNTmFLJ7tdrd/ZS64d+Hp1tSw
         C84vjoRW34WYvs3GpB+6K81/hkiEzP+iBhnRtHlL7Kb4FQr54nv8kT1NSlFkoHQ87YW3
         DHj6xfsOORCp116uL66mmdTz7txuhODlVAN8rY9M37zum1CHAYumxamABRC1/0NjRL7l
         ZH0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzc6TlLhfnAyTRf6W2jYQEDhGjnJ2/M/hNLiDcr+HTHtWNmpNKXU1FsS2ednfy0AyzN1NXGTv1EajWI2Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ9CmBSIgtvVfFFyS1kzi4mfx5tmzrw4Pd3xKH9ocGAwqXXUY83
	WjdwlddH2QeBHsDwzHMQ3/bX4ljQwEQ2NvZdKM/THOsqA3l1WJ2ksZ/q
X-Gm-Gg: AYBFou3N7tYnsp45qKhWLxzbkOdgRNsEpJxyOIXh6ceLKd1w93x1ZG8nYx8BUWw3nea
	sOnye4F+NBvn0NxHTp0SdzztsACMi/jlBH7zR8/Nizt5sjAJ+cJSQ2LIgEB87f+fn5/Z6fUjecu
	PBQ9XPynT6V6EZfcLbKD5UtoFtYkHd8Mx/2jBj9eW1THJV2NHm41KJGNSyn/0S0BZbSqJo4QBVM
	uQlayEnYPlfuE3rygWE5gu7lCuFHlLhLfJTNOFOmJN7RAbx5TN+lDPyTnkNnQnvUriLDfcof6i7
	PUh+G6AORVT83958KbH46f/PqYr1XbtUPR/N+tKozUu1OM+qPSQ2ItGiET1ek+cqv5C8oD5IoLC
	jSEtT9isdbxbqXAU6IRjC8JyixsY1RATP4eM3HpLBu3LGirLqPaG3gonzevXDvodAulciemhSid
	sTzJPYQ5LKpWw6foHsHk/nRxG06dSkRK4mtPOX6uX4Xft0JUehpK8MwbKEy7W9Sa4GCCPdg8Uz5
	ZsXTbZvQvNwubJtnn5hTl5AJ+x8BKkoEnDQMjS9f/4kOQ+JjH0/BWwpFhi7BxF6c+cZXoSMjdt4
	YoeyNLRVDZt2gHOfDRMmJu1sK3hc8/xg1Up3ENG6U5E+lQKDwGmsufxsQRI9MOCoNETUne+xDyw
	2VeTNAQ7LzRRbglqEYoOr
X-Received: by 2002:a05:6820:4b0c:b0:6dc:3be3:bb81 with SMTP id 006d021491bc7-6ef10492c39mr14343257eaf.35.1792028079883;
        Wed, 14 Oct 2026 18:34:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:34:02 -0600
Subject: [PATCH v7 15/16] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-15-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0

