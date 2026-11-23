Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455769;
	b=sv5JPhUkoFaLG2wCfDr/pLJQbJ9Tul6RPJX+2t5hG7R1tqKkpRoxbN9ql5ebcimU52bX
	 qDZTAAcIdh4QNRPAB2MpYM7TvQiWsUgpoxThh6Z5D7kpQe//5tcGu1CcgkyKTwVw6HWks
	 W+UdZLjJicc7Vlu/zQWbfE6z8Ckg1AJVoUdJe0VBQZwRHG5Y1RTlO4O/MjzkSOKyKBPts
	 FlhvZioZbRY0yqxfLY5mm9FCSmkxPSvhBqxJxORrp821obGDJqjPQpHMMOsgOBMsWPJZR
	 vrr9Pb2ijisCeu/sp0Oufab9nUzl2JoLXsm8aZ4JUJsk79QF1W8UPSIGGjEbaUtzmfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
	b=Ausr2z9wDnCdnhJ8WMG+MYt1W4JZP4kNhz5LWL5LlWMYMehH8Df31j/tQJvPpVSSYfOL
	 Ll232F6cPY8zLdUZW/sNTwiRMCa22NQE/zq4MBQMW9yb54CEpfLaIJbND0ycdvlegTE+j
	 7LhoAYbkQCnfZYUP738Ve/EYtCsWg+kk7OVn8wPVDiQ9NaEfDx7KV0XVnjkRkxOlEMbjJ
	 Qe2IhnbBBDaQ+fWN9lbjhDVS7C78OF5EvLU3A3KURQTDiCTtuZp+lCd2YnI/15DSMAvJN
	 U3SADjv90wA2ZHJE8naW9/aHDdH/oWfPwK6ZzD4kShkA86tSN7Cwyd5wOY/v3FK5x9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DT7a92w+;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178E4606A31E
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 17:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 178E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DT7a92w+
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8633b750a19so764465a34.2
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Nov 2026 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455768; x=1796060568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
        b=DT7a92w+zjCYCN31RYHqV8JRlM6wrE8R6WH5KALDdkJO4s1UfnkX/9oljLo/TCwnqz
         OKbnlmkLnduhLSme9QMdJt3rFguS1t2r795jnuIEoRK9HzVYXFAkuamMR1DnGFYpkcpp
         JUVRFHX6D2KuVaNRLIXNlknN6kweyADJ5ZR7CED1fK1EpNi21dZtDROWU5SavQXWKDok
         1kFyn+yeZQatQM6IPpUi5ez0QnP3GcwmFcjiO2zUckslbQKhPq8VVvokznXwgo9uZ9e0
         0bbgWeNBX+FIexMtcspi2KQl7i/VJzIMO6h05hKLRwasFm8Fl7REOZ5bQg10h8TimKBq
         6mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455768; x=1796060568;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
        b=2SwdUb9hxQ7mU87o2aGwsAENnbbafDQ9IkYBBNtZdvZUHo7yavp3L/x2SKmZORDUNA
         uKUbGCmFtpSWw3O0lBoe5pKTJNTvKoX8fz3Z0PuTjXD38BA4gg7WHD41kpa/P27mxVgg
         JZlp6pK+tGEabj7BLCrbVDSoRHRREidUkHfjT8ASR0H3ZzHlev2cZEe5TE+V+87nEFQ+
         ZSuN/qIoxNU4vxEat/lTLSm1Kds8Z3eA6Euf021zFN5+BQ2Yr0a9b+uS5RubLLLFn8Q2
         cAR7FZaOFp2uoQeSWLPLzmOmgnbmzzM0r9FWpsENfAgrOhqQefbSJZwWoGppsPNP902F
         H+sQ==
X-Forwarded-Encrypted: i=1; AL+hErHogpIqVGrs5Vfan6LIN+Py3HaLNu3Yj5bYxKJT1pryosGa+0Y9tM7EKPxj/8vmSi3oTB/lwxP4SvvAew==@lists.linux.dev
X-Gm-Message-State: APuU4Z+aw82S2hY2jhSXQyiIyVDLbUEK6UtQnKHYV9i4FkQR1RqKQiHn
	o2sepx6k/i4Ooy+i4CdogOnENC8y4628JfIwIS6u7FmgFKjYFoC4EbUB
