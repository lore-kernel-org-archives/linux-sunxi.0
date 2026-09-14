Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB7F349CE8
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354913; cv=none; b=YZ/ffR5Cucng2zk0yB1SDP5YqjNGvMOfnZh+a1SWVBxVsZ9cB1JBOKYrDolQT21JZHtNn4LLpnHL+1F63j7Z6Gip73n1a5dXiCL9P2QF/i6FcpYhzeKmtozyqfMrksjNgJlFJZTHaNaRTNjKh+EQG/jZ8/9j++DmzFXackzS50U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354913; c=relaxed/simple;
	bh=YbBF9laHAErhZzSaGZGDzYG7q1LarpeBoJ8ap1tchQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoB9a2eDDNDa5apsW6CYTD4UroRClBxu6kS520EQP/k0a4El/RcxdVfpJvGdbasCVTf2HwqYXD5+awXgDQm7beVt2rhx0+xDLdQvZ/vti6dmup52gBLSJVd7nQE/5lsaGGvwM6bUAxcoNjgNrfgwc7MX5eLue36QRV1qtD9d1Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhUk+v4A; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhUk+v4A"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae739df5so478226eaf.1
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354910; x=1789959710; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=FhUk+v4A95js4MFPk0NoH1chDGUxzxQ1CxXF8612LS82Pg6CY6PHPrUBszs/qlhEMU
         bnDzyNwWv1Ik+gUrfWtqr0xGCw7eu3PLHw5hlV5YSrsU58OxK6Mu1wXtOCt7aK0yxGA6
         NRb1rY+KQhaI4HwiBL3cb0pAIkXO8jRmnB8Lwr0wjTi4qMPhPI9Fu/E4rr1pBXZKGen3
         mt3a4Q1FqJf92gRpxTRxXS68pKf8iAPsXGomNtdNBy5zhRMYNUL7cILeJFk0Hb2GjkRy
         7oVLc0kMyY03KytSH6UBuOVVqdRg4NirED2w4k1YEgH9DtWTgj3hQrSUbHrWaX8LJr73
         F+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354910; x=1789959710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0CrISCG3enxLUNERhlMVwT+4sBOgXXXdTBmRqqtC4g=;
        b=a46QTe2bRuaVcB2plzFuBvyS+ajIJxCRc0xzJUucJp2iIs9emTwGN8XLmEFvmwxwKE
         H7pLvAAX5pTuhsViKlGY0zd/bwYZ8NcV6GtDyZP2sEX59aEXcBmHAtaQCR+9jyBTd7ay
         1Lq5m/Qn2T+cLNXgIiTCELzAOBGF39FqMIgXYwy/x/UKxyTqG2QfmZ4CvbCaRk+LV4TP
         zyVF26e9m2XzrEWCy1faa0KlnHcgjAN29cptiWyOqb8pLiGrIvn47AwuiFyUjHUVABEr
         q99sNDl+iFhiyQIAiVeeWrlxtOhfnIVOuQIkXZ3BvkqJGJMSSYUm8TuZZyAI+/OGdf9T
         rNcg==
X-Forwarded-Encrypted: i=1; AKwUvBxWRUbPyIRl3njBBbLDvGxXpvlzpovhqmGDltxsaSnkDJg+GIii5Nlm54guSAG3K13sbar45FPbN6B4tA==@lists.linux.dev
X-Gm-Message-State: AFuF++kje+DBUN5IKGvknNvU+pUZTEQyQzKAEHwDZDXjwcZYqHy2zSdY
	0pdupwS7HxhJhbIqS6QjEnMgQCeYeW9zxvpI21RHeWtzvI2XlNJ5dAud
X-Gm-Gg: AYBFou3Zl+i+YB2bEEcBGIZxlsyuohh54q7gS2vxfB/h6Bi3RvbRycPluFLwOGdSzge
	lUv7VcO7xIocjlkcH5sh2yhjU5LLheOSS93fKGHXAbcpQntN/FfIQ4waeujjL7zyYGY6ZyxcR/R
	ztTPVKPALQWOBiXRUTjpfBIkuJbiiD8DGZIUgRnLNqsDMVlAD1NN2skUnwl7TnItWnlTxbVnTKg
	Wm/0IhOjnMZEQLU/JIRrvxLeCIZYZsiJi1KYZ4KiU3i7WGdKqnq283Bgb8Jg1dno6xDK/2q6d17
	kG9TYspfkCnLI6TNGPBzjmXmth3eEtAZ/JQF12T/RAaVmV1VJjMNmZmES0gqKobyviG114Wcnn+
	JflLdmi5eVu4fX1uWnwz9yt9Dpe/BfQgoGJlkX4wkCU1KwAXj+7XlM4zZJJBkdNCDhRpfiDtl5A
	1GRQ5tNz6nep2BEZVzobrau7jBH6qMr0aJqnTNtDVqIDjqqdB/JNZLdfgnzmzGFkjlHpe2xkKN2
	D/EpxAXOwF02eIxMclKkfdiRkCT3R6iebm1wlkR/Lzg5bbq4sKvWw/lF3bKv6STbgQ9M02+kUEI
	ZJyTXmJLhvAZcJSQYRuyKJ3mLeyytl7vypgNh3W6wlYxk/aufRbG8AQ8njINmr9NOGrhrm2N0Yl
	+idfhZuNK4Irsg0wN59nNnU1BV3LENhA19LQHi79rmw==
X-Received: by 2002:a05:6830:4486:b0:7f9:555:1def with SMTP id 46e09a7af769-808863d0ac9mr310838a34.11.1789354909720;
        Sun, 13 Sep 2026 20:01:49 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:14 -0600
Subject: [PATCH v5 08/18] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-8-7d711076a6f7@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The PIO write loop tracks the absolute NAND column in cur_off, while the
extra-OOB helper computes an offset relative to the start of OOB. Comparing
these values directly always requests a column change, even when the last
ECC step has already left the cursor at the start of the extra OOB bytes.

Include the page size in the comparison, matching the extra-OOB read
helper. Keep the explicit column change when the caller does not track the
cursor, as in the DMA path, or when the current column differs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6560d7df7..13dc0af56eb3 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1509,7 +1509,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

