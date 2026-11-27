Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802856;
	b=2YlodqLihhz4PhUKgPi02CSnprlQSofsaAnT4GWuRyM5b8iazDy1zxa3a9Zdvb/6F6BY
	 VDnwc78ngwUC7XLHONEtzKlKnF29wrMJ0HW5wUW91o7ITdzQf6joSHY/Y4gV9Ogm2zGdb
	 Wck1hPbk4h6iRXu7GNGI042KChrg/gbEFRI1/kDWz3GKdrWjogMDIIYho0blDg7vMJokB
	 insDfkjJQWqc+u3LbX01gso7rMfTZXvYmWB9VZ6g4a7LDf/6yktkwX94Wx09aLA013Bri
	 XB/DMBIWl43uzDOhvJ++VswzLvvMKiCH5Tjyp4OmDBlkGBO7vFvQlcDSoYvdirRrwBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
	b=f8a4hNxZRqzcQ0bTQeoknfTYyOXgJGcG3DnYc+P7MmdXiAKlj449F094GZixCRQl8iBZ
	 yyDyki9hrALUYbXtcbhjoAZTyrfaSAhIDDO7zPZJR44ZAEcjzCTQMrrAMcfyW9PcN14RZ
	 8cL6yU3rLFnEoW8YOdxjiwsUqvW7uWr6nFXwdrQ+bvQ1YucmtLZXJzucwPiJ7+7MsN2vn
	 MwgvjaKIzbTMs4Pd0SQrkidgq1dt12B8Xn+E7/ba88mxwf8PQVFUvKWFv880gxN+d1VZ7
	 nOzLs8MKyhcvkuWFM0cwbsPrz5ToD0OKeAVjhtUjZSwbJ+rA2JWY9ruIrSa9j/chDPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oyc6SUYD;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96F9606A333
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 18:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D96F9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oyc6SUYD
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71b945cc4a6so710025eaf.2
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802855; x=1796407655; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
        b=Oyc6SUYD8or4cCqzSxUSVT1Mv5zREafclm/OGzntoruxPx2tsAx50uU0kUhTX/bklQ
         IC7IGQtiRQ27zSWUl4kQSSLStcIYweMZT4V4nzv+aWtJxkALvP7D7SsBluElpniZZtDH
         ga/QlrOvcUMYolF7vgXewV5Ac4D04uqWclG85Vgmg5YkObAWCJqBta958hbbszS126PL
         UO1O9ovLq+6QVfcAIdw0+yRWu9d49pf8Jf4qMBu7NN+KT6RjBC5Z0gS+2lDWVOgzyhUV
         06aoacGgMOsOGAjB/3t0L/DvKkOnTQZmimVtSlAjfOPRDTZ2I1v19mLNLiftGP7UOzgF
         tT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802855; x=1796407655;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
        b=zbWt2K802rvTV5VRBcidgNnfSpmNRA09kyEgVLFq+tZNjiOs0BXmwG4aZ6GM2dMBq/
         Uv2JXLr8QOd6+FyzVBHKv02HCkzBFLNRlLYrzxo2V5KWNCqKJTz/p8rWfwR3LnwDqF15
         rh1JqZBvbQZP2aVQuA5zbQUppNfkp5nusVoTR+HihWlyui14YzHkoI6hV8VbJIiYNP7n
         fh8+JQwainiL/DJY58CrpFpXpmfP2Rv8/kEX4EaG/JyvAZnAt8sMKIzBdhdG9AzW9z3T
         n2/8Eb9U1SWfkysmjWXfhzUCHLCTaN4HRNWUxfScRZA0ed8pcUSD8SgVyeQBPIHYeJUs
         9ehQ==
X-Forwarded-Encrypted: i=1; AL+hErHrLEgIqMiX7o0SeUZ9QuukyMgtXWry19fgmOfGi86+4ONs4q+9ONDaDqXy0pACYPDETAcqVqrxwYV6jg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/zL6BZPwqymbfm2+UD8RkE0kBvMWBUvcE4/WUHqJZOPbAcIZnY
	QIrSTIhHio7TNbENaXLt82AdEI1xZUAWZVFbbo576c5Pt2mENR9kQ+mg
