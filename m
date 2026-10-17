Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ECD493D32
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 19:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266391; cv=none; b=LlPix/Sjv2yebeAezXf2spD/53+kvK9zDngaIS46WCO30x0Zjo1jpiCjzf/Eh2UT581R9lL3e9xztfsi10pF9JFs8dKwsy+9hR5zQ35SRHwX1vgIblNVc1+TVFlgyZPcoNGPbMXmLFHU2QlQK/7JS9A8a5zTmMt/tl/Hr9Xldtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266391; c=relaxed/simple;
	bh=Gr8R6NeJ/RQhMXjnXQ9SPScO5ueGFcDbXLJ+snnHayc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0LHUWuQiQ8vIqytv1UgRo9DPRO1aP1kxe2hUgO65w6sKnbXtNyWSrw+3pNd21WcLUqLn48QH699laiSIF1sRF3TaCCUfxhuZr8rABPibN5nlkDFYbSmyF7+GhRj3mrsuV2rYnxBw7+FKh0u1HUnAPsqYQIkx6xJobnESepwwgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ax9a1SSI; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ax9a1SSI"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-84751a20d87so110967a34.3
        for <linux-sunxi@lists.linux.dev>; Sat, 17 Oct 2026 12:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266386; x=1792871186; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=;
        b=Ax9a1SSI6hiDh05j+wpYYSZbpKHwcKyDiGL4ttF9F3YkyQkUhBT6CZS1JCXCNSzovs
         GvEbJ/7lXp0AcZDmVQbV2MjrTyLWmUWU2W8opjzPUTS03U48AcNRfpBLfjjLvRFicixV
         uJFB+Eyg2a9CpzB2SfGJq+1NFWezXf1K/+iYV4IKPRyH0FuNqetDvDZv9srMLesv/2uI
         I1jqZ+gQcoawI4DO0thpWP+fznlh6KSaxlorgTabWfJkyvp3WMO0i4BYqA6CJqUQKOhm
         UIuBIMDLuSQuQ5VJYKG5fD5l2phVjFISOUkavS9jywve9vErXD27N/iTOdxwYiq93dOg
         eUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266386; x=1792871186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=;
        b=XH/NZnX/4hBhkfH7Jd1A4jehr55dNaIxGPt3EZPXkyKctmHt4sprY4yCBklLZWbhoa
         /cdxhcgSttBmiccSB7uNGlZA/t5w8xh5Orru84K54HaEfs0Ca+s14Zja9qZ6bbNOa7qK
         gW8AG7mZeoXovj0W2xvaoJuSaBt097b+Y4+W+xmrBdjo/3fRoOZfDOkgW2JI3l2pUYOJ
         TmgcoXjzCn2bZgCmerjJjUXe+Y2+htueVKrCTe9GPygOJ/BhLTpKzPM9G4Cr19KT0qpP
         s9W2Fu54Nljbrhga3XpRIVF/PterX6jOHRGtqEAkwyBZbV86sWStPhKoLQC2pI6yW5TC
         2alw==
X-Forwarded-Encrypted: i=1; AKwUvBxeFyziiSef+dbyHDQjslRtP8zzmDMqQYcm2Xwvdc/OtUPKJv1gAlqrFDsztA8diO3EbriQQxDgy82POQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIAF9lIVRajauCVk4okE18I6I76FcaA3tFAxkyLO2SBujB7MnyK
	0qdeSAst8yDP7yp7gcZlRPuO/ZzJv8PRthpnyZZksgm6ojf7ZMg+TWrV
X-Gm-Gg: AYBFou32TaCT+peaKe3Q+zyp5dQlj/VwSYaYlE89HGlFHFSFK6dkYCm8kFa1CUkoDxH
	f9x4PYpCo5Oq0/F9nLLMjpQYqlQX2etmfBGhRZnV3DkNoCVZoZkiCFOA47u6c7jqo3ASg7/KP7d
	y6G/TPN3bzMhjbPkB8kuGuAGhYBuWFK32WfdTLTKgzhepzDmZY1Ax5mDh3q8TiLCd4SMSz7KO9z
	p/wk+DdYuK7snO2Rpi4eCreC54xApeq3oy9mD3I5K8fZskbOOVuEC1ktGzfkSDR4nP68ePLIYgF
	wUr5lobZzrx2cNnfp9Jlo+Ui5b3qW+YttF2Ca//SHKF7HwDuOWc4U4Yod8jiDgr/bLnwwqdrxkj
	WFGm9kiSbAaVA6hn3dajx23w1PE/KcH3BLc9Ap6R1GFFnG5PtFGMvvgpnPFduceICU20zGhbzP/
	iti8f97xHeZOD5O7OtI4S0N8hWr1+fhshX2JeTvhLsow3ZYoDzs6WzdUnzFDc/GFhKrNhYq9yH8
	hmk/MBrJzoH5DUKsYnCFg/1BXnlVjglujBYt7RtyzHmPHWQORvJTsktZ5qYJmVuYh+97EgMOBBo
	AiI4Z+NywGDMJqVq8SJh0vG7jWiW4bqostQJJy2ZCfYgwO3QuqbIsDEx0rwy4Y+uJGsV4FsDBB0
	pJX9OyhMlCeRjRIFkAcTkCdIE7Yrs/QHB
X-Received: by 2002:a05:6808:5392:b0:4c0:12f3:6007 with SMTP id 5614622812f47-53cc22e2b13mr2397740b6e.4.1792266385605;
        Sat, 17 Oct 2026 12:46:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:03 -0600
Subject: [PATCH v9 08/18] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-8-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
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
index 22cc8998d49c..82af3ccad885 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1231,8 +1231,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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

