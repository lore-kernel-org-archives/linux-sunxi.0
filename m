Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904967;
	b=f9+8Vmj9ovWUls5zJIS9c55wUSo509hTsJjdZDzqQBsFD3Anw1bagnHQxB6NZ8Q75T6v
	 FZqAXLVRiFm3rkj+332OtNw3I9dRiF0eez79rl/AZdnu7r43lj8y/wcKZctTlzLur9CaY
	 ExhO+KpowvQgfRiu09fwMa+qzXpXTnYhUAdep4tFbP6Q3dcrt5locd5qrM+x742MsYmwb
	 SKkpvnnOs6lDXuNDTckTseMvqSsUXEI4c0NFsWojrCccLYL2NyKLBb67igB3txXg5JHpz
	 B+fR70mxWNDT3GLzfZeLIBRVCqThiXn3C5w/zv/GEyAfowx+lYFEetuXS/lrJXlVdjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
	b=qmf4m7v1N3Qc4ohsWTQA9xVJ8YQ8+JL3DqogaRiYNYETpGuh9pzmLZ5lXuLWsB86n8Ar
	 UvVJBZAASo/kEeYy248/IbdIriNZWurxsjupYA+BExgzkaVXFvLmQ/7BLU9VYLxjvLiKD
	 0WcEyJlerUvRf9jl+WU3S9kH+Z17RpcCd9PIwDxdnVvm4WUeR2rcygSH38yUALx3DGjGq
	 BhI7mzWWWRFNcRJJY1xSaDw+Lk4U0i8vFwQjtDhEVIVJMldhX3PYcYi4hfVbSkajiheoR
	 GhhSYlYoIFT5iBKyP7g6/0zd2xYjlXbqhspVUIvS5hwSxOZ3+ZkRY/3wkHYCm++HyPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePbfsBne;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1712D606A337
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1712D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ePbfsBne
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f8a519e215so1084573eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904966; x=1794509766; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
        b=ePbfsBneSS7MF2ambGNIoEm+8UHP+fFAHXDCZzy43alE3/ICmiCHflZQ1EinMrYiXN
         2xo8XkFVpXBkpJD2bcUJ72i+w0Hjz2do/ueu0rhrLr5F6yPUAezcva3XfzWCt8BV+j8D
         ah/qojfXyAsVLAAZqZsSeEci7XCOjjt9pPdD3Gn+pqwwfbWQPpcs/mHRpXZQZGGT+yvF
         6xtdcyAjY1WEaBVTYpXdh2T2zMdrEo2VgUi8tBpaqshzRiC+n/YPTPuQCwiVZ/GVJ4WO
         Tflu74lTY1ydGkONd2KRzU2627k2Wjfs0r9DE2XTQAb2RUtid7rSvygAS1YOVPDm/fP6
         sPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904966; x=1794509766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
        b=cGrPw5whVBwGKGDDtU4LkWwphKmkBPhgh3GmzoUV9Mb7qYCXZWIKn7lEz3wHyJC4mZ
         jRsst3KAHSWy+M3QFlFD31V4uDam3hWy3MZe1pB8xQJq0h0DzutY3yxMZvwq541WDlLZ
         4ScotEuvMD21fc7F2Ue1AoijeRZbB9VfWzt5vQpG4Ew5VifhytQoFDnB9rIHbQ4SHQ03
         IKBEFNb9jhZO5k3DNsIlddVZElA98eqqu3HwE4+JqehmWNqlpW+76mQBOBmlkzr5rMzq
         Z0rOc9DH8L+cbyzmSS5IBkc3BWSsIU/kVWOG4iGKYl1bz+qvc2PHntJLp7lDwzPFssao
         RnlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUhV7V5w6mAahL76dZIjnG9F5bpUqnTygO6XwVuvEnrSr7OOufEYGxWCMV7M0NH4BqiCmBVkIR6SE1oQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9zmEQ4594NkcBsaM3J6P/JDoOFefu/qOVqiJe4QRcsx3twQ8Qz
	EQLb0cHvhdJaBdN0fvYId3OYxFfFdPGh1JG7WEAN2R1FLm2Zvj7/MiyU
X-Gm-Gg: AYBFou0kVTwQ9B8Sdre25zMTlnhxicKkQBhefjwlAIDrLT3gJM9LL0KmL7lJk5rOcdz
	uHoqgd6N1TfXz3V46XeqicR3y4dSo9Bgd4dd6FB/WUo7F3H7JvmVyEQ55sILz135ZZ15MI8mk9x
	bPjq0O+yrjpV489IYrxTt2OJP+Yk1MK01r96nMFw1KY0zGXAb5SXn9q2iO8kVfRmUoa3WSgL+vt
	BtwjCs6AD9pNMNFkXc322LYi/vJctgAqbSaeinNUsLbSS8GlH0Y94iRX+HpoNoe5UJXG2YGaIs0
	XTTkui4VFQ9dcpl4AkaEesH2JLmopUO5x2vK+RxaejbELPLX2ZPx7tXC/TpNjV2gxnoJNDg5QGk
	QC2GRQu5B2UDJrElOcF0BuM92S4tNxpfY5TJTTeogtHSGwd9+6iTas9YRJJI/NCGcXNFe+ckJmS
	hXXvXS+MSf36wNuNqehtgvH0jzsgCT1d6w2qO52Ee6nCfj4Y8ubPhss/YXXa6Kee4JeiTUpST9d
	v2bHLHHacNyWCrN1zg7lFYs9AJTmE0Cw3I1tWhChWu6cJfUqZhuPsFYLQRWI4pLCgbRfbRLH3xF
	Gc1WFFZHA49SMtrIQ5DiFHFvsarmaJAwaeMNrVcXWlsE2ia1sgoVY5WafVu5tIDreS3bIBRY24C
	SkKZrmkBfB6hMTdVM5HvnThfp84Zy3P6Rjjvoly2H4eL0VpZTenlmNEUS2K1A2NRAun7YIMwql2
	xCH8482oEjnJ23LpMN9VMv5Iso/RTrkyLHYgrD6v2Ncf9ABbRsbhVYcLrTIBgKqgl0pN7Win0Zd
	g==
X-Received: by 2002:a05:6820:151b:b0:716:e9e0:543f with SMTP id 006d021491bc7-716e9e05899mr67251eaf.11.1793904965992;
        Thu, 05 Nov 2026 10:56:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:39 -0700
Subject: [PATCH v10 23/26] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-23-dca1f6ed29a8@gmail.com>
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

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 11fdc10c7f14..c9135c8abf54 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1718,7 +1718,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

