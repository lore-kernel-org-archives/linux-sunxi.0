Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730652;
	b=C+98qlClUMFJOmUMRPMk91nQwBkGIdpg8Tm50FWli85y9Wz2mcA979FK6YjoGg+zHG1C
	 woVeNbT3dyZYjqAsnBgFwrS1ONWktvv8EG/umZBZm1frRqxoD/ID3m5BW8DReIySdbgGi
	 FNFbuqEApYfP+fX+LYH+2MdIxpO2QxcwhzonU51BB8kgf8g3Xum9SDRg8UOhFbBvcUhtF
	 e0DzVnNwwHbl0uem0DXE1RtxyHDlleSPF4FDegOGGsAfNiS2DaHNIN6/jtC9b9xd4nNbq
	 ivKEyNShDZ8UuLU/vHujMqdKwUI08hBc+ShKGBsKcOkZc7HSYswn53FIy8qds8KZnLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/iod9oXhgsGpyGcJPFTu5fqKBMIMVHyACTtYwHQfVM0=;
	b=WquUiorkaviD4duGdPmK3RVm09XqShPjDGDFQ8qQKuBHtgi5GrGYkhL/IpRcwRfBMGgD
	 Of4vMrkhBkDtRVliUzk3xiWSjHjooztHgTLPxL1hmNOrQrgqghQlVBPr/INtsoSoXhFcz
	 /nCSkZ1BzjeNSFHA7/v6T0BX0eCnjH+NPFi7gSdj35jK0+B4fJv/oI4oKL29xUb1doAA1
	 3ol4yHP8gDjDHv6G/nXXfvhFhx5umRGOVfPcDILxTuXfEOjpS2nW1wEnkxhuXWwvgqHck
	 G0J/j84hFUjdU1/BaswTlkhLe5s0DxBcbS31d5+IJOf7WPndNOEQiYretgtM5HrZh/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kX12AYQB;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B95606A328
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 18:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B95606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kX12AYQB
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so38671585e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 10:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730651; x=1794335451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/iod9oXhgsGpyGcJPFTu5fqKBMIMVHyACTtYwHQfVM0=;
        b=kX12AYQByzaDcUWH/goAVyqMjCPkJJudffhhlpzcvmIkbNqNWnTh6bnWRkhZKqYn3z
         b7lBeYETqlfTQcxy2tUhQGz/MTffvs77/WLpNMhMwlRDc1TEafiBL6eVWg1k74ZbVJXS
         I3MJ9g/62ZiiN3k8qY+Zzw7EdHrY9nK1meusQvVYCuDD08w2zkwSTYjDa61bnPZC/E0O
         BDZ2jnAIk7CLOQH8dX60vXvYrIZaWFP48dkxZdDl28GuC/VwMPE4HzAMVuphLM6qQEMq
         g1Bj4ExPBkgQ6xbVv58SMtGgzF37CD51JsJ7OM6KKlnKUYmyS3cbzx8U6re3nnr9ZA3q
         5wSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730651; x=1794335451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/iod9oXhgsGpyGcJPFTu5fqKBMIMVHyACTtYwHQfVM0=;
        b=R0470l7X+DvsclhGhb5grXJ0bLXJmWMRN3SNVXgUCz54nSta/ufX3jk1lrH8PczLxA
         xYIH3igGzetAi+UCTVpViW6IuAA0vjYXoL6yiio1vPv2MbS/TM3HwJ7/bbd0OQhyCc5Q
         rFudNzT/RIpssswreVDIo4BdyC//VvirC3jOuKV7Iic63nCFPaRoqoWqeX72ujhKbzlA
         7knt3/kXrOXn/M9PREkA9w6UPE73QAqnCEYmuNA8dFtO3o7VjbojZ+RiO32rRAYunLkk
         VEqMp3jJc8eo7dXczMMTLka7RcZVfALVlsG/LquWa9TpwUazzwQe86qs1gDPSJiLnKOR
         ER6g==
X-Forwarded-Encrypted: i=1; AKwUvByIxiD8qQRiM6GrvRImm1hrgzv/KIUhx2+HD6gX5Vudj5AEBDD5QARSmd/xLwSWO3+ojVW4BjCZQPOd6Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z82Fv2jp49rYsxIq8VlpJzHUyDF3+sakVcD2QCaWzLxNfZpLBYX
	/WOgyoLbzB/M489eOM7U0gjvawCEoMCHXkGC4YSR7z+obtdlE6QbciEgCn9STg==