X-Gm-Gg: AZFdTZcZeVQW9I1VzXL1sp4LfUnDlAZeVJ4ZM/Crv7PszVyEpgC8mv41mV0v1fuN4Wk
	47ejAY5DhxdLT5IJAa67EwudnUNG9FgK7A8RyP858WojECvxAJBEoAa4Ir9sSM+fFSi95BLJzhn
	lTv9zzXtFINlaOXt//fOgJuoryFsRpWf1I1yK6zdgLD1H1hYymlINhELpsbooRhhxM8XURFysT1
	wUcfAXHIBrlc9NiAipmY9SCNaYWPc0L5Vr+YhlaSJ/QiRp52IO1Diyjeet7gTwziRX3NkOpMb0B
	thct+r+w+d7w3uI7ym1YYXir3Pd1MsJZIqPzqMF0g9ozm6IqzJdWbNIM0aldS9g5VgQVWfnk/pc
	Bce1VLbGT7JfUCej7E6C1eClfEbXVBsDgXLm239UF76ZJ/loPTcufW0zepBjqX7MQ6t6JpP4e55
	SjVmH+XhPoUB6B5HYvxY/kaum/9Ck9QCrX6iKZdzHFTgKkQ31rwuiih6t68caUgVt0V6bCo/Q+B
	BEyWr+KPjOjvCHrK3U8WJbUKHGxZRszu3pKa85cClj977T45MeA6IGHjO6hwrX94ROSCzjvNePb
	eZY2AfpzcrZ1182NcIjbGKl8NPzuLF40ztPnIS1q0s18INS0V9r25S8/9G8Scin7gJ116jyy6qN
	eA91Hetg88eHnTrzzr2ANptnQUM0=
X-Received: by 2002:a05:6820:3410:20b0:717:da:ba40 with SMTP id 006d021491bc7-71b394956cdmr13815414eaf.26.1795802854800;
        Fri, 27 Nov 2026 10:07:34 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38015c46sm16618767eaf.4.2026.11.27.10.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:34 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: dockseed@proton.me
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
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 27 Nov 2026 13:07:32 -0500
Message-ID: <20261127-a733-dt-v6-05-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <z51JFKDjnRGxR5v8f-2sigY7Ih39S9_hQJF-C7-0jwRzGvAZcyniqmAsBFOyj_Vci0JDoXGMbuWcop6uSGRMUon5bqjJFMIjMk9jN8TbaLU=@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <z51JFKDjnRGxR5v8f-2sigY7Ih39S9_hQJF-C7-0jwRzGvAZcyniqmAsBFOyj_Vci0JDoXGMbuWcop6uSGRMUon5bqjJFMIjMk9jN8TbaLU=@proton.me>
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

> The cover lists CPU/cache topology as untested: all eight CPUs are in
> one cluster, as described. Patch 2/5 mentions the shared L3, but the
> DTSI has no cache nodes, so the kernel falls back to reporting L2 as
> shared by all eight CPUs as well (index2 shared_cpu_list 0-7).

Right. v7 rewords 2/5 so it no longer claims the shared L3 is
described.

> The EEPROM probes as writable. It holds Radxa's factory data, and
> our own DT reads the MAC address from it at 0x9e, so read-only might be
> worth considering.

Agreed, v7 marks it read-only.

> Card hotplug, listed as untested in the cover, works with Vinicius'
> "do not switch the mux to read IRQ lines" fix (a256b8c8083e) on top:
> pulling the card gives "card removed" and reinserting it gives "new
> high speed SDXC card". Without that fix the PF6 level follows the card,
> but the card detect interrupt never fires, so the A7S needs it for
> hotplug.

v7's cover letter names Vinicius' "pinctrl: sunxi: a733: do not switch
the mux to read IRQ lines" as needed for card-detect interrupts on the
A7S.

Enzo
