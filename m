Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748945;
	b=OuskHFJJissAxOqLzxRT64Loou+nkNfE5Yol0EGrnpGL8Ep46URX2fWojoNK5QAUeB/h
	 nfA17ISRPP3ltsymKzd/R4x7XfahRfHXTH9A7+nerI2ImO295/qoN1P1TxVaO/MjT+Wb4
	 hhLiMb0cIxBMswfNYaF09OwR5lxG3OCxuiSyCTcXYWM8GwloECMg12NrnGGL8mce2lzSi
	 104Y+YMcTHIpwFngKFr0FbZ6+vtLkWrH1O6M5Wv3ajz8XA9n3UAHH59jaNWEPqzEmz7LF
	 thbTq27PbJxUB50px/DTo5nBDdTuTFRZAdm7w1cflb+C6hwgoRj8smztK9Fn99EpAfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
	b=QD3JWQ7xVEF8RE7yEzQXM00BdjbfqjWvw/VV3v6eSx/PNYwdmbyNWgT9DuctbtT+At+E
	 ZyUX0JoamW6JPe0WhxYx7bvhPOnUXsNBHwYXQF7b6ZiZqvHxRWoDzW4AWGLuPxuDK37gC
	 u9S2AuIzODkMI+YETmxSFzTxDpA4nYxjTNZNvI6fnEfaXoJ8ZG9Nejr5x9hN8ytJCcfUd
	 ZyU/1eN8NWXltdUIvpiGV+hnlwfHXbXW9FNcW0IboSKpBOskc7oL6uWE3waN3IvGv2s/L
	 5KwEMsTvVB4ncbVZ4yVsS2//CPskEpUgjeIa8RC/qcSk0Qox2/U0T/che8L70hMmlPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVXp68kw;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A93C606A330
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 13:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A93C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVXp68kw
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso5160545e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 05:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748943; x=1795353743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
        b=nVXp68kw6cDR0F8gtkb3K0rvppI/M1KR52tlA8VJLI9qBP0W+ro+w4VWenQhSRWk1a
         SWU/qTAh7zzjUboXZobrzfqxFZ9qkFz6dTqNsBXvgGLxYvxdC8FjNnhlweW1V1kWGSYo
         kDLUMl1+C6XgNbdsJIgjsBUi2Q25eQ4d77ayp7nIB4i9jkAjQS1jx/LwaCWlj8JEFlKX
         TQXLLaSmYYE0fQj3Jomdy9bRKPaS5LkrDDGfn64XQwfnsdlxXZEtbZp9VwucKANUYDy9
         Nkg6qtJyeDmvuxQvAbCRgSH6vgeBn19iIrWz5dfD9O3Ll4XF6rMPbfXWTSqhx14VjCiI
         TvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748943; x=1795353743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
        b=mdRoICIZRsLpEVHvxYMGxz2lDA6lV6Td4CQ7lUJ4oFm+iyxkpbruLrylzMhDqYw0dL
         fy9rkHh8uFx4kTIxT6y/GpM7FwiLuZzfIkoApxU1Tp6LAous8na3Ns5C2xYnqeT/n/zs
         ynFdWrkTAtLhU9ObldiHRw5ePQj9Pr1UXUp8xlH6aVdna8XxgTsWw1z7uP4PyBOVifx0
         cEKo9uvuFTj6f6Evnnem+/rbAsLQY1sX7msk2Wm3tZA7z+4CwJXd6x26O7KKw+oirIsS
         Z4kvCDYzWJpvC3OeY3Dt0wSZ40rDIdHw0CLJ65gUiLjOeAtCm+lGMYJIf7L1NsjT0zQQ
         DGPw==
X-Forwarded-Encrypted: i=1; AL+hErGUxdnKLlq3R/tCH/yx0DhsNsHaEDk/CLt261i5Rczgx2OSY+YpfZRNKkUwwGEsxid52LHzjmKrturF9A==@lists.linux.dev
X-Gm-Message-State: APuU4Z+KBcRNrosKoQ7BPrDRsVLX51BO/2iZjr2URkkuml1OtR449f99
	WAqMnvJRTMMAbNvfn77NrBtwWrNjxNkjk5M6YP0wHGZ1KWxOBmVVfvUW
X-Gm-Gg: AYBFou3dnRHk65jW6lgP9PI7baTpdMpQbW7hQ0RwUP8mFi6pNimT2QXr4UV0uOPl8D2
	lLMB4JDi+u8eunZVXsO1Lu0FMSMKbbG318BQyW1mHQXdRrxW1r36EXRKysODEiOeSLhURfcCFns
	ynbV7yy5LanmrK6EiLpIaoUjmkIvPc1B5B+TdRVBm7b67JU/rEWreVZc3woR/FMbLmf4VU+ZD63
	HO7zaMDL1aWbiSq1lCawHCzUr7Wwaxg5kXiGZpYwkztk96VM9G3QEmp1vejYTUqmqJd9p1aIDLb
	Vm9d5SkZ7RmqZ7/qxV9UjlODlAAnEBA/rOffWm6m3CRpY8Qwmv0K72ZDvq3vNkMQSDgh2BQYWGi
	o+5HXuI7W2TDS4T8XA/BlOSjAjLGVaayFRxxk8QsVz7JcTh+FngL+1Y/xzfK1YyPD1WjwZtwK31
	VkTr3HWvXS5Lh/Ugh7Y7tlxfhVt21Otw3EJJF8cYSKBeLbVLOWSRSR/XGO+XpSra+kiDKFW/U6y
	izwYflzhvDMSwkl/mCYT2J0+8HdAn3WKS1UXhTg9QvIJhwLn6v0K8Zjbv9JKCxCS0Hu930DGpm+
	ujLI4lccbDAnzeSrsmJigNhf9kp1urVNmg9Lr/fYmKGxYvzIHi0adZxxZtJSk42xFVKuS6aZpOm
	A3Vd5koaibsbSxyjHZgzDHWDbd8abWzXsBqlIxRnctxdKbMFbZ0BFN5QizTFIjMeyfePbZGNHL5
	CNNUVdNnGOPU56ZD0DcgOp+0k9Wjk9dsV6iPQ2R9dku860GZL1E82K3p36ymRAHqXdZRjIu639M
	ZkDNkcYW4lUVw==
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr212058835e9.2.1794748943340;
        Sun, 15 Nov 2026 05:22:23 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:22 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/3] arm64: dts: allwinner: h6: orangepi: Add regulator ramp delays
Date: Sun, 15 Nov 2026 14:22:12 +0100
Message-ID: <20261115132215.289236-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
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

The vdd-cpu and vdd-gpu regulators on the Orange Pi One Plus and Lite2
have no ramp delay, and the AXP805 driver provides none either. Once
DVFS is enabled, the OPP core would raise the clock rate right after
setting a higher voltage, before the regulator output has settled.

Add the same 2500 uV/us ramp delay that the other AXP805-based H6
boards use.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index e34dbb992021..cbe88ee6a487 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -202,6 +202,7 @@ reg_dcdca: dcdca {
 				regulator-always-on;
 				regulator-min-microvolt = <810000>;
 				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-cpu";
 			};
 
@@ -209,6 +210,7 @@ reg_dcdcc: dcdcc {
 				regulator-enable-ramp-delay = <32000>;
 				regulator-min-microvolt = <810000>;
 				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-gpu";
 			};
 
-- 
2.43.0