X-Gm-Gg: AYBFou0xVhgL+MY6LVo25L0ecdLsULmiJW/FhJkjZ+y3hAQftOwe92gsbFjcgEC58Ip
	bQGkoSofn4gX5YkfEXTqLI3Q7jCq22xlgsSfLbJ1aPV7G0rYJGZkPSODx/rymIjhllTVbw9tFsN
	/lQfJ6vsYrGEwraU86ADqwlYds6zGjBJcMVibSEJb5FXwIUi7Nm4RgnMiLM1mrpEHMOJE1UoW8Y
	DdD08pGBgWzG3NNdf0hWmHp5Zx9TNJZrMdmVIzeguPTNwTu/CH1M1XMK6bMatF4qWQI761Vic26
	u4WoNjmE0TLxISyb28yM4GoJ4ARVrTLUU8+M088p1hf4Na58S8i3u4EgIPwwFoUki48Nd7N3qPt
	1o0vSmmSsMmW/yaECdRdf4r285oc3I/V9FGv4+P94IM0i4wGxVVw3nnmXAi9nvDGwdAyFavbLQc
	CrtrhBHFTkA/mPYwydXTt4Qq40blgYaZhhkiSlx0RDtwcRyG9RFaYYhx/ZEbpYrqUEjzAmCl5z/
	xqvtt1ubYx0ECh1dTfA06zPJJCftjNnmwHKqRwLyhj8rbXM++ViwvZOZuK50MBMGcfUPsCQqPHT
	1+ELHZ/p3ZRGbmoIHHGi5co/03FKUNX+qCmnxZ1NjTh7CeDZZ8RKFl0lq3OMZoeJhcGrWfmI5sT
	CTuRwUSD9hDUp71rp+LUNAVna6MdX3x6uY21SlFVPI/8g9LLNEbd1fPAsbcuDoVJigS1sfeXTsu
	Ch7M5xPbcj3VI6hCFa7CPK+NAsCR+W+ghLlk14vGV/7coAS90R2S9LHcIxwxYUQOV9c9Y5bTv8u
	woBAjqCTxHCHzdLa8U02kNEo/JgoBA4yqRibYRpOpWZ1baEXl4tAmTeFL1+MQ0KCblFjlU=
X-Received: by 2002:a05:600c:3f10:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4ac1889cc2fmr303664565e9.19.1793730650716;
        Tue, 03 Nov 2026 10:30:50 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab00ff3dsm146339785e9.14.2026.11.03.10.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:30:50 -0800 (PST)
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
Subject: [PATCH 0/4] mmc: sunxi: fixes and preparation for A523 UHS support
Date: Tue,  3 Nov 2026 19:30:26 +0100
Message-ID: <20261103183030.81078-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This series fixes a bug in the sunxi-mmc driver and paves the way for
SD card UHS-I support on the A523, which will follow in a later series
together with the A523 clock phases, delay-chain tuning and the PF bank
supply switch.

Patch 1 fixes the manual stop command error reporting: a successful
manual stop command is still reported as failed, while a failed one
stores the error in its response instead.

The remaining patches improve the DMA setup and error reporting, which
the UHS-I work builds upon: a DMA mask matching the shifted IDMA
addresses, IDMA descriptors built from the mapped DMA segments as the
DMA API requires, and CRC errors reported as -EILSEQ instead of
-ETIMEDOUT, so the MMC core can request retuning.

The series is based on mmc next, but depends on commit 5e32202f532d
("mmc: sunxi: fix clock and runtime PM leaks on probe failure") from
mmc fixes, which adds the error_disable_mmc label used by patch 2.

Tested on H3, H6 and H616 SoCs, on multiple boards, including Tanix TX6
and OrangePi Plus2E.

Best regards,
Jernej

Jernej Skrabec (4):
  mmc: sunxi: Report manual stop errors correctly
  mmc: sunxi: Set the IDMA DMA mask
  mmc: sunxi: Build IDMA descriptors from mapped SG list
  mmc: sunxi: Distinguish CRC and timeout errors

 drivers/mmc/host/sunxi-mmc.c | 122 +++++++++++++++++++++++------------
 1 file changed, 81 insertions(+), 41 deletions(-)


base-commit: fd9af27f6c2319713bb23832066585f8a59a1771
prerequisite-patch-id: 8d600908a2eb84acfcd034482dd6e345242f1464
-- 
2.43.0

