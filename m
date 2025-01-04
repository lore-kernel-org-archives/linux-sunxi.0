Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785FD146D76
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Jan 2025 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976444; cv=none; b=jbKVOiq/o+8Z08FGWPIXN3GdZ6ubKQYUVoZaRzR3lQXoG+89a3TOI9yqvGFpzQEi9eURpNKKhIRcfdaPgMzVi6gFtKl+ePMR8uzSSVZwcdJS/bikykQ/DVgHA2yyeCxMHR4Xqzn0Lz73Rf3J5Kw+kJn/LI8oVqLScZVxv7NtVvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976444; c=relaxed/simple;
	bh=kuH1EVNAyoVixaWKyWINyW5BBhFmvv3Gv6Zp5f2CECQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgopTX0TPLtCn+3lTxRZM6jOrvl11XuWq/6Nlk7rs5we+dYsDsZ8/hrAPciCdFXaKZxcCwz+wNV2vQebwxW4vmowBQbnvGf5+XpQn5s4c2xhhUUg3F3MQHleH2JB78kOLSry5nu10qtlcR/to2s1tn5RLib++lmWB2Qe0drvwFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDuBhnc/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDuBhnc/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-215770613dbso134006965ad.2
        for <linux-sunxi@lists.linux.dev>; Fri, 03 Jan 2025 23:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976443; x=1736581243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucKo/2iuUBHIMBU6fs9Y47TbOcPpslhh3YJFrnEnuN0=;
        b=IDuBhnc/mW77TVSVRaEU+Nb/y1I6kCRjjjThcZFquM4PBNP3zIZej0f8sDjDz5Fuqh
         ik37v+gsM8DHcNikVwHMz+5eNuCuhdyGlZUpL+9AsvnmvqQZfeSg6E0lFTnadgC+Lrqx
         iOvVQtrfTjN6WUWL2efwwU7FVuUGeq/OswE+mmgv7Oo+pDopax/5jfUnqch6FRkF8TsL
         x5vmD/A6lmxD1CzF1XAdE/AdNok/ppaEwUyT25vsfdMJyUbig95Jc9ZgZgB5s0Oy3jgm
         FDJyyxPewYy9DfsqbYEaRDN3CEtX5n6mO/d0/x/IS3fBwrtn/KTi4tVyjfirZK6wPUJZ
         BVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976443; x=1736581243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucKo/2iuUBHIMBU6fs9Y47TbOcPpslhh3YJFrnEnuN0=;
        b=I6Rn6AXwDWoYT/vI8Y88seZ34b2ZWI/OvZn8X9T5bhyhi/eXEfXXFtmV7k5sa8atLy
         Vwl8WHllWI4clWGpoqIRjPj49a1OXGz4DdjlX4xJreVuP1TTRzdM9rC7sOONEdloo046
         Pyh/214Pg0EeTTCfy2andIMnAJOqfvQ0P1OqkUV+SLk2zfX/uW8kNv+SGyywOIGtpdZy
         N52SH9VcLdcLDCNmHzhlWnpVcIkM1PojKeNJYFpnkC0/RbxhkB5V7gn5S/lJEHyexmBD
         I0LFNoZWYEkTbNZv0bAXtADu+jaUe/dssiO4MA18OZgMQbzNU0YC/0MNmd2flWwioK/z
         Nsfg==
X-Forwarded-Encrypted: i=1; AJvYcCV6uT0SgmnMLn6Ue70VvxXn8ZQqW1i55Qvj+AYiGFDwaQiFdzcdeKmLe3hFADU9BB1Ic6ze0OpyTVA1aA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCAwPTl86jn9uX833tl3pzhR+fqKKiqMLuWr/0cSRcnQO+0RQD
	yhBFzQnPTlZQqiMdyvNLrRmneEM/tJTefIRsBsJl+k9R/QJWvN2X
X-Gm-Gg: ASbGncshxqoPJlqf6/Ozdkv15bpk7/zYxCYEHuj2Lp+hcCp7vtEXKMYu32hKpAzSTOy
	fjKPSgF/495oR4pLEpiNtrYmlpFqtSsDdtp+cgcNk05EtrJG+suUKLQ6uB3+BXZa8pUQJ2D3ANn
	6tC7p6LSjQsMxB56PjAGOmNXUyi3gsOTXBFTYyp3WgnYzXCuZoxqAX5Yndg3QdTCuSSdOqPbUvo
	hdAyqMsNV9eURAyg9NybLLToq2rV+OFZYDFAGziSQHRiTn6UA==
X-Google-Smtp-Source: AGHT+IFLa1cMRqlQ9BB286TlpwABGnbwaJvMsE4Ob1+XZGsWNekaNd7fepzhC39fUKHuoMyTfGW+JA==
X-Received: by 2002:a17:902:c943:b0:216:6901:d588 with SMTP id d9443c01a7336-219e6e9d949mr797755625ad.15.1735976442692;
        Fri, 03 Jan 2025 23:40:42 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:42 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2 0/4] arm64: allwinner: a64: fix video output on Pinebook
Date: Fri,  3 Jan 2025 23:36:56 -0800
Message-ID: <20250104074035.1611136-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI
in TCON0 mux"), TCON0 clock parent is always set to PLL_MIPI, but
unfortunately it breaks video output on Pinebook.

I did an experiment: I manually configured PLL_MIPI and PLL_VIDEO0_2X
to the same clock rate and flipped the switch with devmem. Experiment
clearly showed that whenever PLL_MIPI is selected as TCON0 clock
parent, the video output stops working.

To fix the issue, I partially reverted mentioned commit and added explicit
TCON0 clock parent assignment to device tree. By default, it will be
PLL_MIPI, and the only users with RGB output - Pinebook and Teres-I will
override it in their dts.

v2:
  - split device tree binding change into its own patch
  - add rationale into commit message and into comment in the code
  - gather the tags

Vasily Khoruzhick (4):
  dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
  clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
  arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
  clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent

 .../boot/dts/allwinner/sun50i-a64-pinebook.dts      |  2 ++
 .../arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts |  2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi       |  2 ++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c               | 13 ++++---------
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h               |  2 --
 include/dt-bindings/clock/sun50i-a64-ccu.h          |  2 ++
 6 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.47.1

