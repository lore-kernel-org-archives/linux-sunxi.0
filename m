Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2403B52E2
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 02:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477817; cv=none; b=UIK5Yjk8rclSwn0Parosfy+28l/66HwLv3hl0DaYG8dmP0hGcA0xgSM4dWTwLbvEtLZgfVSAu3Cub8a2DL1jkYH8VsdZjmgHb4H9GMiH+y4SmwTtO+qOr3+IeMgOOii+NMhbf6EIUZi5bzIiempSyjXXkDF460/nYLmCfsyvpkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477817; c=relaxed/simple;
	bh=JLLY8202AFqPiR7IQZMFqT+Np/Pbs4qmrHh6nwqETJ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oy9zHUdl3blBJXyhhdu8v3CHDAnYaR6sn4LosSZfU0WTDl435edmnDtCZgQFf8nB1kRwaj0EVQtnZnpuz/HpZkzoa/qJUn1O7+MGcX9haGPBjAjqKRB6rhXxJrd2e47kxmh4feoW1Q9FFl47rksUqeTBsgYBZzXmWPWEhrmRM4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=WsfKJuW2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="WsfKJuW2"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ec6188so8740975ad.3
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 19:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477815; x=1791082615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=;
        b=WsfKJuW2LxLByuWf7bStv8q6FZ5GEKJQETBSqB7fu8EbXECWwFvZqg5xImrUUqK5fH
         P2NKwljJRqzYJBPxhnt609wSytZ53vFEehdJZfUZhaYfbVmDhNgkOaUDPX6sO0ro2qQQ
         lThxrWyZ3qrGKuZc3MFhyTS1X8dUVWY3iQUFNVnbxyV48Z/T/my69CnP8aeXT+1Amuxp
         90THj+xXTOeIbRllsJmYoDru7ghPsZwqHKOkGcVIgLPlRI6SgM6b619quoXXu663ZB2E
         srOHcMi1S2b1sKXa3Nt/eYnRctdbl4HYQkiQDzrOWcg8GY8NnMWdFW7bU2HOmsgBuqak
         3nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477815; x=1791082615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zx161GO4leyejnwa92HDTsrJTQOft6nH8qorocIvjzU=;
        b=n0IsuuwpbpSoiojHhqU0+89AdzO/7s4iuu2gnCiETKSy3rEU8juKxzAutfyPbkBAyE
         8DZI43O27AWuUnFkZy4I2ZWxnMVyyqfIyeb+5gXiBywPI/ljUkNpr32Id/pp1GQhNHfq
         RjZZOhKuYOU+05jyroasGxy8txkAOjWp3JgXcSx6VAtp4Su5OELgdmgFpRo99ZC1RbMU
         Xlbry4zUzaT2Y+3TuQaKKnbQtCRD8uw2v7KeYGaREz1WFnfGYcmWN3F25f28R8e8cumz
         aIvii7h1RsIewW7uOyHJVUzG/yy90d4ubjeWLjdIH9gKWzrY0GC7HVj6fMa4TdFuV7ef
         zE8w==
X-Forwarded-Encrypted: i=1; AKwUvBzZLAWx04f1fIryoQQ3TMMiuTIG0OPsnDJNtoJpwf6xr7PLKCA3vMkLMy7Vf6MQ+C+sfVtfhyeEiyyksg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJrFXqmM4tT4orpHvV5ZozXRddP19VJmlB/hkPEsU1DXdGVzY+A
	tKLoRa1hRtFQ0IQbA73hMVoyhLanLVsB5JEUq4bbS9nCLup7AD2YgtNdYyO9HFQHZcqe
X-Gm-Gg: AYBFou2DaBnXhP1vyxDRUSsqhUlWOhfJC/YYWijnh1sglR9DVLNZw9d26C2zPmFne94
	OtWGX9VONI8R4cyDXlTHkz+zPETGLmczT+sPcxvuqJoDtq81jKGATYbshbqeE07cW6Q/U1BvzIP
	3zbv9N8ZZEbQQeWXBJ0IEX9BEUWYY7rvyY++X4BSeoLtK9Tih/4sVIQN0zuybWGngdN4sbndRz3
	qOWTfaFuxMfhm9NetSRjwC84MW++5UQVfbYhY21gsALYGk2LcHwDXUHH1hB6sUCF3IZ2xRhW8vd
	HD3+D+so0aubueFwp6GWyyFNOpOYgxAa/qkulgLtO5WOMMkoneITYBWpRNFyf5DflGNLImWgBc8
	kZMSxQX1YWXpF4F5+EJr5r7MgFHuuupS2TejH4IQhHY/cB3f4v0BoCKPH74i+yscDYIUtrkiVRQ
	aU7ryF3BX8vAXkb1aJHGPZqBwtRkliP9vyq7XOq15gkFcGDCENPxrQ3k4WH8AQuahS4xV4ajr3t
	X8A
X-Received: by 2002:a17:903:984:b0:2dd:c100:4246 with SMTP id d9443c01a7336-2df7e13c585mr80615525ad.42.1790477814644;
        Sat, 26 Sep 2026 19:56:54 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:52 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
Date: Sun, 27 Sep 2026 09:56:26 +0700
Message-Id: <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the hardware spinlock of the D1 and T113. It goes in
sunxi-d1-t113.dtsi rather than sunxi-d1s-t113.dtsi, as the D1s manual
has no spinlock in its memory map.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
index 3b077dc086..228cc5c074 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
@@ -11,5 +11,14 @@ dsp_wdt: watchdog@1700400 {
 			clock-names = "hosc", "losc";
 			status = "reserved";
 		};
+
+		hwlock: hwlock@3005000 {
+			compatible = "allwinner,sun20i-d1-hwspinlock",
+				     "allwinner,sun6i-a31-hwspinlock";
+			reg = <0x3005000 0x1000>;
+			clocks = <&ccu CLK_BUS_SPINLOCK>;
+			resets = <&ccu RST_BUS_SPINLOCK>;
+			#hwlock-cells = <1>;
+		};
 	};
 };
-- 
2.34.1

