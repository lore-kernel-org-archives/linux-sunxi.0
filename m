Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440422;
	b=VuMgiHCBw1zHnwY69oizUaOKYAkQS++iqOSsDVUt1ctD67h/RYnQcrzWuQCl3QufnZfb
	 8ad9xSWnj0Xd84FUCLnO63wXQjDDVGdRHm5iVLME26IFQNPqT36OKFHKfAfCumArAvU01
	 uAhosy2ciio0jJ1TU5ef0LBSJg7WfXFQfK0AwPBi+puFkwqLKNRI1EMoAN7Ib4D+SYek+
	 DzV2e40gSKG40FDJaV5xVfq275JKU84XlpuOe0Rr3luTeFrzRnxzNjQD5JNPAvX0KtV4o
	 6704qRtF/bbFF5SxR5bnTZdtLenjh4edHxfFqGwSAAH8+MsgTkMjsx83E8nz6WQGi+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MQXVI025privUEtANhdwM89LTKKhsWNz40cUmpuugYc=;
	b=koyzUHxdViWwDdzbHmZcBwMMOamuwz2pwxs8r/FrYFmPpeMsKu2hcfBrJSPUscdLUebm
	 hHC/x3eZWlJIE9JtJAlRy6Y0QkO6Gq1AO9ZniLL2Sjj8XNVjXmxQHZpgHsN6FmTR5LRIN
	 v/OguIh0ng1w4vYgE1pRzCv6VCSysE8Tw0Ep0Wff8IhjNoTQPgJVxM0hZoOSS9/WX7HPt
	 OmJQkZdaUbTcPCkJEON5Wf4XvJnWf9jbXRHHIkAXdowk9NxxU7eXZRjyJzHy4UDbbkmH5
	 9FQpziEANbQWS9vekJNlPr8whGfympgu4S2HnOP5r8Sk+QPE8K4kyxZwmczwsLGsJWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHBBkb2+;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2242606A31F
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 20:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2242606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHBBkb2+
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso681351e0c.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440421; x=1793045221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MQXVI025privUEtANhdwM89LTKKhsWNz40cUmpuugYc=;
        b=BHBBkb2+hwIvmtwy9Orfk79/j7qL3s/SasNq5YEGhojsoO7j7SDvORwDaXhEREySrq
         m2CvMIxxFnAqtmzzm7y8KQKLw97essZ8Kje6R9/PkKVfCl77iQsAP5Mk89pF1mHI5L0r
         PNi06FZVsu8SrYhr6Ne/EOnwTMGB1ihqUF2KCQ75yzzTcvdM5N4P5FfW659JbyQ9Rl88
         zIkQIBDWjZtyWQ77duUQonc/9PxCo5DIh4Oe3OeXY7vmNdtPNV+x2XtiMUhxOFCMCQTe
         /ySEJunip3DzxV8IKop/eb9MOGI18jhYQbVJxhT4Z2U637CsuU6XlPfXj0bflZkUUhEd
         JMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440421; x=1793045221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MQXVI025privUEtANhdwM89LTKKhsWNz40cUmpuugYc=;
        b=tgkwsP61rJW/WiG2rYA9fJ2wijfYxF8RwPVjlxglzMh03Ena8eNIipfiY4a7AhdQM2
         4vIfcfbsev3TVz1oJ++MsuuaoyNNpepVDvJ9e8GgsEZu1agCMLzjEcmRwOUO4AJgunhr
         UNCjOeQrr0vLxOodN+TI+SoY1iRejBcM9scgVFoLHo8fwm++bID1sUl6qUHO0nYsI7ml
         DPni1znLLLAGHK6Kq8t2cNFLAV+NeJFG9USLE2BZDFstDoBsN0xanpk7Eig9vb5B1nLO
         J28L+AktvloUWPhU/OTWoZm30k0qVhdwoYG4gOomaxeN2lCFNQVHnpyWWDfhBjn/bKT4
         0CPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCRUxXwJVVJbaiCX+50wekxjkCQEsqGSGSBwr6XohDqTHP/VKSqAtnv5I4adZ4uQt3jCwQBl3KH4nRaw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLKgWaR49TJYjJTKB7DBP3jJrdizZsuY0UTqxejL5JbkbZ7UmtG
	g4BrBgi82JNe4RDTykDLtF3+szM3Yl3xlWFtSg5ol7Q1aDPX+AcU8ZnM
