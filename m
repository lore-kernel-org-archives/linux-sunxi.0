Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627741;
	b=w1BzySCdyBT6VCsaSLH+jV9p7d1W+Nl5Bk2sx/CYN7zrIZgnYTg1OI1e3i7Tml9Bn4me
	 cBBf9MLIWjX+5a0+c5uNlRZgcceQqua6FC7Emsb3CbxiOAzozAVndUUj8WGFuKzmbQ2EU
	 5DQdA+KdoNGDTeMBFhdE0Sq8aOOoiJ4uM+jyLFpi6q2e1Avl62U0g6xkFbVeaItE6HEti
	 Rr8lHWGx5+WsQl/+3A+bTSiwpH6tAP+1llx5zfxEvUBYVDYqhnG2BFOw+KsdE9UqgcPT2
	 BXJNiUv6TYJODYV+Zo3CS4pyB0QN7U7dADN26sYCF1K5g8PJdqmvjS84Fasg3WJXzSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
	b=jiuNveODqmnOBecPnh+Ii0rWKofU1vt3PSSNQUiWNG6yrYytHB8lXGLJ//Sdodh1vSp6
	 WdrKoX58B3WwbqH3qG3BuaTvv2V5hL3kzXkqfHVMsOUhUz7WkKiFvj/iSEyTD2u/lrghL
	 tfX2t1H7jICDHFWV3M0/sH6Tt5gTJaqcGeXG4pVBVlqyUPbyrN4vdDPavUKdAGmO4hrmm
	 Ogz98WcKoMaYKTjB5AfRGQAcFPSXzTuh+K9r+ahVjsOO3YsnTaCcY4iwvXGbHSorgrt9d
	 z11JOgSa6qlPVcpe5Yy3cQbe9/DgehpWtizUl96Rvlh8ijWnAZ/ABSNlaBs21WziWrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T163Zcvy;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F3B606A321
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 00:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F3B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T163Zcvy
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b19e291cc6so1035438eaf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627740; x=1793232540; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
        b=T163ZcvyIkl8lUHkJ+5B4ohdx8FQF3cDqsNAGNZ80pN53Hzz9nAwSq1fzc3C9h1sJ6
         +CTPkI6fQxmMCG2KEdNsL7MYgFmGRSDutPwJ6JZNb0H2Q6QYPXedCT80nRL804WDv92w
         5nFVxzZt4ycxqEDRspW/rhiSjgd21/MPyo+E6MUiWZ9FVRF7ywcRt4eFP4pPXpxPrBUt
         xCRw1/SXwJ8dDUh1cx1IEiTz1hl9jPaMd/Va5kctfKBnCFsPfMiBMQhRLoFF7a4b0y2T
         Wy5jIVEHxlEVFR7qqTpO8dxhPOOaSvtyqt/3Lh9rWM0QkkPO8dHRDwsfqlbV8iA5Db6r
         lY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627740; x=1793232540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xX8Jeb7zcqlanRR5cQP8+zZOGl1Uky6hdK7k0PUYqPk=;
        b=hPPdFTlLfcDVV/5FYCVT0HZUT/lK/aeSkj7tRWopoUdOq0Tq1LUsNs3u5D6Ao9AaJg
         iZQMeo4lSiuq4nt0Wv+tVaglvmuBx2qdBIyj0ZVnBaBC1mqZLHGe1rZ0NWNxaGy+9UP8
         LZTd6aFVLKMMhzGl4TeBmqUldMC0GdBt5Z3yPGVj+3XAeTz30+BavIq9tcFzgY9Flmn4
         6lrUjM4BER56ziPwBhudhuholH8NBFYh3MuVQ9LUurdtfBjZZGD93hgZjkfnysj3saR0
         1IkeSKhaVP4iBGJqVjiZqox3ye1A+bBuKY0AjUkEotFW8Kv4WEzktBHZmPsWq7KCzghJ
         x1yA==
X-Forwarded-Encrypted: i=1; AKwUvBy+fy7NN9R89xxIEG+UCSDQ8nzhcbuwDUG0DyNXCIXI3khR5xSzdjdhxNT/M2RkiGPbpo31n3QXRzgXvQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKJoVIpYBDtbhDxG1RpWr17Qosuzds5xJpKgEjXkRW9C/uSWg3w
	lrWbmIh6jbMmZaUX/kr6Qwb7slZPwEIy1QY9uNihSXBXxfH5rHrifvS5
X-Gm-Gg: AYBFou0201Hh99TRVHsKF82+zZIo+8dz0sx5PK5ieS+GKrkayBhR6RfzPd5g7XKRdGN
	xfXe7XKJ6DVLP3uy3mcdybt/oR1ZpKrs3NBJm5UOcgax9VN5mYMvkBC6KPfW/dDwnjGthsw/P3n
	y5knFD8Vn941wnVj8FJvEpkBvXPtUyVIKuDMpH5taL5pczf+N93FON59XIvat3XUNljcMQsu5D0
	xFfTxYcC5vFxh+xhILvnIETAL0u5AuhAM/lR2CtJCN2AjTc+cV44ci7glUkRo0Lpn6wBAd7/lEb
	gv4E8tfmcj2c7CrRpIvVA+NID3Y5uHby9Ey74Vyn0WtfqzrLbZF2sYXgEUUpeXljD8EHo7KaH9D
	8HtU1bNBYeHA06ZcfuEb1oabkdrUMNj++dXCErWDawWzewpynLIIzX948U9TrTB0OnygB6XCbKl
	rttt5+BVKcVmPHPgJKnSjEf1VKMx9Y/7h1vtu0nCw3uzQXRNehGhuwoCex2XalayQsFS8Kx9f37
	mJhmi9kKO0GaVoljTnB0BqzZsJnr4Zx3aSPtNZ7wXeUqAI4GWKLJ0T6NYBXgFPCFrF8P9Ts1QgM
	iRlqrcwAtN8g3zOSmyHNjYCvjXgdeFRl76gyGPjroWDKf4KCGTzcELkRd0lSu1g7UQvUa/G93cU
	0ui2wM0Brasg4hl/O6Ij+FmyPgtx3wEoOQUsEYPqMYrY9grVQrlI2OjlfIVizPvhQCh804G3q1l
	p9
X-Received: by 2002:a05:6820:1994:b0:702:ebe6:8009 with SMTP id 006d021491bc7-70941a50572mr2245317eaf.89.1792627739394;
        Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:08:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 18:08:55 -0600
Subject: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
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
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

UARTs use APB2 as their baud clock. Expose its existing clock ID so device
trees can describe it separately from the per-port bus gate. Keep the
existing clock numbering.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index 6889405f9fec..e3318772c92d 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -11,6 +11,7 @@
 #define CLK_CPUX		21
 
 #define CLK_APB1		26
+#define CLK_APB2		27
 
 #define CLK_DE			29
 #define CLK_BUS_DE		30

-- 
2.53.0

