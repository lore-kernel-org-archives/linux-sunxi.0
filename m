Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCADA30648C
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785797; cv=none; b=rsDXv3G7A03yOtn8oYuD4/YK78MS4gaX9A0pxzjSxVs2RgMkdgP/5Lc+DC15IslaVNBvgrDFYSTya59t7gLjiAaU5cD2E73pxHoH91++3TSHeynVCEjOeH2NGkEVQbcZ/9jlLX81YKGp6xs/or/AbcZhOxzmMm6t6uZrYZp7+G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785797; c=relaxed/simple;
	bh=ieQZ0ZJLMkaYypZKk4REVcl+38yii0go1+lUmv8JC94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBAEDQUzgwlUlKlRrJvaj0c1J/S0YXMj8aMUzAnxP9N0RWw+A/q7+kVCBH00RCx3Knwe2ySTOn6sATrJm9LG57gkRc4WeyFkPjvfvdtetsAw8SwrUoqIVrMW7SdbDAMhPDm8Mwr/SyMYtSuCLlFfRk0zrbvg16Irm/ZZ7Lb3gC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNFD4Ept; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNFD4Ept"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so1275508e0c.2
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787785794; x=1788390594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBDSwIVuGClC2U8jcOy/ySqyjLGwgvu0rHcFGCcBek4=;
        b=jNFD4Ept7KrSfARS67npsZN4IVVlhd6Hogiti3NjMEr31Ny05kGAAlpp27qJyJGa4B
         smM475tWTLkBODOTwhn8ll7qOE5lq2qsry6cauRyx/AZPrYICoVXduuKj74KVv8Pe+Aw
         p18Z57zcOZinsGUNWJOpWgvWiA+RGuON3FUaioK0xpVQzLs85UpVDrxOwG7s0YcSixxO
         KmYBt6iMrm7yxFIYBrOLzlG2HUV+MtZB9uhN36hdHx2N2jwBgZuGc1H+xg3i+moEhApj
         5qtNhTV5sgJPpMfQxPbeTEoThvNZ2UYIWGmlt+/rlUOpXMblCLXQ4CmRDPKw7kXu4a9H
         Fiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785794; x=1788390594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBDSwIVuGClC2U8jcOy/ySqyjLGwgvu0rHcFGCcBek4=;
        b=rsOWPdyYSuEZACvqT3tDtPxMo9NVRauWFtLmni97TxjobbYoDfKnORNcCbNKKdmYA3
         16pcwH1hG+gXbxsCtK0Fbt3xOs4MXl7DnaWcWxGLCb8mdOpyzecAIRfg+DcsoMLuA/Yr
         PMrIdwwmpf2sDATyPegh2btNf+49aeWi/ieA9nx8qAW/PPpYnzefBMx4S4vG+/Qqed7B
         AaXcgKqYwhJxh+mWXBETzoEOpi0A5jsj5z3xLFaAKzOD7zDI4jJ0zqWdAMXCKnOp2WF1
         jSl9Fg40d40P7SEjTudKeAeJ2Duyxa7ssP8iSdXCLAPBit2UtnKeU4gno/rLi/i3+8ov
         WKTA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Qng0eCa+zdOhwfrMCTwwGlgxMnrXwo8seItWp7YsSlxTBsXWq4AKKmDB2yE287ifrkWA5w5kY53/RA==@lists.linux.dev
X-Gm-Message-State: AFuF++nwQmTbbJ97AGUDhpX0QPm5b5iR+BLqXnwzEXErlFZG2Ya+urQP
	dykrscbBl4sscML7PWXc7l4cfriVdnGPSwrtYarxQJjWwhuAYq7qchFr
X-Gm-Gg: AR+sD11lWRW6u6qJQNLHXqTrEL/Q1i3tUVXsjKancrCKQiluGWoj8pTl141We4Bjlk6
	2PSQud75ZTg4PLJqj2TWVC2M/3M/3R2OIXf0Ls3hGn0h+3bFHaeZpZ3i9L4TIfrjNVqvIMQdDQq
	2M2k6L0frcA06Zn2UdQV15OTo4n+qW8TOkm0ZoJk2p1j0xB24EDpDKtsPIi0cY+5aEWxgZeVI64
	hsoskElOnBxuSaVWs9MMoAiSiB5Qo+CXXuEWlGuzssfE22f17Kh+ns1LisajUHL0upKJr2nJ8p9
	qONtvrWa4kvnO6w4lxNheCW9V4i0K5vrXIwVNbruFWUDSN0CQGwBH5MZYP+DQCoAKw3ROePGuFy
	JBGZlHgHzhJBwkVHcLYHL/yA5YERgECXu1wi90qEbNIn5rbkMZAy1wzEO0LBsz+KcpYhM8pImqP
	DtJbe0VK/nCVoyHKle8FXBHmTrvnXc4rBER53gBiM8FCT93YJ8dYEFRjcGNz5YKVzu//VlaONo3
	0K6S1eFgncs4WJiCo2syY8frLnoQmfXv8wBeg4/W3EpVUtKA4caTzord8JsIsUZXKP4Syg=
X-Received: by 2002:a05:6122:1826:b0:5bf:d3cd:3d64 with SMTP id 71dfb90a1353d-5c65b56d0c8mr4542431e0c.0.1787785794612;
        Wed, 26 Aug 2026 16:09:54 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.239.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c65fe7d777sm2727980e0c.6.2026.08.26.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 16:09:54 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] arm64: dts: allwinner: add A733/Cubie A7S DTS support
Date: Wed, 26 Aug 2026 20:09:40 -0300
Message-ID: <20260826230942.466219-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Enzo,

Two findings from building this series locally on top of the A733 CCU v2,
plus one note for the DTSI move you already agreed to with Jernej. Both
findings reproduce on your own Cubie A7S DTB. Junhui and Jerome on Cc.

1. Schema evidence for the clock list Jerome already questioned.

Jerome raised the xtal rate and the naming of the node feeding the CCU. A
full CHECK_DTBS=y run - the whole schema set, not a selected binding -
rejects that node outright:

  sun60i-a733-cubie-a7s.dtb: clock-controller@2002000
  (allwinner,sun60i-a733-ccu):
    clock-names: ['hosc', 'losc', 'iosc'] is too short
    clocks: [[3], [4], [5]] is too short
      from schema: allwinner,sun60i-a733-ccu.yaml

The posted binding wants more clock entries than the DTSI supplies. This
may be the same problem Jerome described rather than a second one, and
whatever resolves his point probably resolves this too. I am sending the
diagnostic because it gives you a check that either passes or does not.

2. /soc raises a W=1 warning.

  sun60i-a733.dtsi:116.6-197.4: Warning (unit_address_vs_reg): /soc: node
  has a reg or ranges property, but no unit name

It is the only diagnostic this series adds over an unmodified tree in my
W=1 comparison - 499 unique diagnostics before, 500 after.

3. When the UART0 pins move into the DTSI, they will need
allwinner,pinmux.

allwinner,sun55i-a523-pinctrl.yaml has listed allwinner,pinmux under
required since d626d248caae, and the A733 compatible joins that schema in
the pinctrl RFC. uart0_pb9_pb10_pins currently sets only pins and
function. Nothing catches it today, because the A733 compatible has no
schema yet - but it will fail validation once the pinctrl series lands,
which is likely around when you send v2.

Static evidence only - no A733 hardware here.

Vinicius
