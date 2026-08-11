Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5257525DB0D
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 06:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428139; cv=none; b=gjxxBkVAjMb/CGuOVala9Jmhy15g86uWFreIi+EzDofqSV4vGr1BLNeyTJSFtP4sNaOt9HA5RR6fbnfPTjM1SfRoLmh+8u1emOAkY7jk+NzsPTEaU703p8vubtl3K2vR9bbZBibw6K7rpefnOfWpp5kDGOurkfTh3GVqZVjz0QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428139; c=relaxed/simple;
	bh=vJd7EmY2JpLzx1z3MXo9S+yfJV2YZqsQoVfHJSu+EAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMF80SyalrLiY7Cb6jY6CP+6vZ0onyhK17JfuxhF4EbF0xhSZhzZeNEwAWy8JCw3rqpYXLbc+vflQ6UIB7xJ8dSFd5rTGO2nd+Nwh5nO/PM4ciAeskT/stfVKPFefv1Jdziv+cuxcTzLFtRvUXzCgKMfE/w0aWC+p3OIvUP4xq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSwjlJ0B; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSwjlJ0B"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6acc15016f1so1541724eaf.3
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 23:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428137; x=1787032937; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhlS5DCvXMRcCc3UaPNyrbXwvBz9PYUN+5lwYOhBUzE=;
        b=OSwjlJ0BnfLcZXFfTBqZzByufjxuG9YXtua9IuY22X6xdcDxIzK9B5/Z/2RmEy4TkI
         JMWPoSo+q/19Y3qCzt66BO7XY8RCFUSBa1af1Rtm4R64QvrgY6a6ZT7LiuPBhLox4MEu
         nVwNjX5YEGwJyKGc0O4kGX0fy9xnpv5fBHB5e5n3LWUBGkxukzL/vRoR3NJzdC4vaHFu
         B7aOf1V6IcG4LHtc+O+UUZSQC6s9oGC2WOywS4qaMFdiKmTIKM5CpDLFyQxouVSXY1y0
         M3PfX2zo5nfeMABLIpmBUfOBeIGF2qtV7Bu2ymDIGYcLQROOuiqa4f3A84LM3E77YKbx
         R+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428137; x=1787032937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhlS5DCvXMRcCc3UaPNyrbXwvBz9PYUN+5lwYOhBUzE=;
        b=qHqeUtLbr04pOzDqxsgzV9yIR+jT9v9nQaqfYoTbvLYYSZf9RGhYE7BYHFTPy8t05H
         Ejnc2WAR1OOduxNNBJJawaDUVYWpzupdsyqcIyLz/lV4uhzF2MaZ98ThMmNzQXukUmdF
         HjPbi8JcPo0OheCcrL8yJFdI51rzB34ihCLjbv/O1Pd3RIc1d099lmIKhIFWkUFrtWt+
         Qglz3G3ESlut5RivaYaRjHiZXxIQbVzdGSm1VjeVM+BDz1AGEyhM4ZCgi+x2ect5rbVM
         M3uY6SNqJmiRSSsvDiusbfRcCcUsMs0xOx1liZ85wqnNynnFAUqy+NdBm3Di8jHVDxPa
         M/Lw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+ZiXIn+SdeOAd6Vl0BW6U/5XdeilQL/uoUUicDv60fTEXi2fin5Ejg3ryNCyMxCpYUz6NJU0CHYETWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8ZHpzMM8XjBWoZWwHtP4xDc1hBVKP9jGXHboNC5XPZFQV26Cg
	9VjEI5qfMzuTSAwv0LU1nwUtH2YV120i8tR0YwnpdzYfYiKbdBAzKCxe
X-Gm-Gg: AR+sD10JDx60E0SOO2MhWCEVBG9RN0YHHWJ/J9Wqj1xBe/aFaVbC1iK8x8jUksgVOTx
	abBKxNejdWmLKkYk5qKtZ1StsddfrD+Gfq4a+S7fSzXxz6LPRZzyeshzfEGG+OI5d6U/JkA7AXn
	aI35to/+4tpMC43XkGg4wjbjStu/gMrM9gJEY+1Ts7TgDMibg2Q8KYIh1SaawFNh2Vk4l+cI3de
	vb6kY4QJnJQKXnmR0EWyI6HgbiD49N+wyJdL5knr7bvcW1/HSvxObgA+gQ93QlENlcD7xp4Zi2k
	a6ckUav1+KiOWY4EyykZ7T/xNwdjY2lc4/4+4Hb+uguCjLyWXQS9mMgvZ6pk1BemnBOdNKTrlYZ
	sSXNppVQ1h4BCQldSi+T36+czvxjXf2NSYe4UZjOKnsallZk+eeoBO4euM7oa7BHSJa0PlWS3W6
	2N/XoFVhxVnf557nWBexHzTuqbhvC1S1LVr3iykFx1QcJGJNAnon2/ZxvBEinNe2ZDFHtJ3OaYj
	Ao39+qyPhFk40bDAVcN5MEsOwBDaT2q2kenxXJGRpGC95cUIyEbSfVCD5DCfc9vJ9wOjmB+PCjj
	ptNMZ1BgMjiN8hXtbHwkvYUlcssDhIYhAb+3Q901cJIDYGAdmd4CEpBEtDffZT691nM5bTAMUqe
	Fmi3vBW7fayC5DYZyvr7ftmJE4WA=
X-Received: by 2002:a05:6820:198f:b0:6aa:d792:e078 with SMTP id 006d021491bc7-6b0a31e2b23mr332881eaf.27.1786428137224;
        Mon, 10 Aug 2026 23:02:17 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 00:02:01 -0600
Subject: [PATCH 3/3] mtd: rawnand: sunxi: use a stack buffer for BBM
 randomization
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-3-412e50444673@gmail.com>
References: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
In-Reply-To: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Variable protected user-data lengths replaced the original four-byte
stack buffer with a heap allocation before compensating the bad block
marker. The allocation is unchecked, and a zero length returns
ZERO_SIZE_PTR which sunxi_nfc_randomize_bbm() dereferences.

The controller supports at most 32 protected user-data bytes per ECC
step, so use a zero-initialized buffer of that bounded size. This
removes the allocation failure path and keeps zero-sized invalid layouts
from dereferencing ZERO_SIZE_PTR.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 01a0d0fa7b62..83666dd6cb2a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -222,6 +222,7 @@
  * USER_DATA_LEN registers.
  */
 #define USER_DATA_SZ 4
+#define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
@@ -1003,11 +1004,10 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
-	u8 *user_data = NULL;
+	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
-		user_data = kmalloc(user_data_sz, GFP_KERNEL);
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
 		oob = user_data;
@@ -1040,7 +1040,6 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 		}
 	}
 
-	kfree(user_data);
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,

-- 
2.53.0

