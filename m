Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8517932470E
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354911; cv=none; b=UAODfh2mi9qzAVb7eeCyzEWSz2UfSymrjYJzL+mfS+onYujpsLMT2A44ecUwGnu3Nb6HSRtwx0Rh5mREFDTJX1XewBvl9rN+4MJIyTDU9OUdmJQszTVppIgiKPclo6uGFHQX1qLlSRRwhkuRrBFlm/paRxi/Zynm9e2FFeM1AuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354911; c=relaxed/simple;
	bh=ovOsliEdUhvhRoeaXGSGPM3LycBRMZNPRXeHkTBG1HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tigYZ4WgkB1OettC9Wlnd+v0jNdinWMw4GKg2tMeB//MGG1jwjxOn5DITvEcTFag/l5tjyNxHCHOacxURGUa45I1Vn7G7eESNS/O85gdIRVSjC8qKDwDVzfATnMTLxUWg5s2Utua+5sv0k+s+ISEUGkKaYJgOEUSIVjeLpyuWFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGO0SGXM; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGO0SGXM"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7fccd4c3f36so1513270a34.3
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354908; x=1789959708; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=bGO0SGXMn6YAFFhZ5ilitkRkKF8TEZctU/VBuot4Rlz6GHRMJ1sCELc0Wttzxq3/yM
         mvNjC1V5QlHCnlkJskcDM2H+ESnCdmlt/XlK5Ai2AsrUU6oSFJn4rww7OxXlI0Ztt7md
         35sHzacsyqdXy0g/b1UjC5ppD+C5K24eP2w5qSnhmpVV3bvPxFtb+sXdi+WbYxa4Tnqg
         HA8cTxGB/PtzkiEzZN0ZTf5q8iFMr/k7dnIObsSpkyYQLZtUjWe7yZ3D1ZHlEoZmXZD1
         x4HzgCE6TeGpWBGwJn7f2T5O2VjcBhxXohj4dZsNUu0QwN+fRnc8YQM/mNeFyw58VRtx
         +ltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354908; x=1789959708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b70jsSBwLMejAy7LligcsivCdZpJr/KiRJCHlaFZ8JI=;
        b=rQtpa+aT+Wv/sLnDH1DqbDDmAUeRy4V02z37kZ+gQELc/KEtbantY0IGmLq9TC+yCF
         /EjrhLiqeIF9WfOESiKnQ1Fk34MI6h//X1RpsI8VQZrYVFae3nu/t6WFOkASuzusPB2e
         pB1CXrhsPySXZRdh6+4ztfnjXXg6On+S5bFpHPDK+vT+2lekD/wCwxk2dAJJwtKbKQ9N
         3u0puYK7IC271cPGLJXtoTr1R/FNak8scgJTvlh2H09/+2N+yHT/TRNnpo50J0T4yuM7
         gjD5+mkfmf1JPjw/4wDwRXvwt3o4CxKP1HgIqUst0Ksru6KgkYE0QlQaU5OSllbLh1Sq
         TR8w==
X-Forwarded-Encrypted: i=1; AKwUvBzn7SwSPKuA39rpTixLM1aiNAgoM4ICDQWBmA0n1WVM8qlmX3rfXBZbuLlbuzZ8Tbgq6zQBVrWRt+/XiQ==@lists.linux.dev
X-Gm-Message-State: AFuF++n2BxY96k/+joLvWGLDL2nCm99fNi+ipZrTxBOIGGyAl3wZm/8m
	jzHoS9pKdoAfcVlUZzr4LOleuc2PvkEqfPu3siBH1L2eFa896TjIJfwC
X-Gm-Gg: AYBFou2YPAHmAe12PdxsSYGTf/jPjUjECkG60fQSU9W1kvFBJ6OnJm1ycz21uW+WGSi
	EkVE6h50gwTBBGBun+bcdExVEdB71W63N47NFT+4Ph7DkV//CFT+Ol7mc7c1iY4qjOlMm2Mkb/b
	6NrSYIvUkz9NNt/cHGKoZrskcFzSbDkc96fHeoWJuFZ212wDU1Uy/9+lqk7qW4beilA3TDEVuOL
	xjl3PJD7XEZXMTUhbnoDKGMe8GEhZtZYWJOa/gbsBE0cLQYAbewi+28zApnHeb7alSKbOxjEpg8
	p/6esuKJyvkEuU0Ss1FIG4hsCYaCgXuesc+TcFXK6MVN/fVhr06JIEkTBdB5uUn5wjWqQ7sqDgG
	V26WZEJ2tfVCdeuQWNgw65bA3wihFoYQupAx13E1Rl35Mgu4P/fbqIEgqOfzr5gQNghn4kZPv8B
	RJA7ZVsCmTqvuAaeUB8ZOG/JDxS5CznYOKbLfRaj6KKb9tJYL122uBSToZvVV4Y/bnpU7lp9DRj
	tlPtd0pmIjoOXxSYSuxRHFqdn8OarehTisVj5Z9cuX9GAKCh+xwOY3EAQM9gAUROZyQwd9u+MK+
	QoemYNz/FszDi36VHVVp+TuF67CndYtRMG1Lh3tReLwasx44gkm9czOEjtXRtshP753AuA2nrPN
	9owGYPtPgf2qXIw8uaAj/yMJ/VHEGGg==
X-Received: by 2002:a05:6830:4c18:b0:7f7:f55a:4bcc with SMTP id 46e09a7af769-80897c868f2mr541126a34.8.1789354908010;
        Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:13 -0600
Subject: [PATCH v5 07/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-7-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 72b79f893e29..41d6560d7df7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1843,15 +1843,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0

