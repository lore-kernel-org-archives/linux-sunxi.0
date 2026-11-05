Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904957;
	b=Lq66QujaKoDJ4qdIHAE6z7jdKKJSOpmVdOSSE9Or0fHMdgKl0ymqIl3h9ETa66qvc40j
	 8yLyNb5bZHstB8O0Ky44fIZIudJdX1MhFhRyG7wxo6QoDWf7HeXrPR3kgthIUxGybaED4
	 OpwsK+GR6veViNPOl5oFnYnw9qjHP15LOfnIU1bVFLezcj76Po5jMUyDH5Y6xLo4pZO/+
	 LxNOI9jywUhUFecBYqDevrH5+UO33vlRakZ4WRR674Q+zGV6kMBMP0H71H0K4aosddLll
	 KLn1OkALoL6Ij+QCb18nBbvqMp98Qs3DYI2jOLiKI73g9XZBMwb4AfXVc/HWZbooL1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
	b=CocGS93PAOBnk3P/3DsKaYlAilLWthTGks2tXnXxXz436I53cx+8vh/e4NXy2N9sLjP2
	 AbrR0kcMCsDTplUXKxog+5sNwOvDhHyNA00H7eeyzepByFr/7TJCIPlQcigPUvIDZXvy8
	 e2OUUBafxuiV8DsvMlAT5NPXhkZxn470QUBMPVOP5UZ7EFLj7AqlWoD54ySpHnQnL+pcQ
	 4KDm6qgOG9wOgDOpozS2MJADZ8PUY7K2PScXxkzt0k/aXcSJcVi3mh7DnYgMwgWR+sxkR
	 opKaQxxc5+XeF6nh4Fq9nOXEWaJblq+mmUroSFrrYNPWj4L0zcEcxsSGOqfX4SAUnjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDZfSlXK;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DB4606EE98
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39DB4606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDZfSlXK
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6f8a519e215so1084371eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904956; x=1794509756; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
        b=qDZfSlXKRudkyRHXJO1iZR00RQuH1Azytw9SL+Qj68Ax4q7PibUEnLWizaqVP7z/Ud
         l7uJakMe6uWH2XOW+HEUq9I5V3jovLF6gErkE24ZWmt8QcURMKNqwOMKfhrrF2Dx7g9v
         Oa+S19AsnMUomOfQVyUur3smISopI5B5is69dy4uH+jhYSI6sxbr7mes18vXL4QMDvJl
         wzG0d9QuMm7FLnX08OvXkvDZPQGk5sryzPxzgj5XiWr4IFj2g8EYJzTA5dr9naIwevzY
         429G4CFLrJnoVy0hXVYAbtYWTVqovJaySMqcwSd8W/oeG+krAGTh8/umvkwqqYtB4zJZ
         tMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904956; x=1794509756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNH0XGnfrH2iAn+70wl7xaYoYGRxFKFBAJ40rbga/P8=;
        b=CS29donDgZC5Dq5HU6qpAYT/VIKaRYRj8XxpergWlKawHjav6658Eo8bW60mmLbpKk
         HNw5iHBN29IitSGb5MLyEJeLc4C/BszZYXx/CcnHHrv01xOoOH23fs1tHK42jVu6hi9o
         GjAPIiGZuBBLQOthk6/85JGIr3ryVxZw1hepcWw2xSKNO9MOBUi7P4RQbwOMhQ7Iq9Id
         HFeS/rO+6r0zj5IKYw/6d+YY3+XpiYA5TbIIFd9eOWTPIK1MMQZiVducEqPsNqUIvjGu
         eLQzmmh/U4zaiA/MiptWlyqGuXuFOkZbPjz4qSGbBxRl9KHs7zPNCdS/LCXlfdIHV1pF
         DWYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZY6k6txQmIbAKAA8L5WUnj84qaVf8RCjfIwW9fQocKVJ1Cn7IXkiqNc7nm1FT5YkXFkGcxUXZDQqjXw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+YNSQCURfVK9TFPn2UDU5pLIXBujEOC8XPoI/0sIzmRgXvQXhs
	SdkupHu3pEBqdFbuBnqZhKQAKR56TT+y21eCRf13OSFL+VfMsy55nxZW
