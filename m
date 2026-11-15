Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762714;
	b=b/x9vVxInephFJmnOzER8za4fxGhIXG3OWKOFA0nHcvDVVG4qS2Y7WrZrf1wugP9gG0m
	 3nt4IgFXGmcTE1YlQA/alS+ccVvX0473K/MkdxPYYhlwkNvo+h5V7G0D3I18LXCAfTrpN
	 mpMyK+vEOEOR/kACA6hPt3VVxLPSCs92DuTmRRg1cD0CQZwqrjh0hZhYQnglLJe68kQyN
	 fUmKKRPjbEhypQc2YN74JjhGH6X+uBRFkyQ9tG7j5uxcvWc770so7rZVD2Bvid8z8W3yj
	 Sx4LXNyWB/8eetcIU648jrep80P4+hyn5AnhYydzeTRs5s46kYRw2Qnoa2hllvQuLKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
	b=nzvtst7tkK934IIuRpO4hV2epX3UoBAZLcS+g4QFW3z+bOztzUZ+T+1B1xBawsrJPaPp
	 vZ3xSHJ2huCDPjVx+S+EcS6ivimjkNUbU6s9lS6yI/FobEu5Pbwb66xVdO9i6OkqRP9s4
	 i4mZU4iwtDhemUktOBFV7ucGGoS5cMjofLxEQVdMlfA+Ohk1AhykYAaLqKzg2mt6k0Pk2
	 upIAP2vD04Ek2vKFGiaU1WIpNmvtCqXgbQe1zg6++8ftI1SsHZj9U88dfQri4nsld2cce
	 dRYX90+knVwyv3LmpN7OKLZQ+pe4PPoQHB8zOPhI7yOAMjzQ2eKZegaOlRcuwOu7aZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJZFymsi;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39BE606A32D
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 17:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F39BE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJZFymsi
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso14216805e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762712; x=1795367512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
        b=KJZFymsiqFeDjqbTKUZZ6k3cVkQ3hfhpYvvNVjmxrkuBOkBmzlz1qFylmni+5Xrz7Q
         nHH9Nisccp0MzfGWwK9q/iWgo+3nAi8vx4IpreOlTGzszSpf2MJGcZxsBZoW1qnTPJHb
         SJQLrYa6kLIBcuMofaNRw5fUeosLsjApN89RMHn9eoGEV3TRfWx4zlJbe7ID04al3L+X
         aY8Z+a4T39rYtHyMLMmgS28dAquVmnmOKwPmjcxlt1V+1QWneW/QbtfyBzxYxu8KRc9H
         IUORDMUmU7wzi+RUX0INFCL2TymhGOA5nQ6rByxp3BjZ9ICvGtZ3YL6heJvPNTxe1pb0
         hKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762712; x=1795367512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
        b=bQFmPzTAxhHDrPFvhlbJzPVnnyq7rvhKoNuLzsJi6eZLAw9tXZQimT2xjw/YPG55fl
         O1Oj4l3JdAaM73IybOOhrGVolDKv1asp73EialhWTv0BOsoKhFMUuHoymc+00Yt7l7Gw
         tHuF7ThP0U14IytbX/KlysnuQblEiNdE11wiYXnpdMjgm6Wn8EAlfbn6cIOzKtY1K34g
         gXWbQ779jwGbpzcPZ2yo1tMcdX1HVBCc8Tw4w5XQqU6sym6W4wfTtsZqxt77chipKHvx
         5ts8tYyt0qakSwm3vjvo/6RV8mP3l3zff5Pm5slb1ocX+soX598uYc4Z3FKxj0DKuRN9
         iM7g==
X-Forwarded-Encrypted: i=1; AL+hErFNm+CZzRktff5TTvYg/oOaAUvcBFGKS20a7s9a2uFwo+EVVX+3xnF9J+6jXVfOFank9m5bmAwnwfoECA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8BPfKvCuOcp0tGynAZHhL1030cG75GmQQTOCuuUHs4mVZsxxdW
	yHjnw32hmmsJj3FBejkLfpH3OycxLDz9HN112kE1c4hc3WdjMA2ghFW0
