Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725235;
	b=UIMFlxWZF3aJMDWB+2UcoUaTv95X2SypoL8zAPqx8wGca090Mb5nTVaLId2B2hviSAWC
	 8YHRtOiflTNCAcj5mEDVujPysWJHPWAovLGRNBTCcjJtcMG4Uanez0Foslyy1Gn6+54Sh
	 1I8AYg3NW/kZtec5Yiiez85VgxFOPWTvbSfdLLnpIV8IBRd8TeM86SW6FglxLi61K44y5
	 H1meitllqvgBPITGybGu6Rrpt9EUM9jl7/kZytzvzRZitM/5SO06Ivod8DE55HiXPEx1o
	 2TlUyjB0Q8F44Enu2jDsq+6LtE+/rllGyye5pv+Z4lhi55wEgYV7Wdb6EQ6QTj2cvrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
	b=tiLF2B7Ch5P53H4LHUYFlwr+NUtBaRlNeYPnEpwwtx2Xfm3wF+PFczoUaUWumH3jDJ7D
	 a73Kj1k2lQOGtJYPn1wke5n9XaaP/kzN6bbp1HksQzAQg7vnZOjdk9UxxUDKFXs4b47hL
	 DQR/NaSZILuG5ucn+IDXQH86X03YXxVQYiyAvmTbR+AzaYfC99VN2vytz9otupiKZq04J
	 1BhIZmG1+1goVsfgT73QimdvhCpc9z/yYpTI2Dd5Ur9i9IM7JvP/BsfGA3G923HO8k9f4
	 0TYXIo9rGV/iTLNoShbnh0f4Dub+T7YfcFoJKQuhTMnX9Orkk9Ihv2zMMYzaBxvchew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uv2twGs7;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D84A606A333
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 20:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D84A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uv2twGs7
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-57728d859e9so3110444b6e.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 12:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725234; x=1796330034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
        b=uv2twGs7VCPsFQ0G72W//nw1gvKXcNoSRE4Ie0ctFMEU7+/DJPYNfnZ1Dp3oWbdhYZ
         YLlBuLNJVLlmDkFGM/XK8+iMtLT644ISns62DatEdR8ukTeEqayiRegRaHfPZ/vMW35c
         bwIaSANsvmoFhmHktubE+wSykQeYMt4GrkGK1kr/rgz8Cra/+Ryu3r7QBXpsOQdERuvB
         1V2XNuVKgxRCMRfs2SOCLmY/DCjDjrjy7thCi9EDvdBXKfbdZw1BRT1t2/oxkP0SIQWl
         ibXr4ye0MAu1DvlDBNo4r1J4wLVe0GaTZ5+ylM28+7xJgh2reuh4YfM7B81hc5CfPr5E
         5w/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725234; x=1796330034;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
        b=zvsGyAfqgNeUhiXp9o3XGxcj6j3RSIkMDG26nfAM4zN4qJdpQ2g+nqQf0pFo47mxMX
         ds2B559YZnz6tjzch4CwUA2KttDNe+GnfyDsdNcwacIFoAKMyLB8AZ52QsbCWkMw20j5
         eQ1DSYVc0t+HBMm1fdlA/NmsfLdjqDoYUPLQSQUXLZBkFuwO4rGXW0AiCOSOw8ACwlL5
         I7dUnYjOufyRrTThm7RlMcTizefb6NloT0RtjBEPYxRN63VhzpRaUu0LkTkztPauW3WO
         IPKfdG6xt0AHrLSH1XfClCz79yVgOtP14Tbgs/DXPjcKbIpXoZvjLTj8kknNXJSR2qMD
         JdlQ==
X-Forwarded-Encrypted: i=1; AL+hErEVAh3BfSGjiyTZ9G65p4OlGHPq2ogcGL+QVM0NicccCh+YWWcRqQtkUbGi4/kLE9q+/pKhXRXVI0dxHg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9PoQE7qBqvPtxIhtoFqr26CyC5wswhK8+q9ebonv3RIQLyJsjI
	3/cBNw5co2HWDUr6VUT8Lv0l3ePqdCLsA+INElgNe/M14t6Op3MEcE5i