X-Gm-Gg: AYBFou1ZVEmtFobF/1Ikyw/BzBYS7PLrcN7yWMPSsk/VuXlBmPaSZl3+ut0FJ8yCGDz
	/Cfcx4Y0RhNGJt9d+kSqxm4mlHNGuspwhl34bJXoTWFIWKJVdDHC1defmxpUftiIdeLp3BkID3R
	p7FNVh+/RJgXpzYmsJ8a1MmFuM6uc66DojL3DOMgkKnXF7ZBgfubfXu8ZjUtIgV3jmLXb2fTqiq
	QIH0zjpFssLXNp22hdLJUT6EDmiG9sfH/TPv0ivkdWAhMKfYFad30CXWLqK8TA92OSOq9m80dud
	JyOm02dw1NlEB4WxZmW6ySp9FCur2LAjc4fNUCtGup9Ao4qTwyOFSfZH3wGc0yGubtWDX86UZHS
	8bf4P1xKDg11d7+pnwBjr29JJ9vUVWChvAzpxxxNNF9ED90Pd2U4/19gUFGQ7kvbJHxK9Tot+PY
	TbsLRIR71JiVlXCk8qFHaHDf6YkuA/9N65by3ptCrQWPiF8de7T1sa2rn+VQEN5qnQjPYFSaStR
	PP9dKYyE60+p468bxV0A8vhdkNOC98WRX/UCtICp01jVKEuDgdqf2I9aOVl23vYQSxCm8vSC3g5
	4bIWfjA=
X-Received: by 2002:a05:6122:4004:b0:5ea:7126:38a7 with SMTP id 71dfb90a1353d-5eaaa62c43cmr2437882e0c.13.1792440421005;
        Mon, 19 Oct 2026 13:07:01 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:07:00 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH v2 2/4] serial: 8250_dw: Only accept a contiguous DLF readback
Date: Mon, 19 Oct 2026 17:06:11 -0300
Message-ID: <a79114e72d029732db6764935dde12aa5d497706.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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

dw8250_setup_port() writes all ones to offset 0xc0 and treats any
nonzero readback as the DLF register. DLF is a bit field starting at
bit 0, so a real one reads back as a contiguous 2^n - 1 mask. On some
Allwinner SoCs offset 0xc0 is the RS485 control register instead
(UART_485_CTL in the A733 User Manual), whose implemented bits are not
contiguous. The probe still takes its readback for a DLF of fls(readback)
bits, and every later divisor change writes the fractional divisor into
the RS485 control register.

Only accept a readback of the form 2^n - 1.

The probe itself is unchanged: it still writes all ones to offset 0xc0
and then restores the old value, so this only changes how the readback
is interpreted.

The A733 reads back 0x19f, and Andre Przywara observed 0x9f on the
A523. Without this check the A733 RS485 control register reads 0xb after
boot; with it, the register stays 0 across 300 termios toggle and
restore cycles.

Suggested-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/tty/serial/8250/8250_dwlib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 325793f20256..1b0192efe162 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -225,7 +225,11 @@ void dw8250_setup_port(struct uart_port *p)
 	reg = dw8250_readl_ext(p, DW_UART_DLF);
 	dw8250_writel_ext(p, DW_UART_DLF, old_dlf);
 
-	if (reg) {
+	/*
+	 * DLF is a bit field starting at bit 0, so a real one reads back as
+	 * 2^n - 1. Any other value means this offset is something else.
+	 */
+	if (reg && !(reg & (reg + 1))) {
 		pd->dlf_size = fls(reg);
 		p->get_divisor = dw8250_get_divisor;
 		/* Keep a hook the driver has already installed */
