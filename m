Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717791;
	b=SqGVcdoU5HFv/AuHYCxBkue9Mml9U7Dnh9TYGs6gXjOE2j/7QFx4z0zvPnW98g2aW9q7
	 lMlR5DR6WsevDew2dnkUP/E7bKc99mm+rdZkPN3zqrxKGS8u0+gmS5nqngIXSi59EvMc7
	 fc8ZoWIVd3X6Hh8MSITLKzAz4ckc4iiafW7LP66Jd23YuAsxm6FCz3I9SDTKwOSLlGK9l
	 HP3JL45xoBd/NIyNf9SQz8QbYqyPKKBVKOE/9PoHtUFj/rWZFFCik+MvTAvQcC4WN6Kyq
	 5bNjc+5pOqcgEJaNWxC89eGkz+6OzyxyWGzwkMuptMppqZ6KWhKJ2a6LLG0nN8WSA3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=owBndUl6B98qwPRw0FXk88D41lLAkcYrE6f1l+yGymg=;
	b=troot6UVdymMrFSaRi4gOvGIpKlljWNuTR2Ui/tP27/V7EcQgqWHYY0yefMSdZODNtEP
	 F1SLijKA85yPnxvgeLuK53+wJKxSX8TeSwBNQPVUxLo5kukN4s/kM4oaCAB05BcyhlPjQ
	 JMB5GDNbw8kfrjZOxi5/z9vjPaHa8C2lmCOBzbyVyImunK3am1CJWNw0jeVUZaMrWUSOq
	 MIqEpwpSN3CTdOCXxb7xcBZxZPZKDuXKMQcfiL+RAJ5Qe9S+HUxrhEdPkwLj9cvIG8FJc
	 lRBLO4nehGvD9oRM8jLiX1Sn72YCgiVq/BFJ8jPHX5NA+70owvTCfHQT0nnA4krk9Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f3nNUc7G;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA8E606A32E
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 18:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA8E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f3nNUc7G
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so19272835e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 10:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717789; x=1796322589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=owBndUl6B98qwPRw0FXk88D41lLAkcYrE6f1l+yGymg=;
        b=f3nNUc7GeAp/4QgsT2UzHWTJwzj//G55nngtigJ/jrb90pmTX3/QvoCyH8YGDcBCmF
         LmB5ymgr1m+/Wms1uiaHxehtyFzFAoHX67fxBIRNMI+0cgUQuY9KdbrYzWK4Y6ibgqhx
         vVG/Nt+cIDgBzw1WsIO6y0kyB26v1nth7JTtVO/nBLuCTL/U3qCmVQh6Re/QEsHaygdj
         Gz4H6Kcz5cNKON6F6n32GG+/aYvTDDOwulP3jPGNwXNWnrUB9sIjARLOiCMUuEsbduZ6
         y/CIG0hIzZ23dv2kx4ml+sdCKQ7dukFD4f5sqC8ooLXswS2daF8okkyKusJ6Px7zhkq2
         FnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717789; x=1796322589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owBndUl6B98qwPRw0FXk88D41lLAkcYrE6f1l+yGymg=;
        b=jT9b7HIpI5pkVOkpqc0/DQj/x/HjnjRoApTkw8MjyML33dgGez9jqEpOPpDiostrcl
         oo4fAgZCH+O7xYuG5aGxC0fbw4uKlsGjM1F+AxJcDZ+EXo/+/8Y2FwR3VJjr20milxeK
         hN38NhPT2P07lRR9kk/eITgg6EUabSJP3vdl2HAq4zK6DXmnwi2EISJ/LGGlgGOw+75r
         8dqF2qfbGzUPZnFPAKcngbLXw9JFsNN5b9EoF36rpjMJIvxWJp0eXMTH0WAz5fEOfXXR
         Uays6ei/AGMzYzy3GAokg9z6+0yKcUqSNn3KiPSGTzsVVO9zJlDtkGu8SEeejPsMWPD2
         cSVg==