X-Gm-Gg: AYBFou0e1MzKrB2zvQkSObJzCu5wa1v/SGmd/eswqxhit/Kl7ROIwsWX2XN6/MyfetR
	bA2jnnz5v/HyrJ7RMPItJckIFfturM1DFbnG5ncxBRD50FSB7nVhHCb4cw6cUjqrx0TjopP7TAl
	yIqOYG/LrVXNqmnYFbScp82YG4HXbsxztub9Q9OKsfoMmm+tv8HeTo4tXoK+lFIB2iC/fSNmxGg
	Yjgx3iT6HCaKkRKy5/OyCoNMr0N+xuw8sLVcDUqMyP1/vcHeip9x1pdZ1YSrXxBjLAAl607CF6m
	eaYJ2jl+7E/71T3FDVCJ1ysUAJReW0Q5UcfYIQJm2VJSnmOgwNsbSW9DpiNN8oWADgP/yLRkcrl
	OiGiBMgE6OSiyCs9CuPlYxRCtbFt3Sf1PRis+Ht0tDrlKpPkEUZ5yQ3P54rFyYkQv2fiavgnVkk
	KVXi8fpl3vuZl+ZnDIzOfMh49S0vbLtRRBK1FI/MKaoJKYAPlKCA+LLE8QmAX5qPW8Tno38I8aR
	29SlMZlejMG4UJbcFuXmmjZKgRBzUvlocjZAuaXb8IRRIk3V8Rd6KtoemTxFmfqf+BoGZE+US2X
	vXHoYO0+J46eu/I4pb9Wv6+CURO5CUM9rsdQ5EL54GU+ufCLcY1AMqrKPtW2sEW4AtZRUuSMUru
	/AXR9CmUa+h/SuwUcf5J5J4E1Wt9L3mYsKgaXyUGXjKioBD61Gp7fBhWTcGF374/3Tc+YgOTfod
	zo3adVqtFpl57JQryQ3rIzqzVGbmTVj2Qm/KFBJRVexEY51NmobDZlLgDUPAn6KcYmZLbzJ9TQs
	WLZ3fL/FLhNrQ==
X-Received: by 2002:a05:600c:6994:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb647ddc1bmr101003735e9.3.1794762712078;
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: h6: Enable Ethernet on Tanix TX6
Date: Sun, 15 Nov 2026 18:11:46 +0100
Message-ID: <20261115171148.37784-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The AC200 MFD and Ethernet PHY drivers and their bindings were merged
in v7.4-rc1. This series adds the device tree parts needed to use them
on H6, starting with the Tanix TX6 and TX6 mini TV boxes, whose only
Ethernet port goes through the PHY in the AC200 co-packaged with the
H6.

Patch 1 describes the AC200 in the H6 dtsi: the I2C3 controller with
the AC200 on it, a pwm-clock that provides its 24 MHz reference clock
from PWM1, the RMII pins and the EPHY calibration value in the SID.
Everything stays disabled.

Patch 2 enables Ethernet on the Tanix boards.

Tested on a Tanix TX6: 100 Mbit/s full duplex, about 11 MB/s in each
direction, and the link comes up both after cold boots with no
Ethernet initialisation in U-Boot and after U-Boot has used it. The
TX6 mini shares the same dtsi and was not tested separately.

The arm64 defconfig does not enable CONFIG_MFD_AC200 and
CONFIG_XPOWERS_ACX00_PHY yet; I can send a separate patch for that.

Best regards,
Jernej

Jernej Skrabec (2):
  arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
  arm64: dts: allwinner: tanix: Enable Ethernet

 .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 ++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 53 +++++++++++++++++++
 2 files changed, 93 insertions(+)

-- 
2.43.0

