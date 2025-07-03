Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40962F0027
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555663; cv=none; b=PGkV6KpStJiKdPE2/hbrxkAFXy51Qzb4V7bWY8HZzJKJN5wmMPVv7zXr06OePjU8kguvUj0hTypNghTkOHDRJbIm5C6Q/v88HZJtTWvwJSy9yVqRwKyossgW/1h3zae+QzC5ZFAHFThVeY0FBDVGNgAFUGDip4YwuPHuYcVNoH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555663; c=relaxed/simple;
	bh=nuet3Y2Mut6w4Wyqoah1ZW4X/47vl0+/djn5JivXjco=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYqxAkMkpn272ZoE9eGmXdWMNrEOkCeK3cYkM8vYwMrHqVJ29ZMa8Hk7jf5MLEsGKn/7x1q8QTOR+EdkjmkZU73hd8GDRA4uDCP9NCSIu3qm0upToZTzskivx5ELVbYbdVwm5NJX/9ct7klaTvD+WhtpNBY+9YGjos0rakoODTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZOsM72O; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZOsM72O"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b9eb2299so1064540e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555660; x=1752160460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yu4RZiro9Bw5AAl6vcrDQRHkTa7Z3Wce+i+f0KjYjtw=;
        b=dZOsM72Od5lSQ00N0Lmt7K3eDrBmWMI6I+cDAhPf1p+RtGn27abuBon2E5mK/GdUhU
         WbXy9meitueCHXMDkOF9q4TUgocPPqdt9exs4bWMhO/dYyLeKUO5Mox31y8NLpcyOjAl
         YNVNRbdYvKnb62/nsCLLF/4NvsSCoi5A8lpCPf4k3ZXwTJP6K3CLQTPCsPmaH1rTB9dB
         tg2Ae0Vva+oXSs8pPUNkqRDO12dKQOiH6cUhlBkPzlhXtDinovBj7sIZFH2dxQ+LxC4F
         Yffh4hAe1m+uVJyrNwSrjff0UsBGBXHGUHGcoOJNn0jnIF3pYdQIpTMFUG+LfcqoQvxf
         oG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555660; x=1752160460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yu4RZiro9Bw5AAl6vcrDQRHkTa7Z3Wce+i+f0KjYjtw=;
        b=t+hsTEkhYm78jlh94hhelkgenMMEEPX3ZfmHM0WOLxgFQaM3Qe8jdMIcBnhRLXU/Ec
         ZxeSFP0i00UviNy/OQRpxzS/idyAixhHtySlZGBQXeIeIstrBH0LsXbzH5li4gR3f3w0
         PttN6ZMVjVoHoQFzVEZgG5R18gxu3dg2aH6qp3EAtaWQnN4DRfLMqniFWaGTGr7hpyxa
         KDbRfKArrknVNRijMJSxcpFPGwiuZ/3bmLjQxvMZhwfPNw9i0+ZOCCN+lItJIGZYd/h5
         CBqFpByNFC+v9PB24B1AqQo+oKCV3xWZxhrCeBVW5VtLIpktuojUEj85IpDgWBH+4QH0
         dW4g==
X-Forwarded-Encrypted: i=1; AJvYcCUvqpIgkBwrf4/Iud1NHjfQaD5d4PZGHgO9Q5jgAJhC7z3ZIlZbGnRAyWwNd7o6ibkvF8eQj2wBMxIRSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpDgVuFQsI0oS3LpVIYz6XvQ7h1jFfrxhuqzRh9sNzXv28BoUq
	hu0Dq91J0amL5fYNbRjbxXOHrIxGg9BW62V/7QdEg5vQJxWZIERNpurj
X-Gm-Gg: ASbGncsR/O3DZlwn1X4Y9zgL7V68M9VtzJZPZpLvv/ttdb4l9evMQj6nkyw34sdGNUA
	OI9AMUIJYkdRPQ1iUtNnvKpzMsogayIGBL7XudweasAJ7XL25rYyqZa8EATyRxo6cFZAQTBFHhU
	3Rnw7medLGjRywi4j7ds3V/ZnuQ2qWZnfTaB7zdAdFrizVoNEeuadb8gehp8oT+xUpqkeRjzqSo
	4yYPhpV3wp8WMDdZIY6OPn98C/Xn+VLb9m7ypb0usz2beM48owmYG9r90JSCR/TjGQra3BPTP6I
	QlQnz2/ODCgw2gMJbT8ca/z77y/qLDFOljGVsRROlpi6hVVPitXr0mBFb4/ygH7+cvcfYdv05Fo
	X7lzxLg==
X-Google-Smtp-Source: AGHT+IHN05FoLHrAAAw9abh/cl/blTZb9HkyB7tIwYOujTKMU0qiobVnp7H6qLANj1z3QSOpo0rtXg==
X-Received: by 2002:ac2:4e08:0:b0:549:8c0c:ea15 with SMTP id 2adb3069b0e04-5563013d4cbmr1247150e87.0.1751555659497;
        Thu, 03 Jul 2025 08:14:19 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:14:19 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 7/8] arm64: dts: allwinner: A523: Add SID controller node
Date: Thu,  3 Jul 2025 23:11:31 +0800
Message-ID: <20250703151132.2642378-8-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The SID controller should be compatible with A64 and others SoC with 0x200
offset.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 8b7cbc2e7..295292d67 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -181,6 +181,14 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		sid: efuse@3006000 {
+			compatible = "allwinner,sun55i-a523-sid",
+				     "allwinner,sun50i-a64-sid";
+			reg = <0x03006000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		mmc0: mmc@4020000 {
 			compatible = "allwinner,sun55i-a523-mmc",
 				     "allwinner,sun20i-d1-mmc";
-- 
2.49.0