X-Forwarded-Encrypted: i=1; AL+hErGWDUJA8U3cB5VXtA9XkVcdPOxPNwR9HCySi2OQA8VVUwI/3pjlEANZIDqDbXUHEjInHKFezEeVAp0a9Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/1HWSpnJOQOUoTkXmhIFMf7VJVc4CZs2npYDvDi2soexx1KQsl
	Ugu0zufop5M4LCRF+zHvAGf7jb6snU6/Uu4IUGMjp91KRCpM8vk0pB8Q
X-Gm-Gg: AZFdTZdsQ0DVypZwaY9tbjiurAGb5MvOMzB6atnyyTgYHdQgz/d6uCa9Cl7ODJnqWjP
	ytsJvkAXNH4Xe9f1UR2uBwt+Dt/t7BY52tDPj0l2Bmreug+R4dD46zF1N4i/kKa96s3S9CqLFd5
	gcFHL9VuDO4May4P7LgRQx6FoV0BRcdkVtHjzV4jISeRI3xjEgcx4xwAAZ/ai+7lBSlcKE5gWm7
	BxPR2OHB6xUQ2GmCdRnN2Rp6jMXHrmi1otwhoQ/bhSk+2MNwcrzXVqJTlEphAn4v5p+RwSQDC7P
	8eY1S9PdjDRWUmABQLCq8KV1RxJrgM9xUap2X7wXxHBBkbRC5vhH0En+GB+a5As97fECFmO4jAW
	wcwZ6GiDSDNkoRvV9U30sOiEWB3n8Hh9dGQSPYK8fZtDQIjBwkZBaueJiSoo20tY1eHTdDhefKM
	GaQZwpGKH94g4+GhkEF63YGGY72Nv4UFoPnA0GR329oiodS1ON3Nl5vOfT4W8doeORu+4GsgG8O
	JjC64yU3+OlXRDAdRjx6vxFUPHNKaJFRvW8QXNXW/bErRx2VKT7GF89cata7zBh/OL1LDiUDB2B
	34PP6Ff9tq/SF8pY1Ds+leGg/r1PU09jH0VViquHHJiS43BiXDIUXbwpaTfpevfx6M/A6Q3DL07
	mXxcRPRaoOK5CpVuZk55zgxe/2IQJktb/AqpbnsUkOcEJAzZiR4I/rQ1Xvb9rGj+T4RW/0vxpwp
	0wIbDWlYBVsO+DMHFSLvFez+KHLuNUnNxd96FQO5cF1rtTmTDSXGkLYucu03eWVpKSlwmNPgaJk
	aexTvY4bizzzRFCVExBxOtwMykJZ08TkENNphHY4w==
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr443791125e9.8.1795717789172;
        Thu, 26 Nov 2026 10:29:49 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:48 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/3] mmc: sunxi: preparation for A523 UHS support
Date: Thu, 26 Nov 2026 19:29:41 +0100
Message-ID: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
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

This series paves the way for SD card UHS-I support on the A523, which
will follow in a later series together with the A523 clock phases,
delay-chain tuning and the PF bank supply switch.

It improves the DMA setup and error reporting, which the UHS-I work
builds upon: a DMA mask matching the shifted IDMA addresses, IDMA
descriptors built from the mapped DMA segments as the DMA API requires,
and CRC errors reported as -EILSEQ instead of -ETIMEDOUT, so the MMC
core can request retuning.

Tested on H3, H6 and H616 SoCs, on multiple boards, including Tanix TX6
and OrangePi Plus2E.

Changes in v2:
- dropped patch 1, applied to mmc fixes
- rebased on mmc next, which now contains the probe error path fix
  the DMA mask patch depended on
- Link to v1: https://lore.kernel.org/r/20261103183030.81078-1-jernej.skrabec@gmail.com

Best regards,
Jernej

Jernej Skrabec (3):
  mmc: sunxi: Set the IDMA DMA mask
  mmc: sunxi: Build IDMA descriptors from mapped SG list
  mmc: sunxi: Distinguish CRC and timeout errors

 drivers/mmc/host/sunxi-mmc.c | 116 +++++++++++++++++++++++------------
 1 file changed, 77 insertions(+), 39 deletions(-)


base-commit: 299ac25f5af7cbba27d80e4eaa8f9c703c96b2dc
-- 
2.43.0

