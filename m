Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB5E437111
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751459; cv=none; b=bUP5Kz+bStBQqED4U3YpDX346P1CBEIVfU2T/A42862G4TeTDG2kdqzzV0yFDqsTDIydVtMKL0o+ochl98X2MLOvVuIDN79EcqYqqv+3BNl3rW9sRuhy5NSWMb2umrrjE2o6CWqircospfb5XoaJBAFEzjeoGxkGnswlbfoo7ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751459; c=relaxed/simple;
	bh=lE0BRLbpoMsGl2jH5YXu2f1E0PNhNUYeuMEbd04x4zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A3sf7Uj7mTRJqetk7qyx2D1tLO1pns/jZ2i8llbt8Am5XNHwOZ/IPFtaW1Teix0+TWkKFQjFimCBYp003pJl53eqr5xYBwy2JmShA5jxyxy0suz25WM5nTglXVSCUpA9ZRvX4IzOJCFvI873j7G7WdcQR/H/bXHBBIEFHFEc2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGYR7CO+; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGYR7CO+"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6611669cd16so8869835d50.0
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 13:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751456; x=1785356256; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivYBWU5cN/JEQ/dOoSRXx/VTuv2YZc+EvRKHLDz+SQA=;
        b=UGYR7CO+HS3KivnmyJXiIsnwo3Yojcl0lqPDor3/davTO7JVUPBijgcEj+UByhJ2oL
         B1/Ag25wkvarJfpwPUT1e/Xj1SFckF+rQVUQYeDHXUNTHp6Y+5ceYzgXxb5Wekk372KL
         Tur0WOiasompXbquNpS5tYJ98jNURJv+RTkX76/m18FOvBf1Yae9oWQNjoQ4pisEMjXv
         9eVzxu4DJl6S0D8i1PPJ3A0P6wYiuMlEi6xtDDB2x6N6PYEbnqdHvdv1uobBTknga2OV
         og6wAzP+Q7IfIzyj/3XCe9cyZPMghb3rR1INFFCsHomXIZarjowAj1jjPtD/vwRi/OKL
         h0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751456; x=1785356256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivYBWU5cN/JEQ/dOoSRXx/VTuv2YZc+EvRKHLDz+SQA=;
        b=nJRcL+fPBcHujj7RqOIOcBMmWXK2Cqpcy1EgqkJkjYqpEXkJtoNxqBZ0/oQiB3dcx7
         BSsWx3uwmV5NOlTvvh8wnoyAUgE4u4hX7IMGAEpuS8CFoCr24zoOd9AXVX+XOrrKxyC5
         egBIq4SRpcPdQTXg70dG1fSH6BOg9BCUUgDpQQDYOK5Kl3HFjx+CNMP1oPuYTYebjCSb
         ld5dPAGTtGcpH7nNqHXgcouUQPGe1iPnbu4sQoAV9e51A8XUji0WCyAXEKHAb+QSqy7r
         7K2eevz7IeZTT7PRTfR1jFDCI3BmtdGxIOb/L19UPvrh3R/USXfYa6kpeKW5Lp3nvLaT
         SYpw==
X-Forwarded-Encrypted: i=1; AHgh+RqM/2QmaQjcKmuMbc4CSjOI29Wm6VQD20A+B7+Ipb50bMyEpvYWdvJ2xLyTkvRlKLFyP65LZknly4ScWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiKyaB8ccrZXGB3aBFY8n52vADZ4Vvr42cZ8swCLIkYsL9xAYu
	gv//dzP2J3WDZH/c7DNosH0A6791D5YDeEVU5zIIHYwTzEzxJJotH6YH
X-Gm-Gg: AR+sD10zLYyMDqEF37BiPy8MNz0KT9Nl2x19kwHqYBspQYxq1DqdPUTiLT9PP2UJGEa
	fkomAedrtJc7DIu0HgyCMPGLaoJ4DMpoMBJ/ImgBuxT0/Yf1wdSDm+hqCC+vGvJGOOdh1to7pze
	d9peoUqQlezJNB+h7lq80A8ZhPXvGrdLL0+SwkMSsJR0rzg3NXgFqA+dqKbRsM7Kd8KfWR4PE8z
	cDxmdm6Di3nH4hBjE4SptNvzK65VfBrwWuksed9nBnLLFIIsfijnpcY1BzyGf815BYCtP0nHzKd
	RVv3+CiBJYA5rsosAQ3cD4J0qBOFYME2lpqt70xSFDMEItC8qr+No0TF6mvNQU4yY1b9cUkmjDu
	k98KFS/tNi7BqSDdERZxQSCNbnKLKZs6rqwJWJkQh0q4MEHY2wbSN1MHPqQPMlRWxE31C81PBzb
	BQmvLokgCUXwAcf/i/JJBQCjhElTdR+SNPmhFM
X-Received: by 2002:a53:b083:0:b0:668:9128:28dd with SMTP id 956f58d0204a3-668a4f87cbfmr21361d50.81.1784751456120;
        Wed, 22 Jul 2026 13:17:36 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:35 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Wed, 22 Jul 2026 16:17:17 -0400
Message-ID: <20260722201717.2205609-4-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver in the RTC power domain and mux its RX
signal to PL11.

Tested on an X96 Pro+ with ir-keytable and nec keybindings with
the remote that it came with in the box.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..1eaee20acaab 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,12 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_ir_rx_pin>;
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0

