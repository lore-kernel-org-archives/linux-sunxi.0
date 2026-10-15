Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E0C33D509
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 01:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028077; cv=none; b=MolaNZ1dIXHR2AhOls44QiHzNLKBdQ2YyGKCCowtZt4qIAPCNLp4iS+NlPGwvCcirpyv/vSGIWqjDVrz4sQU9s5JB2wKWVdTGAHtIO5M3sRshPKTl5caSwbvAtX2kR6lAplcO7e6Rlml2CmzeIWuUrtoW9Gngxs5HKrzsMnPLzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028077; c=relaxed/simple;
	bh=N6VYX2y4jRer8ibxun+86X1ICDnbdaEYXj+AGFjjsL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fcuAwYGR6b7Hk/Fmit138FqrXwZKOGbL8BlhzKlmy9PSNfBlhXwt6okYkTiq0ir98WLk5uh/CgOW560YJOT5T9tu3y3zMTJa/CZjcWkcvdeLXqehQg/7XjYsL4KOig+oITEjz7O/VuWkQJ025o9RQxmE1mbiaJgy/LbDHSSlB8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qG9bi3V3; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qG9bi3V3"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6df7f544919so3160867eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028074; x=1792632874; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=;
        b=qG9bi3V3cH9gvW4pJKhNqKm/zYXGbLxGarK0e0R1y+xFHl6T+lJ6HpH3gbMG/wUNi3
         WpIUNmzw0E4+ElKDDH8EarfyjXyisrGD2gDcmRT8j0wmtedtW655c1qBZKJHnYhm67Kk
         ejbFNQL1JT7K4t9bewrPn6xn0ecx/xwFtNwvbScs6jgso/u5D8/YwK4HaL7kZWlr8KWD
         BLopsGDYstXJdJWrQhCY+51XlHmu0HhFcaTDoabCAkFN5A5Z//vxAokj0LJp5zqbrCLS
         gv2F58BM/K915bjftk35Sd++DTqrL3ugUkNGKGysNvFLGAURfF4UMVpj7TN0jEbkSGzC
         dSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028074; x=1792632874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1wjwZJLHUWptclLLQZn3mtfqh+PMZO/1RuhWVrz5Xc=;
        b=qAqV1iPK1ymk5WVoLV2x0hMvvr052RRKulIwv0d92nT5xCjT45TRJIqm9IzuR0ZiOb
         J5dXspUNd/3DTWAQC3qv4D/wacBJmd+yLbldmVyUqZVzxe7WTX7LdslkeH3jV1M/Nn8p
         VxzkeiI99Bzi0USSoPU4u2m/koHx/ghFkJI0aie5UDYdrQfHXtuuZ82dU7NokjCOZny2
         D2zL2wRdCnGBs8YFMUW6zdyLKw8kpDoEznqHqSylNDbEe6uq/JoBSv+A/GZedgOamsAf
         e4MCicqtmZmgxuw6mRjyL1SJ/pfavxfwH2nVuUJoJpuRRcJv0V7B62erx6bMUWU+LVXY
         rySg==
X-Forwarded-Encrypted: i=1; AKwUvBz7eLOpcCTZ/VdPotSmNHjRFZoTLU/smBtFJ7NZzu55kjhWvmLy1KICUKh5H8c5U3TlWqX6knwqVf6k5g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJJZYQ1SxVMPFYv26yLhJyIz8wlGRx/lR/yL+o24PS3jOY7iXbW
	yO9+070K7WAez2mUYeFEwyeXakW8KfiRBksrnvicfIa5JptUMfHDhRWL
X-Gm-Gg: AYBFou0rB05w9V03iBMLSUWJNDSdfW7JQslYIr8io3r/4hwJlJXhFuffxLH7HGQrB67
	iFZbL20gayZ/KqAvuOoppl9dCxgZmhYrBYxLnYGOKH8mNrOkO1auzbSwX+QtfSu13rJ3I9JKZQs
	nXo7FnQfmruVWh2+/WNFzT+WAPfhISO4BakHdh4GRc+Vyxx2a8sspeHxtYat/WNUQ7ghIJjquiM
	GK+SDIQbZ9BsR1kXSIYn91CttUPiIj9TYgacsjnyG1nssB6FsbNdO8X3XqU5ssC6REjEN61wZPh
	zzoK0s9DB7vienCT1peG4GI6Z+zuCcpQ1ag3qvnh03HEKX8jgTRGQnsSWKRu44rmAQwcdzE8/JX
	IQhdhH6ORg0TSGm7lvly87jIRWLduUuhvxyXG4lq+ywYfYNrC3kGbKCk319pAnvb906jC0OHWjb
	fn0MYow9fqtc8RkOKkuhf2C2nRDglOY+dACarxj/Z+nva11FZKEW+yibTnUiT6YwSmNB6NW6dNx
	QQdVV4+d6FLQFdD/g2XIuncj4mDmfD/h8lQ6sLRgvf5AMA2h2nb9NW2f0rCH0jbuXEAwnTd80NX
	/43T1fU/M4fozD0UnxEnfgUBgaUDcGelhCBRBmBcXuofO5n6cKMbY1tTVut6uWJ5BxUHzZc+SHP
	Pr4WCcBAgUSLDJRFi40w3
X-Received: by 2002:a05:6820:81c6:b0:6de:1071:8b18 with SMTP id 006d021491bc7-6ef107958eamr11840974eaf.75.1792028073754;
        Wed, 14 Oct 2026 18:34:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:59 -0600
Subject: [PATCH v7 12/16] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-12-5d3fc6ad2da1@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
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
index 8d83882592de..74fdca27ba10 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1612,7 +1612,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