X-Gm-Gg: AZFdTZeShC3aGnhGLVHD48NheIarcKOxdYsvP7+txF11G3d5ilKqHj2AqOgCsry0dla
	lCc4qYOXVQeuo12p0MrhSkoigk1eaO8DSUZmvaCyz/6BCJYJvPSFHWwh2mimSrxEmXhNb69PV+L
	4Q7bC277AuDm01L382qob/30DNpIGekO7ILYtIEYJanC05kNcdgf0D0l7ZS9Mrzm8X3pUe2X/Eq
	wIGm06/vL8s60m1zlNBfIbqlcpwIY2TfGO5hvMcPj7h7T/8M/SEQ7QverKkli7H8m8haT+t7MxF
	qZy7dpC6wtwQpot5cELO3RRWPhijKh79e+IKGGgTtKvPViParCrjlLtprhDehDucbbZbOqYfL7n
	0kw7LbColmUq0cu2/tAYUbynqjufsmm04LUNXDdeUyVCu/Uv+iakcA9uiVTPZHe8JShLgLT/XYX
	JX94/d2w0SzgD9Fn3FYKZiNEUVAtqjv9jK0xwTxaTabfWmwZF9+RvZfJH+MpXUngcMF2p2NU5vD
	e4ogaZ5/NKJyeJbHQ3ER6y0dQw3xtPhW55iMSIwXCpU7YnTYFBDEY0LIunLr06TZPjEa7/FTC6F
	UesmfjF4MgWL4krwJpa9eBKd0B/8qzQGZyqryAkU9f4qLvahiNbj+AhIocWh1B4AhjtHzzaQECx
	xuvjO
X-Received: by 2002:a05:6809:747:20b0:572:8a:59db with SMTP id 5614622812f47-57a742be1e3mr7669480b6e.25.1795455767809;
        Mon, 23 Nov 2026 09:42:47 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm8959220b6e.9.2026.11.23.09.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:47 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
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
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v4 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Mon, 23 Nov 2026 12:42:45 -0500
Message-ID: <20261121-a733-dt-v4-2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121112312.75ba7299@ryzen.lan>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <dbfb7c5ea8b0ade2d48ef8e5cfd0b9e5a9946483.1795034153.git.enzo.adriano.code@gmail.com> <20261121112312.75ba7299@ryzen.lan>
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

> So what's the purpose of this cpu-map really if it's all flat?
> I wonder what the term "cluster" should really mean, here? I mean there
> are surely different types of cores connected, with separate frequency
> and power domains. So the cpu-map should not be flat, but describe that.
> Yes, they all use the same MPIDR affinity level, and the manual talks
> of "cluster0" only, but I wonder if this is not what this node here is
> about.
> Looks like the RK3588 also uses the same affinity level for all cores,
> but has a differentiated cpu-map.

The map records the topology in the A733 User Manual v1.00,
section 5.1.2, figure 5-1. The six A55s and two A76s sit in one
DynamIQ unit and share L3. The BSP's separate PLLs, CPU frequency
policies and DCDC5/DCDC3 supplies (A7S schematic sheet 4) describe
two DVFS groups. Mainline can describe those with the clocks,
separate opp-shared tables and CPU supplies.

RK3588 and GS101 both use 4+2+2 maps. MediaTek changed MT8195,
MT8192 and MT8186 to one cluster each. The MT8195 patch says the
big and little CPUs are "in one cluster: fix the CPU map to reflect
that." The other two patches make the same point for their SoCs.

https://lore.kernel.org/r/20230126103526.417039-2-angelogioacchino.delregno@collabora.com
https://lore.kernel.org/r/20230126103526.417039-3-angelogioacchino.delregno@collabora.com
https://lore.kernel.org/r/20230126103526.417039-4-angelogioacchino.delregno@collabora.com

I kept one cluster in v5. Do you still prefer a 6+2 split?

Enzo
