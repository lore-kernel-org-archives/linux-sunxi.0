Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802844;
	b=kvBPqNWELTogN/aafCUILXccCip/YBh7QL1IJ0dASLWU+pxBxShcyYjK/D7lFpdCZCUT
	 w7pRl9P1YnV8cfTsdiUJl5Vg7IC9AEkBNMSezV9OCqEk4YOq13T+NzkJIUolrAR4JMX9J
	 97t44pOSZHl63aqS9HSJqmZU6SpoYclGyST5Sldnm9SUOWo6vb4c1oXpFeGdW3SOQjCy+
	 luWkHPJlAac3CxOcxHqlfTK+9lgEZ2Sl4gkcyd+fyD6n7HqtjbnWWw2ZY5Ksj0ReKHtYE
	 alKGRQgDbcCmd5LTfBhJp9ybUzZpU2EGdBmixfWw6hsBWt0dkZkm/g083GdZhxeumcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
	b=TI/kwloGy/vgdHgx//SJhpFpN1KxXPwZJTP00tKdtIpKgypENsJDeh8D3ZB8Jukw0I3/
	 ePu8kYRPbKKKgd8im3RGClnLIaNG+3SNXibCmPjUb4fO8YmgbKj1zkiyEcg/xxZqjykqU
	 a8nfbbXWnZNhBqFDbx4ks/vQ/M3GUCdOoHlsfnf8O0/2H7/EFf2wGVRKeGG09zFhLX6sf
	 ZAvT4YmDbiT+Otyn7pL5Kg6qOKNG6NajJ1dHDeX24vQ3Fq3e0Q9ZzZewqGPjk9xh2Q2UD
	 BWP+XAzXZWqiGr+h7l7amPnTI2KeEyXhk70ELbBoXA7aiM9znyd1S1wuyNKNJ22971Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kyx8EdB4;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C82606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 18:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1C82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kyx8EdB4
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8470d7d430fso4171020a34.3
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802843; x=1796407643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
        b=kyx8EdB44sGZUOUFs4TFPHrAf03evGU8QXzmMP0yCDy595oCGrU6oOuDGQMSwyYISb
         mTDeM3gJIXBJpiFT9PJFqoiSzi/Ha239e5wNWRUyGgLm3axxDLgyAX3+WYyOMm9N4gMF
         XajUYjJmu7VgcDnzrfkVdk+V6P5abYK7MIiGcvv+ySro2bjkKyi+ylAW2pDne3K+2HqK
         RkKJcVcq25i9pgwynNVW6ikQWo5+1QJbrsfK/gmW5VqSFtxk3awMhiesVnJYPyWuEHpq
         yZMNJd1zVz0yAGdRvDSUTqbNIebS8o34cDCz6bopCwH5Tb+cm8W1yJcbjShjkb7QxITc
         TMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802843; x=1796407643;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
        b=xUsiSUm7u+w/Wv4Q3iknS5YdSgyOVGZsyzLgz7yYQw/p9X8PsNQc9I6HVWJCi1tOqZ
         CQqX1DHxMujHD6HNXPSjsq252wTjR41mo7pkpM5sIMFAcnbUKa5j7PCG0TeTgXMyn1gH
         d6O2iNwJL0dnHZg3sLAMu/FWEeWqSzutqV2WMFBr3SNDflh3d1lc0eMmHLTWivs9Ov/7
         hxVio0/d49djlBOkjm3PsJ1mQAklFYNkEjR8MOZtjGIOSSXWt4Jf3WV60q7VkLLVQDJl
         q9iZm+QQuuRHPvijALRRZJqy2o+fRT1FvNFkWE79TwVDzcen7wY458/DlHSzhscSkGEM
         FzuQ==
X-Forwarded-Encrypted: i=1; AL+hErGlaymaqcBGRF5ba8cxm1d2JFCCMz4C7B07JhFo5HtkI+B78aU4fD8lGVAJrOKGZBsR+QBjeX/aGixeug==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Cway6dK0RgHHc5Lxdj6ORyVTBODdBk3HTDbBGNnHbcLoazseg
	eIjg1Z7aXPSh3UByLs3tW7l2k1aN17Pa1ddXKncSkyuFLWmH8P+SYjan
X-Gm-Gg: AZFdTZdq9U+zgvHCxhCTu7JisOhfQoZukAPhOFJao7rD+z36FuY/uMejq5VAhyV5sX3
	gi1knw5qDaljPn9nRT6lXYAg/qsYVD//spLMs2AsOHuRVS4BmXhnKJ/hQi4/RI3yxIWdUlsQidO
	oKh7pc/R8DplW1blvLvdpwccJKQNg/2hRFAgADQTW7uh51SESnJga7+S2EpQBvtSp0J82JTY7rC
	Ihw6cO4iZzHtODGXyrYeltyrsuyaEblhjabuOre6hG8vVc8fFPz9Ug7PgIF5v9qniBqbUD0cDwm
	oxSKs4vXktos/IEhim4IzRV5pgVg2LsiTw1rNcYFIyBpWWwiuudbHI5fX51xyM5iP9kksqc7oZL
	YyvI7zOtdDpnvHh8woR2VnMt8vRS+8R7BqsvC37WskYzy2YgK31e/Mct69sUle3BEm+dlttcdzq
	cRqXuMhrg4Nn0e3S/8BGuZdBQBOamd/zHJuRBLS8RlhzNO17KFfWZyPtUJLAvmcaogeqIGg4OFQ
	ronV/tuWK6U7WvIa2nOBD/u4Dwd3uB6S1IrBaPCffIuqt/KPGDGHIsLZTH1pMM67lbSFp7pi+lz
	wcce7/pbTx+AMFre8MFwplPly8uiXugeB8naMMmNN8s/mu+HY0ev2hR98CTyjbK5yACdNJ0oics
	Tv/oCbA==
X-Received: by 2002:a05:6830:438e:b0:814:8259:781e with SMTP id 46e09a7af769-863151bb271mr26675869a34.1.1795802842835;
        Fri, 27 Nov 2026 10:07:22 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86322db2d1asm16267566a34.4.2026.11.27.10.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:22 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: vinicius.eduardo.pedrosa@gmail.com
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
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 4/5] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Fri, 27 Nov 2026 13:07:20 -0500
Message-ID: <20261127-a733-dt-v6-03-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-236169@kernel.org>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-4@gmail.com> <sashiko-outbox-236169@kernel.org>
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

> > +	vcc-pm-supply = <&reg_aldo1>;
> > +};
>
> [Severity: Low]
> Should vcc-pm-supply in &r_pio point to &reg_cldo1 instead of &reg_aldo1,
> or does reg_cldo1 have the wrong regulator-name?
>
> reg_cldo1 is a 1.8 V rail named "vcc-pm-lpddr" while reg_aldo1 is a 3.3 V
> rail named "vcc-pl-usb".

Vinicius, could you check VCC-PM on the A7Z schematic? &r_pio uses
reg_aldo1 for vcc-pm-supply, while cldo1 is named "vcc-pm-lpddr". I
will carry whichever fix you confirm in v7, with a note.

Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
on 2/5 [1] and Andre's reply [2].

[1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
[2]
https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com

Enzo
