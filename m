Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557106;
	b=tAxHP9C8kap7ZYz12rywHp6EsZuiH+t2THpEDXHzRDjyK5OmCgADKiI8dV8UtxpUkjeb
	 6RiQFTLowTcWIF4gWmOo7GsF2+ZgGUXkzHfi9pidrarHNx1oRP9R03eeuGlo4TjNtk/mG
	 KExiq2KQRNM0Iy+icWBV7VqXAko40LkA5AiTPFcFYhKjRofVlpsJEnASabggohtzIV6OV
	 STNvYZuLg6JinW6BCeaeHAZJM0lyAgJ33kV13mh1D95zdO4M5jsrzqPBzxT8QbmldxVTj
	 pa8/1v5J4GugnXOnm65Jqca2GgK+8vylRdDSlZkolkY+qJxcOiRdy8z4ybMwnagFXDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
	b=FVRKb4AWTpWG34il/DYMWdper9ixONkBhrXpDAu5/J/zE6EmP2I5uLubrplt2QTqMlxi
	 RQqK5qim7l++VBCuceH8/ExByPKBYbs6mFLtpFIPg4UFiQyjj9RiFF62oHVDDUX5eEjm1
	 fdQwCd0gLR8JCcDE30CVGi2rxbN42mMVdvYlsnuIAOeGVCSwaX0j5fwZ1SrgzOCKSD31B
	 wo7UELX2ScLzBM1QL+yiFvnwyPS6a3qoe5QJXxJ2sxi0q1U3udpU1LfmATRfHccTlf+nR
	 LE9IpjEqHqZxp+MoZ7iGmZ4zUr2AJgSigekssAXcZeB/0lxCQCbAl0nxjN/T48hPzrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VvE3csmM;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7357606A33C
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 21:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7357606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VvE3csmM
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so4138258f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 13:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557104; x=1796161904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
        b=VvE3csmMQAluNmHZifXVLGkriw8QgQ4LG9dCgzFYGuuwJvu0eQdUpMk+HAOdvCUz7Y
         mgPmiZHTxfQ+sjq1azWij88ZopLJFyLjxcPuAlwQjpQiXE5KN3YhCsAEkYwoESPGL8jS
         MPD0WkQzehyGpz/YlxEoI3LN8kHWAsawjxZ/nH7c1glqnKGhFGQfCzusKWUzf2P0XKDH
         dDS9r1MaSQkQzYI3iuxQopIdZa4Hbip+BbDzHP4ruyAr9MfApcdbo/gvIjWrUHhk+ahV
         iTZSXFG0vvPgpHun0s8tX4xZUMzIoR4pEDtVzrKrk6Lzcwb87qCICprDr3H5Uk2dr4qt
         Tiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557104; x=1796161904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
        b=CmkARYUlIOlQLdc5o8Ilh0QydkH9J7IAug1NaonJUKpuk84Kqa8n0XDPezlCbsCDmV
         QKOn3dFb+kvHKQX926+q0SpLMQIm3XofvRMQHvnux1NNs13SRcMG342iHGXSUVBuFVsl
         /uxcPhBBS+vaVWga5J22+zr0dmhdv0owmRv3kbnsvE58/OikdrIov6XRnh0gIKUfVs+d
         6+lyvasIco5/apHd/6GTMAkWWlYN1OHcHDMGTSZYTa974lbogilCdgCapk16je0t4uJW
         r8mq+X3JXBKc+ghQ807XLjRUMdCKX51KA/RvsJq7tomFYGB/Co5iCCq7Ob9MuQ8jvuBH
         9mRA==
X-Forwarded-Encrypted: i=1; AL+hErFggX/VPSohmEEtt2OqFWsrDJmom1jVxq1Egj6je1xltIQImPJm2+tqdtlxwr3SB5lFNJfN5oyOEKRqnA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8VHzvb/mqEWlB0IayQXg0MbbL3B5MwOD2fFyqPTReYaKspCAec
	wepX4Ie6+eVnJ1dOhULzqpm6ANALvo+1zsEkhe2ahRqcwGV0AOcMHiiZ
X-Gm-Gg: AZFdTZfCfjy0nHE82jucRjzscxGFJ9v3msdS1GHZsVctCnjR4uo61ymAnzeZeoTySK7
	N820sOdr0xyGUOm6bJqDw931HQs2WEEtvgVTKLbKCJl3EuC4oN/P74Nd4y4vjs83L+mnDjfhN/m
	2uqzm2usx0VNBUCwZWYgZ8qKPJm7V2hAFviG9ea8+OHziPyA6bAUGqo095p9BWNVK+bDCHVikVy
	WNpHkO3Nqu25UxU9qGcuZ9k5zrf0HNdZF7fm7h+5/FU6FU3uILcmgGSbTzUqZze94f5LdiKco5F
	nP66pZCipwnTmgdvvy6fgf0I/VE7kBdWjn52b70Pki0ql16f9IuvezXb3NPDLKwKwZD7u39gpQ3
	Asbi6Rgy/X0GU+0/klRMKGIHEET+m3PRr5NTZFcg+MDKH+WciS22XGZcJno4ENz6QyZOMYnsLp+
	nwEkVseWVJRtJIZHEMm1osRjKNK0EL40oQeRvX35PrvQv2OtVnJoOs6p0FP71rgsBm8FfC8zUfW
	mZPgZEG1DdFfH2UhBFhPz8T0vfmCMuy9vwnn1o0+7VAienfF1JNsGjY7k07mJSJ9SUa06sFsa39
	XhnUnZ/x7l6otpF0MJqx29zBSehGJT/QhHZAlBSwMA==
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb88785d2fmr318267825e9.0.1795557103878;
        Tue, 24 Nov 2026 13:51:43 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:43 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Tue, 24 Nov 2026 21:50:46 +0000
Message-ID: <20261124215048.42074-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prepare_function_table() numbers the IRQ banks from PA, even when PA
has none. The static drivers number only the banks that have IRQs, and
use irq_bank_map when the IRQ registers do not start at bank 0.

Do the same here, and give the A523 and A733, whose IRQ registers
start at PB, the map they need. Apply the map to the A733 register
layout too, which so far ignored it. This also fixes PK on both, which
was numbered 10 and written past the end of irq_array.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 7 ++++---
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 001bd42afa3e..f71a229926f5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
 
-static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
 static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..3ebe926a1bc6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
-	.irq_banks = 10,
+	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
+	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 8bcd566593ae..1577897a0299 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -209,7 +209,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -222,16 +222,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..09ebf67767c0 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -257,12 +257,13 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
+	u32 hw_bank = sunxi_irq_hw_bank_num(pctl->desc, bank);
+
 	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
-		return pctl->bank_offset + bank * pctl->bank_mem_size +
+		return pctl->bank_offset + hw_bank * pctl->bank_mem_size +
 		       A733_IRQ_REGS_OFFSET;
 
-	return IRQ_REGS_OFFSET +
-	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
+	return IRQ_REGS_OFFSET + hw_bank * IRQ_MEM_SIZE;
 }
 
 static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl *pctl,
-- 
2.52.1

