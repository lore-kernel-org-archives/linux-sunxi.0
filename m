Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111720;
	b=jb3bxgGPloHtK3fbo3ids5WjFSg1B2HGafRrUicQUOSXt8n7WlTRkxEPKnIhIwJLSTb0
	 T0fpjgsxio/bieEAOKBGDqHUBVg5AgQzOQI08/nWYYiQWx7gKD7UQPz+dWZ7xEdCU+JNo
	 TDrrAieq8Ba3H0+wEw6AQeOfdn0Z/QIpgfXvKuj0AKSXmLi486v8Ecb4ZPrDF9Vc1nB0o
	 nWjbi5o34Qu4bXeILAdB8jpiqlkOEILGv05V7EJ60I17GgAsv4Sz8X0vA81eYaus8ohap
	 +0DA/eZOpOvMdhtn/8M5bm5N3m7JWE929QYjil3jv5ZtiYpgEcetJrYfDwkfvb3SZEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
	b=G0jrb1qUDvwxUlnyl86Yllr2yJjfhnqIOVAxBTvqN2NnFuidsQCTbsHXfrq0oxQWGiiz
	 1wVr+ZqaD9+m/NdUCnNLoy4pAGSMggELAWNP+vEmzwhw5hBnYWTobVXCbZyOpQKb6QCMX
	 gcT1geVh5soKfZKsduke5OhbLshOCOsta0qxmydaRV3TpczMnVPIyYHuiG6Mr3/xWqMLA
	 HDWscb2J4fsXVmDEAsQAW0r8F7nwnLd4xtG/CZJV8djglm8u9Pt16f6iVz8eLNNtxTtsh
	 oEdWt9+/4ZXEor6c4IZIJX6UoTYOf447TJspLdrZ95y2o0taSfLH77/r9lAD3Q0MSoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pdT5V/nI";
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA29606A32F
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 18:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA29606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdT5V/nI
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843cf077f10so85197a34.1
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 10:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111719; x=1795716519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
        b=pdT5V/nIwmlbH05exz1OAiVQLG1DaHZcXTSF+DbZUBF3/cmvUZ8p5czNnLjOtcmQFE
         vhlGxOQgG2MUYVRfabG5mUhlGBjiKwR4ZWGRBDGlMRFVNg8E/mtUbD3HD4Xlnsh/Pb5E
         aDOl1+ZD/+Zz1RpowXWpYEEI4jTa0gSLctakhBzyh7jV6ZXevH1mPWCMXARXl/bee0wl
         jlUSZbBV53QYhNigOgyekmJFeuIdeaGTWoOpeZHTRwD/5O4G87yTztSO0eu8xDi5sbvV
         F6ryWtgwX7xC1Aj68r/BdDiRo78gkaIi2HdH6HP/N9VU7x/ej421OWBhkON+QsrXscdg
         nTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111719; x=1795716519;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MaTsfOQh1jufjU6A22r/oLKFgUzvbTte9hFal8/x1s=;
        b=gHpVpP1i9+dQqUvQ0F50oo/ls4F9KtTlmTwD/B7Ieec5qDTTKGnjbv2+ypYiL5o8ra
         au4L5mrj49wdmLNVGEzI8JrbRBcL90319dyTnYVhPpaUV3AFawL/ro9MsRxUHcE520RO
         yOzAsvMxOPAHwkEfUbE9SO6YNVIoDWgzG3NY0klW6leqYxyc2bf0BOI/cM00jrS17J/3
         N5BCgAjP6QTj9w1en4krQcO/MIl2uhl+RHHct3yFb7WUPt+e5pE0abhCsLJV7tqM2OQ2
         OVSOlC8VS28CNEXVjLAfmYwl6skV6MHNCjmCeL2LY4bRtDcY3Emp/0pCCsuz+px360ZB
         z+mQ==
X-Forwarded-Encrypted: i=1; AL+hErG9DzeJ91To4FCOjIOzKXzRM3pcv+RQohaHOLKhTzrdsYJYksJdXxgNA4lOP0NwdLFLMr3dPKCNj9p48Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z+xF6e0rxxplIZYB6T+9n/+eUB8LyQ6uAuNV8CTFqzmqO6l2jjj
	g5m+LejPEP8AWpF8139bBJ2VfmeuvgngK9xzQe49zFkSYhVKWX4Y8B0/
X-Gm-Gg: AYBFou0GG66zjFwYcnif/BOqkq91hlvhjvLdu9z08tH6hDO14tBfR/D5GUY4BBS6VTD
	7jaa1IQnXK6KaiL70A2reD4zdJsV/6h5QK/ronRalCfEGWfkWWjcLLX4zX4L+ZNrXwfy242f0za
	90C41AT6IuZanVxfe42K4wr0oHyAMqkyfq474fwO7fDKNHhZkz3yJjilVviaS6ShVTtpVQvwXbj
	cU7l5j2qxRqv12JW8/gSqCt8o166+6nTqyQQg1IyaVOCahzCtqGf/v/IGMT0ZQHXxSlykgVsIEF
	VghbfGCi6QjtLtEnZ2cH30GEcuE2r2tJTblG06oii63Fpbdci6G7ThO70UIzygV0PkAqYVWzppt
	PL9blbXfgdub358rXWmsOti5yjgUj3nq/vk0u13lmqcuKthV60S7MFpkPR/KY1ijGx04UXZk5uc
	Cug4m/E9ex0wdVYZSJgfCUdib9e7pcqMJd/yrQLkOYqcRvXUaveho8ryXuSjFChkLXYVE7g2Epg
	CKALD+go/EYpkdBmTo941QkYd85uP0SSmMSrZxOzVqX3ooqhvhfnWc+o+f5vZROe8syYT27wAXY
	fsgVLdm+A9Dcv3owpBoFS/zah6bViK1AuoJfuf2Vh8QhRplTQhjRRszx8bwhHZX5z9JfrQOrCTo
	0
X-Received: by 2002:a05:6871:e7c5:b0:448:a3d6:c2d2 with SMTP id 586e51a60fabf-4bc802e97admr436457fac.10.1795111719191;
        Thu, 19 Nov 2026 10:08:39 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fcb19a9sm456866fac.10.2026.11.19.10.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:08:38 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alex@sverdlin.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 3/3] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Thu, 19 Nov 2026 13:08:36 -0500
Message-ID: <20261118-a733-dt-v3-3-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2105df7b92b20c5268a9a32c202e1cd6c24a6b27.camel@sverdlin.org>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <0fe5938e04cc8a5af3825a0e01bd07b626a15b46.1794227241.git.enzo.adriano.code@gmail.com> <2105df7b92b20c5268a9a32c202e1cd6c24a6b27.camel@sverdlin.org>
Content-Type: text/plain; charset="us-ascii"
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

Hi Alexander,

> Should the history be moved below "---"?

Yes, in v4.

> Should two regulators and the clock have been sorted in the reverse order?

Yes. osc32k-clk sorts before the two regulator nodes; I will fix the
order in v4.

> Should "status" have been last (preceded by a blank line)? (dts-coding-style.rst)

Yes. In v4 I will put status last in r_i2c0, after its properties and
before the PMIC child node, with a blank line before each. mmc0 and
uart0 already put status last; I will add the preceding blank lines
there too.

Thanks,
Enzo
