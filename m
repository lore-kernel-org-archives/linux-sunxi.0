Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904933;
	b=g4BrXlfjuOaRdAm+1K/+1gzZHDgobmqTis59D5LbNHr9iBhhB08rJ8ZlnHtHNcEHUzZt
	 6Q3ta5jQWhbW4KngHzVbexeMFlzJ4HcSzL6VkNvQJVtsBC/Ce4I+4HHHdWOboGljrTNDi
	 5UZDEUAYysRItsj5YtQDA1mUhfCYiQPDrMLDDwwNniPfuan2d+cEc97toWkwTZiUC9Oe1
	 fUgm9w4ikN3vDgc7upQYPK/KUK4wbmzwYcupQX4FuAcHgUtYDNfLxrZ06PoPFFsbaG9M7
	 Bg9AwFs4j4QlPM69Tnm3PbxL5KOFz5TwJvLZW8xQi8G7a5c9wbwB93VbC6Jfh8yuIpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
	b=AYwPRm2jdGsNqbzSnKa/wmYVCibT6KxRyyCN/R+ZdbpJKcGcuBE1jKAJF2FpClapnJkj
	 KtXBaS2DcIh7R8iMwnnKu9msjtS9XmBxRV5ZMqyL93/MgnUeNSxvnLt42TfztV9TZ/Mi7
	 lertuCPjhdJLEHMYRFbhIzJ2HROyit3Y+JX4VXy0yzNJwd76NDTUz0qEmMB5Ls8esvJ2i
	 zL/+Iwb9mhQcnMDDwjdTOMS7AeLHqssVkXbC01rNXzM8fr8Et5K9bb4Gt9/Y9cy5EKwMZ
	 ZiKNvH1YF1KjAGD6quHEHTPD6HpegN7LmJ++eEhleVJkxWit8Na/WET4zloX13sVaiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xSH96Eqn;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC49606A33C
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC49606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xSH96Eqn
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-704597ef1d8so982287eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904932; x=1794509732; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
        b=xSH96EqnUtZq4/OLZtxBnMFDEanWN7BqopfSDQxulxuYUsyx2yGItshFpi6H5MqdHs
         XVJgwiTU0p6vPwa3gn/RsxEVXV4YqXiFjOY/PNTRMsWUWk5zzcxRCubYeKeVZieStWJ2
         TSAzrrf4GoC91CfgC08BxpjakNddXUZ7wJ21Aza1EFvaZ83uCYr/zhPev2jED6HlOVYv
         g++CER6Rl3t2BX3lFodKrCdXc6cShsIFbe4rOjK/3LCIRHJ8dSJZ/lxrG4gtvzqHBApj
         1nKdrt6dIlPJNV1SUvTsENj3d2KhKPvuJ/Jy6cFagycL+gyhE8lJ03bVssvGpboXxcEe
         tVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904932; x=1794509732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex3VtA9PGW+lx4Jwo9zXOKsJ7tUqHQi29kWPU0YYtkI=;
        b=EjV8ieBBCXLs4Ue8598K4N8LrdsAcfOvxlvu+UtRBQOXKudnJmmJ0gQxH0ysHwP1Yt
         JUNt5LbmKUirSfNV5fB8RhEn4tqGe7EFdLZi979EEFK++M/K0Kc7+USCS5MhZbh3p+qw
         YOCdn/ZvTFUutujVPGGP0NXYmxdkfTQA48sm2aBHKBtb4TkzDtXmqI8JG/ewWUBUq2X5
         jLtBQN0FO1/FW+4GLictSUM7KGBlTizo/Z5UI2Vvyv1eYs+Pvnl2q6L14IDAN6bv2Gtj
         OhvfWf+00kiNZXNyozd8Hs9Fjt///BLLRIUsZcOKS65FyrXepyYMRXHDJfMXPa/8K++M
         +WyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4dOAzTIixAfFgnX2W2mH+e4uOvPLPL8mYzMD9DwG0qZbmr8oUiJKgQYEfmk43Hkn/Uu9ez02BhWApfg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9yssApLiKnexL7Zm571aBStfPt+GQXM8RoAnJi/PwMoy819FeF
	CjPo56Ld4O9QgwXS6uS1fiqbWNOxsbbO72VJHF/fE3mSzcttOyfyzzmW
X-Gm-Gg: AYBFou2OViMbxWFeTLJAT4zzMXT9tQ/lLyJ4bQllmpv2WAblHTJoWQnLvn/eh+7zp6r
	skX00V1D8haja4CJ7wvrQQedR/c+T0wX/KT0dTIer4q9ilCSJjqfiA2Qa4QxRBmEfDwD11IK/RZ
	l5icH57fGGVIeNeosc/Qk4lAnCE3l1d/FVIHoNprZQKqYf5CnICgTzMs23rwtuzCS8Omy2WxFyF
	VIYQCjgOR1lLtah6jsOYLU7jZB7N38FFYc0k/sDnmavMvx5ZcRu88Vkj0yOulsmPMtz47A0S31H
	IDc8PXYgYGtYjR0w7xV/KRTag26Vb29fnfh4Voq3zVqmhB/OgA6D/ylasBKGzxENSvW0mJ3gjQ3
	LL2MlAtKXB1MB6Cn8hVxiM918qE2k9p67Zv6WBPxUqVB/6MwOq6a9pD0/2u0yF+z1pnbDw0suXT
	n2l63XAiwTD1JFUrxKYDby9N3aOoCVjGMhxSs+EFQxT6uTntD+iXw9xSusPacCq9o0wkR2c1sCv
	IDBaLglhvghxUIeXy7kWrRpqBGw3gm2QazbpMZO54mT5GjrWidDYsOcJ1BHN+GFifTMgZzRX7hV
	YMRM0LRxXtDqxc1y5i8WxMS5NytJ6ei6Sww5VXyhVhBBk0r/Cxd6a/RhG2TLKYJRp90ah6qlIOa
	rB2K4WjuEuf8dNXjGyZMZePnWOYMvEh48HuSZHBTsEp1iW+6YWt/0LkHC9OflxFd0PG6A4Q656X
	JUtZMBpramNrnOGX5byE0d4wk7z5R/iuwq51NAvrPfa8Tv6NbHZVK+WdCJXHgldBn81YQ3AUELI
	Q==
X-Received: by 2002:a05:6820:2484:b0:6dd:bc51:888d with SMTP id 006d021491bc7-716e79f15c7mr263473eaf.87.1793904931737;
        Thu, 05 Nov 2026 10:55:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:18 -0700
Subject: [PATCH v10 02/26] mtd: rawnand: sunxi: share the buffer transfer
 chunk size
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-2-dca1f6ed29a8@gmail.com>
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

Use one helper to determine how many bytes a buffer read or write can
transfer in a single normal command. Keep the existing SRAM-size limit
and command sequencing unchanged.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 80006d1a33d6..b75984961699 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -659,6 +659,11 @@ static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 	writel(ctl, nfc->regs + NFC_REG_CTL);
 }
 
+static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
+{
+	return min(len, nfc->caps->sram_size);
+}
+
 static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -671,7 +676,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, nfc->caps->sram_size);
+		cnt = sunxi_nfc_buf_chunk_size(nfc, len - offs);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -709,7 +714,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, nfc->caps->sram_size);
+		cnt = sunxi_nfc_buf_chunk_size(nfc, len - offs);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)

-- 
2.53.0

