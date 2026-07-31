Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC6344CF29
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515449; cv=none; b=fH6RxDel9Ko1iS9+Scs9JfHDvo1E4m3ET5EAnmTSIzAmsJQCx1wOtAhfW1kX8Oix4q4F90FGMCrSeQQnGUDxJeICxJfoWwQAkX+pDdrn5G1w4bqnpbal2tEqpGYqWuf1bJUi4YuEcOypZhy/k69FYSam6X38Q8QXuz0pYf+9hos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515449; c=relaxed/simple;
	bh=w35lwaZM5Jhv5tWlfxuQgAkqn1ey5k+A/02M2sV6IqQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ikp+9Hr+jJ8q9tD8G4d3ey9k6MVH8LTpYputUsKbPMp559hzArQusdrsDb7SNKaOnfUNS5J182Ftm69ceYnEhuXY9/neqzJbIJFTd8r9WmkijRJEwGRppKElvV3eg9QeGeysJwdZuFYyoQ7ERDhF+yvZYW1Vb7TTR7QYaRTPaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dQhvkBDb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dQhvkBDb"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1509688f8f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 31 Jul 2026 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785515446; x=1786120246; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B01D71Y0rA5zgk1TYOrIFEwTDt7QQ32kG9Mc4Wkc7Jw=;
        b=dQhvkBDbJKgqqElOqxCiRmYLm8WsGQarTexyN82aEuHnznvTrKZKCJYZa7L5zD5TMX
         qWTu7/EvIKi/wt7+IytgOCvc0rMSOBMDLA/K+rRrIZuf6pRUL5+vNEEBeslmVcaUUIft
         c/zXPZRvO87yqQ2JSm6hYYrNC7JkUNPIAtrgfcXO0rTcNp7b2/1VoXVAolrI9Tpk4MeF
         al5ahvxAy7S7cANuukfkqt4KU++D+e32gzOoO464MGA5TAEVS7z7dOIx2ixjmU4c+SuX
         m2PNWfGCmvZ2YSNQvuIOuEEQtXg4hED3enlik7JQrryHN8ckZFG8a9afzWYwlSX1YXIK
         3rIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515446; x=1786120246;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B01D71Y0rA5zgk1TYOrIFEwTDt7QQ32kG9Mc4Wkc7Jw=;
        b=E8S9YMTpq8YXxC05EYFPm7LyH5Q5uoi5dzDBdpCsxJO0xK0o9xD1dVQrXZoZYfFmLm
         Q3o0XuOaCrBzUC6gjM/3tfAsi++kbvLBbj19vJ3PZ/Rp06mhjxQ2Puk+uP9UzHMIjuAb
         Ill6GJryqjbQRp7ccGg7POJu/pniq1v+OZuCzhbLld5islbganiaE1TOpsWXi2nbazua
         8Nqkrc8kRa7sWx8vHv+2Lt5LWBOkB6Ni/DKRGx4Lf73My/xYLexYV/NVyrVipj5rI9cq
         oFaeGit6OSD4hJR+BzjGo7oiYweiJP5TCqYVPmoN8awXbNq+n/SncPpJ5We9Q7pIqOxn
         qe8A==
X-Forwarded-Encrypted: i=1; AHgh+RqseoVnt3Mk3KERk1olrYLOBBmBYKHp8HgAXS2CFqHnou9Ov7xUf+h1BpqTSEtdT3s4VlCeWl11Mvk9VQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRRGdDDzQdN5FlzIkNygp4sANG0EOWP/b0LXEeyNARvpHPs1gs
	A/5SXl0xwPoltrxpp4srKuVifhQjN0270DVDKwmvtR4zwy/ykPk6DiknCSu85Rjj7bk=
X-Gm-Gg: AR+sD13tKhXGGY+4A21tHlsD2tbZisLh2oRpdfJklDE9tzrAJA3Wzeqr/72aAXIDqK9
	p4XhFrTYQ9mpSsj88SEfmMvjpyO4CS+WlSwM9OoavovUWmQ+4bNMLugugtjzKMut/I59WQWCcCl
	vVOBkFsCn7p87fDLkkviiVGMtQ/QqSFKAXdZ5yUeENFAxUr7qNRCyeCXOgcuQkCGYFFnSFqF4Ww
	2ROlc3hlxUgXDMal9YBZ8jRiw0fpfObwlNgolke6+Nwl9an0Lhj1NO7eGwRC+zrzYGnWwn/7XxP
	VpcwQVeozk6ga21FNguCQIEW8kk6hzt5cv6IYEs/sbAn+5t63v7slRfJWLREFJePWvh46JWSfMG
	aC0CkxhQWdAQipWqOucdCxqrIJUXKVfuubkodY1/N5auKidHZWNGLRoIm+AZuN2p50jqgiQ68V/
	LCzfMF0RoWxNijCYuwxboGUId2re1KO1cCc8oN+0TA1YZF6RoNP1qRVY5txA==