X-Gm-Gg: AZFdTZeyEtERo3V9+YlTeNDvHo7udphVe+1/ffDFHKCJrlz7TL7O9DkXMBq7BgviFVO
	wtj502TeqklR9ANJMbMpK/ltaZev/o2s+V9iKNLqPFdmazYkOp2NTuaKCKJzIVP1v1wpEX+gNs7
	F2qxTb6WO7Ls6Ea5DYm16JeUexX3w6JHuFUGYmNAWgTDzkvB3kJAyJWsJ0FTXUXCn6NyQcGr8Sj
	lFoQz7kzCh6270dFodsDMgT3enEFUeW/9KnSs/nMdWOF3lfjgz8Baoy1StHtKKq61nwfnVNjrOa
	SY91O5JvTarHSuq28HsFsPy+CkPUXDUIMH29vsD/o+5QnIu9aGUWWsONG/oXv9jgqcIm25E3yic
	BNsvyE0pG6MqMJdrufaDRIDp040y4wYQaPfnMh3U1QVLX1NcbuoGtFcRrKckx3GQ8oT3SNBzrg0
	Ep9i5eLVZMIoMzii0zg1yHU7xmfmBcbXDYtjPhpHwNkfpt8Cu5HeB5mrPWJxpZmXex5NRdYEQfr
	fmkSWuMEjNvoZYzGMJw3u0D7DZHLpHa5rJPT26GSVARjm7yejDa2YTuphKQ7H2EgjTJRB6Oeoo/
	PTAHrAaiXk8f3j/cEHVEbfCiTduvGOkoNuwy/+HGj4hZ2ndN5k4xA9ZDGZCoKJXaaloaTshs+QF
	dkwWWSVY=
X-Received: by 2002:a05:6808:4fd4:b0:55c:859:adc with SMTP id 5614622812f47-57a0c5bfaaamr27052957b6e.55.1795725234464;
        Thu, 26 Nov 2026 12:33:54 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a31929223sm17049002b6e.1.2026.11.26.12.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:54 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	wens@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Thu, 26 Nov 2026 15:33:52 -0500
Message-ID: <20261125-a733-02-soc@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0e94af87-71d1-4a5c-a2bb-218a2306db27@arm.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com> <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com> <0e94af87-71d1-4a5c-a2bb-218a2306db27@arm.com>
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

> > This should be evident from the schematic itself (the pins are used for
> > I2C). And then the datasheet would tell you which mux value it is.

A7S schematic sheets 7 and 16 show PG8/PG9 going to the EEPROM.
A733 Datasheet section 4.2.6, table 4-36 gives function 6 for TWI0
SCK/SDA. The v6 commit message cites both. In v6 the I2C0 group has
/omit-if-no-ref/ and the RTC clock include follows the A733 clock headers.

> > Someone please test the PMU.

On the A7S with v4 I pinned perf to each of CPUs 0-7. Cycles and
instructions counted on all eight. Sampling cycles at period 100000
delivered 193 or 194 samples per CPU, all on the requested CPU. Its
PPI 7 interrupt count increased by exactly the number of samples.
The two PMU nodes and their interrupt partitions are unchanged through v6.
Norman also verified PMU counting and overflow interrupts on all eight
CPUs on his A7S with v5 [3].
Vinicius also reports PMU counting and overflow interrupts on both
core types on his A7Z v1.11 [1].

> So I wonder if you could take just that binding patch already, to not
> block progress here?

The binding is Vinicius's v2 3/4 [2]. It adds the A733 compatible with
the DW APB UART fallback and has Conor's ack. Taking it separately
would cover the DT dependency. My console tests also used Vinicius's
driver changes.

[1] https://lore.kernel.org/r/20261125124139.23869-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[3] https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me

Thanks,
Enzo