X-Gm-Gg: AYBFou2Y3TOd7/C0PtLm6WQV1vgVo0aSTH6+kJRkpj5jv5lLKKAs4qsphKV5vlm32w3
	mt97O6tj7FtHsvK53r0Gzvw+emPPMNKEcaCf0i0kPVWST4CL4HTtQkxLbTLYLgG6OffNqkaxB0f
	awGaqTKFPNJXM6XDoEqcrv50c7iAVLPIbU96Kz+Zr18nTxqDCZb9atI/hPJ3Qi1EH3kBAfF20oA
	+8Ri3OHLPL0yAipY3yAxFMZU4dVwnnhqpC0my7gkM3KVmg4KOsT3xcf1So1Z8CK3ZhJibEtVjlm
	kBqe7iBg4LPWrI4dk/XOI4A5qwVmB6JtvJIEjBIFjsaJLjsCBOZjs00g3vdrVH2Q54bNmCJpslm
	GJYKwQQEmZuCzLPxTftx0nOJ7l0/w5up28qZrEjSt4Axg8kdT9Tc//5RAnWXwdbpy9frRvxPO75
	G6hNsEb3KBQypWHTXJl+Y9q62SjbpgI6+5TFBA9PvWtcUfDR6Z0W3CJwCYRxqLwbXaHO3nAhIe+
	J2p/jBEAsgczInnc+mUL20fPV2XN4ifd0cZ21jWcmXOYiZ2CVwj5Y/X6HUnCf3bOiKY9EBnm6yr
	02A0DTVMSI+EJYDYG47NXJQHdBy5CSvs1RYyFJKiMOogsTC+Mekg7yam3dr/Wu0R64Pw699BTik
	KGlD134TEvPiXC/bN3eCSZOnlJ9pyV8vRCtynLnq3Uxu6+vn11Lw/7E96T48aO3Nl0PNr+yyI0k
	njp8yN1uHyYQWkso0XTyv5zt13/mOsY789GORv5rZT7x394erOVVdwJA==
X-Received: by 2002:a05:6820:a03:b0:6cd:3fdc:2669 with SMTP id 006d021491bc7-716e79e8336mr261121eaf.42.1793904956099;
        Thu, 05 Nov 2026 10:55:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:31 -0700
Subject: [PATCH v10 15/26] mtd: rawnand: sunxi: send all address cycles in
 split operations
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-15-dca1f6ed29a8@gmail.com>
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

nand_subop_get_num_addr_cyc() returns the number of cycles in the current
suboperation, not the end offset in the original address instruction.
Comparing that count with the start offset plus the loop index drops
cycles when the parser splits an address instruction.

For example, an instruction with ten address cycles is accepted by the
parser and split into eight cycles followed by two. The second
suboperation starts at offset eight, so the old loop sends no address
at all while reporting success.

Use the returned count as the loop bound and retain the start offset only
when indexing the original address buffer. The parser limits each
suboperation to the eight cycles supported by the address registers.

Fixes: df5057999f8c ("mtd: rawnand: sunxi: Migrate to ->exec_op()")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 54377f1789a3..0b92bbe19c0a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2518,7 +2518,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_ADDR_INSTR:
 			remaining = nand_subop_get_num_addr_cyc(subop, i);
 			start = nand_subop_get_addr_start_off(subop, i);
-			for (j = 0; j < 8 && j + start < remaining; j++) {
+			for (j = 0; j < remaining; j++) {
 				u32 addr = instr->ctx.addr.addrs[j + start];
 
 				addrs[j / 4] |= addr << (j % 4) * 8;

-- 
2.53.0