X-Received: by 2002:a05:6000:615:b0:47f:762f:32a9 with SMTP id ffacd0b85a97d-47fd72a8f3fmr672008f8f.12.1785515445887;
        Fri, 31 Jul 2026 09:30:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd456262bsm5900050f8f.17.2026.07.31.09.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:30:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH RFC/RFT 0/2] net: stmmac: Add support for Allwinner A733
 GMAC210
Date: Fri, 31 Jul 2026 18:30:25 +0200
Message-Id: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHNbGoC/yXMzwqCQBCA8VeROTe0f0iha+ADiLfosK6TTdi67
 GgF4ru31fHjg98KQolJ4FiskOjJwlPIoXcF+JsLAyH3ucEoU6rKanTj+OIQKKGrrMXh4TzKEuO
 UZtSl7XrSyuuDgSzERFd+//QzNPVp39QtXP5Dlu5Ofv7asG0fT1HmGogAAAA=
X-Change-ID: 20260731-allwinner-a733-gmac-support-163bde10c152
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=w35lwaZM5Jhv5tWlfxuQgAkqn1ey5k+A/02M2sV6IqQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqbM2wWoLP6AQ9cI4VA8q5m/5+1cKrwSXpM2W6M
 e/cJohJsgKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamzNsAAKCRDm/A8cN/La
 hVL6D/4331XwVduIAIJWF+PeOpvRZZDsSD9BtI2hgcNm6X2vDunqVGtocqmr56Jkh2ndnuyheam
 AFy0FMb5r1OfNFGb4MM4mA06458dALYQ1wwTE2cJm2MfDm84tsnEs8wZE6Q+4FJfOalOsTvRJeA
 FnZq8tRRhMa8DwM+lqd8jiRwOrOWoEXqZWh/6GAufDFGT3Kdwsff+h7hBT6D2SYixP9xdOHjaMz
 hEBBm20A+US5YRsSqVpNiplu5yQcPU1yjOoSIead3uK7OW7L/fcfkYraoH+R/8OTrneEMY8l4si
 TobSWyrQJYZU2N9pASoqLqHs0YECoOJ64Ip6U2LAv0t5PzG96h9tVr0bpSUfBcaf39VwIKfA3ys
 dD2ewdOB80Uz4FmanIWRFHcQRlbLFxvcy/4DQzDjIShGbrbo5p5Wrztv0vf2phHY7lDlUtTTLwA
 Tz5u/7zqA0l3ElKWPlugOpTWx3lOmcOcuSY1kKb//Yn5oiv4omwKcMN5PYQZhy6gygtDowA0uVT
 dAcbNSws2YqesuL60imTCz0PgGcWrz3yQV717FFKg7rSdBodLwXwA9D5M0pvaccOmz+SQgzxAMg
 E+7rQnDLEnEiSIGlV+warlyT649gI9lDTHgmDPStcy0IR8EawQlVN+SMzvFSm9XG9AKMlsVxJ24
 Q1BqcpuHSlezGCQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The A733 GMAC210 is a DesignWare MAC 5.20 with an Allwinner glue close to
the A523 GMAC200 already supported by dwmac-sun55i, but with a few
significant differences:

 * The glue configuration registers are a dedicated MMIO region of the
   controller instead of a syscon register.
 * That region is inside the controller reset domain, so the reset must be
   released before the configuration is written, and must not be asserted
   again afterwards or the configuration is lost.
 * The DMA channels have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * The controllers do not require a power domain (AFAIK).
 * The TX clock delay value is 5 bits wide instead of 3, split over 2
   register fields.

The DT changes for the A733 and the Cubie A7A board are not part of this
series and will be sent separately through the sunxi tree.

Tested on a Cubie A7A, RGMII with an external PHY on GMAC0.

Full disclosure: at the moment there is a problem with EEE/LPI while
testing on the Cubie A7A. If the device stays in LPI mode long enough, the
link sometimes (but not always) goes down, coming back up when the device
exits LPI mode.

I'm currently working around the problem by adding the following
properties to the PHY node:

	eee-broken-100tx;
	eee-broken-1000t;

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      dt-bindings: net: sun8i-emac: Add A733 GMAC210 compatible
      net: stmmac: Add support for Allwinner A733 GMAC210

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 130 +++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 145 ++++++++++++++++++---
 2 files changed, 242 insertions(+), 33 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260731-allwinner-a733-gmac-support-163bde10c152

Best regards,
--  
Jerome

