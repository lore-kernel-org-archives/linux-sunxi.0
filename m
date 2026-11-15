Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748944;
	b=tANdbEgzSSo+9nXICFLjI4mC4f26nVIRuBObaqjYzcEvQL50Wb5VJ6886Am4KWsq1QAJ
	 ufQ4EnSbwwG6hKz9jybBDb5qE0VAX+aAthKRS1hVdC8pZY0K3UOdfzPkNT5A1CJU9l0zH
	 LfYB8krkZ8KngMepeTL3KPYjYZqUjkNCo5Vm3MKKnmzoQM43xBC0qLWQxSt5xQTN6sPbt
	 PTMjC+w5LuuAf5eSAroo4wn50BMeMqRI7RfZicDcGNXPFxbLrhGxCa5HRjtc+agjxgDaF
	 PpaTQP+SqmvYIxgtsA1a9yZlbyWCfyhWVgXHygTBRPZEEWe/s4vQCxzGtk4Ckdx2agQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
	b=jMONt0vdRrTsrixTR83IZ3XliaVDWbLjsHmzKg6eQZtKC0v2gYCABC5fQHQ1alVXlnj0
	 3+nJU2zyUZMGXLYFmkx+1DGM1vLMu3ZPjZTxHPGkltFMBHF2CSuKZNXbfg/MPE1ui+JQy
	 rZDQ8y3HQ7tS3011h2XalzvxkRxrXfiDoyG+vrceNkG0njDxUUmgiKuAS+GLULzKEKxV1
	 LMdCFsgcN+mSRV7vRPEGBY4DvDeZ99dBfdztuk/LMW1z2iO4WbYa7CwQeOrxp1vtcu77N
	 FhRVCF8MWYk3GF7dQoLCQ4To6BorNbyT+5qF0JYmxKxCa8P1xCqsJnjjacLqRkjkxXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IXk/J4VF";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F284E606A31D
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 13:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F284E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IXk/J4VF
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-497614c95f0so1097351f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 05:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748942; x=1795353742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
        b=IXk/J4VF7Tu1P+JA6VpDxHEj1L7Tfpm4qlZQ6vziCr3oOnJHafQfhvNby56Jgh3G9b
         LXJABrteZ7Uo/PVrczuqtLcH54Fb5kPQ0ZU7Mpe2ZK6zthmpcNTOiXTJksZ+WOJCCE1T
         ozh2f/uFapZmz8XOSwL0T4EYJiqi00X3SDIIa04ZrmdraW0M6XmKt0C5n27xtltu44fx
         e1woIaX++B/X5a7gohBmepDFBfb7XfqTbb0AGr5BqU7pKSWLpKmLB+QBPXISIcG5dWmP
         1pESJ8Pmq3qXZYfszvT/1dMF7jTYvHjnX5erWtjDEalg5BYz9wnY3AsBSeBFYpFejkW9
         92+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748942; x=1795353742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
        b=WnbmPWu+atmyRoEkvHbwlyHy+rWQ2Iys055YOduwxCbPOwDAXe9SNI0IHma90NIxFr
         dPThu/zvrALImR/dTJq6yw0lsynLZWVopG+dzl25NKAR97+xgX+FyjAg8ICBe72942wF
         a2I70ZovBBseYVeX+GTfRZFJtd0N8Gx3CJAOzkzq7r6nl6H+3RUiT6CKEhAKv+YYhwTC
         c2LVtjsuP/1x0y0LWwUs3rgRpJwMDOfI+KY/OJgSOuhvycbaV9Wf6nBqTvWIIlm3THq/
         GGcneY8IrXG/MuDGIr3bxidOqP0hghBdZTbItQCiXA2vSx3KY+I1tsfBORSHz3KYtBsn
         DCdQ==
X-Forwarded-Encrypted: i=1; AL+hErGfozCoQVXytE7Zv0QDXAWIDEpQuyd4Iem8fe0ooXVGjx2wCKVIf/OU2BboJrTJEtZf6rUBU85moK/koQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/AW5m1+V1Wc/99wKJ6MwdstQUa8vM++p+4V5sUtgWsMWZZagZh
	y5fU4p4AuVTsitNZhxYrksRQ6WHe1wLze8Yn0NbmaiAsX4Ju+IJzBB+1
X-Gm-Gg: AYBFou2luUoTMdg/JoaickPamsPBi8EvGIrkSab62cL4fbxcA5hk4SPgKN/JxHt6pxS
	DWPuu21ZmXih1RW1jbhCCsUqnSWM54wcps0+slBkl2ZgIIkAfDtHhmzlOYSJSqR4Rx0Uyb2QTuY
	UaI3PZtmADFkUtyyVGWXvBjhfHGmopqYVvtb3opDMheDjcrIyRy8HxKdPmr+UMgxrc/qT+pHJZa
	bnz1P8CpL6K4od4Kh/AD8m0I7RxOgrI2BjPBr20nsBav6E4VeJJZ1+huhhdF4AFL0oPAp86vluu
	DsiHEcN28eJtrFdRbFU9VC5gzUoFA0ZjgEx7v9OGbdlcE5vm9pMiECHfuMokR7pvUbNhLDJ1XUq
	AGZEaZGUlbjpdCsklpSJxJjM78e/MjjmiKcUto0KM62Znaii6wyiVPP/G+ixmLtdyF7qsQSd/ni
	sDfQYH3nUaKwcfu3AdChEnUPBuOTlDwHJ2QGfSdy6z8BkAsL/rFuytbb0vafk+QrJ4QMAYlwxlF
	z2haFRTjFhGR9j5WeDwPdxL0+b5gKdZp2835TLsmPUEOMFKG/u1O1uIab1gHiEtJLQdsGQoamam
	gzgWktpBhqTZrZvDj52r9k3vz72sVXjCBcZfh2dNd8eMrjCZxwcf0dWhoeG7YY2ybFB/f7ymqgy
	PZ4daQOjpAq5hzLQw/wpjGIz7AP/SSd2n7m3rCKL4J/2EYCoMZPPwHpoEfI7160Luxd8D/SCsZA
	SgWfMNnqNgzeD8EEDVWt6uau/U4/W6uOW3W0zLHnDdpW5cfyIDvIm/GBe7JSN9EZ4p67NBLsccS
	6cVmgUD9KMDHY3IGOedbTnGKxWnbF/y64k=
X-Received: by 2002:a05:600c:3b07:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb5de1f216mr129069365e9.1.1794748942112;
        Sun, 15 Nov 2026 05:22:22 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:21 -0800 (PST)
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
Subject: [PATCH v2 0/3] arm64: dts: allwinner: h6: Enable GPU and CPU DVFS on more boards
Date: Sun, 15 Nov 2026 14:22:11 +0100
Message-ID: <20261115132215.289236-1-jernej.skrabec@gmail.com>
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

Most H6 boards don't use the GPU OPP table, and the Orange Pi One Plus
and Lite2 lack CPU DVFS as well, so their GPU and CPU run at a fixed
clock rate. This series enables both.

Changes in v2:
- new patch 1: add regulator-ramp-delay to vdd-cpu and vdd-gpu on the
  Orange Pi One Plus and Lite2, like on the other AXP805-based H6 boards

Link to v1: https://lore.kernel.org/linux-sunxi/20261104184940.882833-1-jernej.skrabec@gmail.com/

Jernej Skrabec (3):
  arm64: dts: allwinner: h6: orangepi: Add regulator ramp delays
  arm64: dts: allwinner: h6: Add GPU OPP table to all boards
  arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling

 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 8 ++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 11 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

