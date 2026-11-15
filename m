Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748948;
	b=Jh3hOrJ9RODIYItCIZV1BMXdDTgTEEBvZ/bm6Njgafgh7OF1v8+g4zMChRgRMjshRd2M
	 z9G87xYA2hxqrI30cOUGWD75QNpA1C9+yPj58u8nXCmxAhexeeQD83f5LHRPl+gg10SZ+
	 34Rn2DXUjx7Xriz0k4LnLtkHrXxhIeonU5GJLuvVHKkWPqKmnPu0g7ec4QtiS82vHmEhp
	 oYa92kShPhuax5Qj/yQ0RKsSeNWD2dHI4Mjp0ufemfzn9T9cTfbt9G3I3mPmW/mu2bSFp
	 lG7QryXIXoBJW2XclUpQm03PpvAp5tQmEGzWiS3Z+AaF+JFP8lV1mqZg1awQDNFCbfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
	b=Aus49oIAcJE4EtsgIYh9WhjjF2rVJNUZBf9YrsdrQ5NrTBzIDV/wxAQoabQAX8KTcpnu
	 n9lx6OKjNF7yJwfIgj3RRHUZo8kdQWDJijz0Av9BPiK03ivEeyfSLbbhzrN4sNc6XPjEk
	 Wq8GZiJk0Psw1bMYldBjmanf/MFF1QLBxl39/Dxn4bzG4L50GzNaB6QyQ072oUjkM4aHa
	 Oyu5GD3wskcvOMtw5jsFDq7VwjfqHYVDxlqZpVhPNDdz78FeJoNi9MRY8X2UlSNqGpYp2
	 Mv724fwjHvyIz5CO2kaHxK7WH3PjDuQYthvyDNzRLA+HmB04YJIpgN71ubeiHnI32ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTPuIFIG;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0611B606A339
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 13:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0611B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uTPuIFIG
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49a92144733so940922f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 05:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748946; x=1795353746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
        b=uTPuIFIGUKD4Lsu3I5J24/97q98Fy/eAVxOm80XpziLfmBOZ27kvF7EPCA8qmMBI9l
         OuyKMGoaiyiUCQaxe1FgvOZtXBUlLtP3SEfBZTt+jLbKKuuaNc3ARgEdv+jsIZOV38Dv
         mdUASs9Ujn8iWr/4EipJP54GGAJCx2Q2AD2sRZUDsKouxYSWe2ttHfk14cOKwHyUPbnU
         MpG3DFn+icU06fdvo3kqsvxNKGkdmk0BecUicU64DSbc94HdDWRJhxawW/hoYaJdy/b+
         Rajje+F8Hgry1crfSchG3hHyoFEJzXeBJV0AyPeq57cI4/6dEJF4hdMkCSJN4YFQy8AV
         J/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748946; x=1795353746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
        b=lAIDnPXfQPP9eoIprfEAFdSBqeauLxezHPdMSrS7Te1Bzyjgr4sNvskTjiavnsJ3hB
         Z+PNhFAJOmFTBOwdT8tYgJDaf3MsEl6AY6j6NHQAt0zpjEv5wrkVSVFHhlCruV6fvOq/
         2TCFvg/5RgWtXDGPzboKgg7utZm+zShAfrAUBdVbNBDKi5ZoGStaVbDjr7J3oA9DWgeu
         cbXHsfhcMrWXV0eGXBMcJF0mvs3wIYROqqC5ETROFYvsIwgGGlZfGWwProGzjF3aAAA1
         7pWphy1b1PHd161/HG/MW4Tdnp3F/stFdD/JnGxfMXjVegylEsFXez/AneiyzA6+hI0k
         G4uA==
X-Forwarded-Encrypted: i=1; AL+hErH8LhIXXfddPBHcNTJYMkz5JJplSZRcQmXw0Gm4nST1mzanpoE0+OD3ledSY2YOQqbLalSbyTEHN05xCw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8S9XThLMW8oxf0TBoRlj8In4O3yjBKMObejjspqckMLUOY9lUm
	HY5BIjr5UG5Y7yr6Fszye81zloXhFAHjepy+ubliNFkHvgYmD3lVcE6C
X-Gm-Gg: AYBFou3Hmoh+NCXNCq5DW/sEQUqSlKL4F2CYhj/TEQw1ZEzDGy9BTlU71TTrv4y4Kxk
	+mKCSUt03fmDhhh724Eo2JzQ4vZdDkp8R9dGkKasu0esvbvS2Rolwf9m9OJM55zc5IFO8brwLrX
	P4jQaWZNu5I7UxhuX5HkbyGrosHICNaJ4mSO57Fg9YhjVIoz7AJJJ96q0G0SM++agCMR8HSNkr7
	EkKhzLcWHowvqmd/ZjMsPie/frXfvRlrpzSqk9YTDq9Mg51iQCl7wHODHxUAibhIWcKWwNqGSAR
	AaPXIIeBLTRmPjr2hxiUbS9hLZlHCsyX1II4PtuRNZqtCVWtMkjF/QsCGsmhMw8+sXGOmEjuJm0
	1s4bmQxUoui+WlsaR+ALvkkFy7rYdONuFYmDpJ7YhDZJW+0Is/CZ5xwnJKvC1IYm9QkG5YBdR9K
	tahWm7sr6ZH3H9XlW04HLktSy2KH2tldRkiou1MMwGkyHdRHNjAkH3K5jM7fYwy4uXKwc9neFER
	XtyE4hv3aycibic+YW1cVetBBjXYcDImLkrZGAcV4D4x+3vtHPT4fjglQ/XN8D8L5jWP6YroPi2
	UPVQwajUvEUudHoYV/HQtCwnKr9bWJUGNW0CmsaApBBtrCDwiNZD5xu9Q/oI/aRc5Zz3lKuwns4
	O4hgO2xSzUNDH+KDZsO4iSwf2IKjHSobJPKyHvhASesv7PWaVq1u3q6Zgm3Gn5bnMVkAAJUG+9R
	Bl9OAESkmmEnlsxhQlbvp6iKLljdnHRq9A3o9T9wT524sntHxRc0FxfWXK1WhWWOPe0A4/1H8/k
	CuadA4fgpx1ew==
X-Received: by 2002:a05:6000:4b02:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-49c6dbfff8fmr15902097f8f.8.1794748946344;
        Sun, 15 Nov 2026 05:22:26 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:25 -0800 (PST)
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
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling
Date: Sun, 15 Nov 2026 14:22:14 +0100
Message-ID: <20261115132215.289236-4-jernej.skrabec@gmail.com>
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

The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
so the CPU never scales its frequency. Add both, like on Orange Pi 3.
OPPs above the regulator constraints stay unused.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 40c5c42b347e..a2a2e4cb0256 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
 #include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
 &de {
 	status = "okay";
 };
-- 
2.43.0

