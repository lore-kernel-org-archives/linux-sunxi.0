Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223492;
	b=0B6t83QVGyj2HYtSC4A7gKoEssJsf5Qhwd6XrQriJ2xXkD2EjtfqIb3SG/wVkLQJ+rfC
	 Y3S6Hyd5rlTd2jVKmOdGclVffedWagSK+balY049vccaVpVzR8d43fPgT2spLn7YtF3Cy
	 B9GN6MIqeV3OqwaqifUHHwzfcvuu+e78Pv0VDL6I34X0fPyHBNM+EKMXmMYC99MoWXzX8
	 6+AvuR4a5GjDFu1R0agO1/ORcL0uL6jGaa/FHF5nDCQtTJNzZQTWGi9koXAX4n2WuheTz
	 l0GILVRy4zQtuoH9DH6hDUZeIIQpt/JlOHImof0Uw+eZ7r4dpapnzS1WfNvQ/TBKGiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
	b=4S/98532+COD9JNwMmQ+oaPr2DtXHedpHmTsruHcBsMkiPGbh8jmtX0+Tubub9hlWsE7
	 yjdvMLTz286egTWHtGDTwdyxTDwV8Lj1e9+bAQwfp0kf7mk6iTXOFYBqcj/TEJ59ZKkgF
	 8ahW9fU0kiTWeqCiqBGcRtS8KluRVOqll9y0rFj1f54P5q0MKTMDklYnk8E+bttzci1pb
	 7010DlNlDLuqixFajz8x1fdQvu5B9U3Sg3LFrb2VqGzVIhIDPth8NUzl50IhoyGIIMlHu
	 m9lXr1BzMdyjA0jpZXc48kKG5nj/t0WC38qzVzkdESUv1eiU3ZOEHNIXj0mVtIrFXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUfJKR5C;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B7606A332
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3B7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUfJKR5C
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4a451915d8aso1058877b6e.2
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223481; x=1795828281; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
        b=dUfJKR5Co0HiNlns/knQqGqHSozCwHpvG5LIOoYKAgJKRpenRopNjyZmK7xCG8ERwI
         PAq8bVsgzkkPG5MVyhXwwDoN7ZQbWdpVXDJ7cma16N9BXU3PrItES3SfQxltxJP+/Jst
         VPVVOGNyn65VuPFRqCxZFpZD5WgkQq9fYBl4u62jzRDBwepvZnZhblOMUvtvHb6HWerz
         PlkBNvrwYx/g4+RTAP1dZJJBKa6iuV1y2ZTkLbZXhDnQMZSejcX7QlT7ZFq1gTIOJ1jz
         uVCUn9NwDEeca3HSQSQtc5I7WgJTnNJExQ12q3cmFRd9jAmo+MMv84Q0BpezbzLN6Vjs
         jVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223481; x=1795828281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCmwAi76omzV3Ocey3RKQm8GgxKEzZYW/hAI8TU8mC4=;
        b=w4f8PoW0b57SIPWdqyLbT5224hdpWejZLiM9TH5dwFYDuOqekC7Pj/wUZSdGHsI27t
         0LAAmMakiQOvNYkK34XACbcsHeyfZL8WRNuCjB+3iJF/Tjnl8nG5uVz2y2a0UryKYax+
         JNL25xGoKlL1jDaPy5hJ7zMJ0OvMeBTzvV+DM4TNxcaes2x9wj5gvkv9G7bqqa/VV5h4
         76d9CQB/ZIsN7kCnwZLqBeNp3P2nmGqFtKkFOqM9Y+CJTjs27Z5E/Mam4VgYiPiXSLjU
         wnl9mLunqZN8qQK157GotYYwj243vOILC1AcXT8j1t6+WuGOSBtcMBmS7iC5RCRNDBDF
         OVHg==
X-Forwarded-Encrypted: i=1; AL+hErEYnxODdUpPdv8s94wAfNAR5JQRSyLaX1ukgfyyHpdoErLua3DxA+JxD62GlL6mKRzaO/rmrXBBVVJUBA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/0XZs5wCNMmHqxSq4SemDEy6H9192LmbNetaXJ6Vxc8S8Z3w+G
	o9U1SBHtY8ySM2QblYUOZxg71huB1Jtz3x+GE6SGwg4CdbU4fwt3wLBE
X-Gm-Gg: AYBFou0egTJcIVtB73uqbti+p/0pxPzCo/HIFRHm3NJFKqV6FOPhkFyG3hC7pqGzt8f
	wDrYv71q1s1ZTl219S5Ie3XhIIKp1wcC/JyNAINVoYH/UDxa+gwSztJM4T/wmXcDJdvYxHv8vff
	VnTMvV660UhyxjK/MwIlqJce3DE0i7Khl2QD0R82/DaWk8/kjBqewP7W+3I1oCxBr4b/Gyj5opV
	SnCQm3ofZil9LskCMMUmfAB/MmHVPP74AL0ZG/Q0eL9v+j1cUxg7y9rUazmHxJHCamUXq66vNBp
	VmT0JJ//7pD8lx9u1YDITN3rwZfjIU8dlFQDM4ZjMXSf9+2rBbXRU2CNivwFwTbzlio+4qAGwl/
	zfs3nPKyU8MlmDg3RtkeuhyaeTJoqU41N12tZCutXBENe0GPe6PmSLcAQ271roSqQu8vFg27kPa
	i6ONzBnZCBDpINti1mtJQcQGyFvt2+kDBnAJ4sojToQK3CIPrh7eJ7MwgzIeN1W9gLT6Oe/QPWV
	dNlL1zM5C+uv2XkyaXx5Ekq42BKgNIYPMtPeNNKmC0ks5XCctcaY84dPPCL9qvnPBDoXLR+dv5A
	/UkoRIq5FffJauUzdE5l9TwOI6IAk6+WwhS8l0FDrD5kdnjpadGY8yrWkKNEhPxCB0Uyu7Wy6Ml
	6mx4gJtGGVRlyY/lewTPxIux9qAB83rAp4kyMO4z9mf5fvtJgK/ve/ZIsrZmIeoqVxhAE/OWqVD
	V+oCOQtK4p7JIu1sA+K+i732YPXWipkg4X6nWIP6byGkOh/oS8leZHtYTX7sxscyNNH5gNiV5b/
	A==
X-Received: by 2002:a05:6808:152b:b0:53c:156b:a16d with SMTP id 5614622812f47-57a0a70b0d0mr5784172b6e.56.1795223481233;
        Fri, 20 Nov 2026 17:11:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:41 -0700
Subject: [PATCH v11 18/26] mtd: rawnand: sunxi: send all address cycles in
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-18-9721b1905ef4@gmail.com>
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

When an address instruction exceeds the controller's eight-cycle limit,
the driver can report success without sending all of the requested
address. The parser splits the instruction; nand_subop_get_num_addr_cyc()
returns a count for the current part, but the driver treats it as an end
offset in the original instruction.

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
index f8bc6e3c3ac9..ee68ef9bba33 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2410,7 +2410,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_ADDR_INSTR:
 			remaining = nand_subop_get_num_addr_cyc(subop, i);
 			start = nand_subop_get_addr_start_off(subop, i);
-			for (j = 0; j < 8 && j + start < remaining; j++) {
+			for (j = 0; j < remaining; j++) {
 				u32 addr = instr->ctx.addr.addrs[j + start];
 
 				addrs[j / 4] |= addr << (j % 4) * 8;

-- 
2.53.0

