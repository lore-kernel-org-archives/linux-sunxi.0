Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610522;
	b=4edw5zX8kutP4QF2tuxJedYexjI5Yk1dbbrwbmbSRIC9Z5ng0mhqj1tvJVM2Uf4VbOWi
	 mi11Nj/vX9Gg+BBFHsgwKG+o4XNzzFQOmxJDn5gGVQAUlJV2Uk6W+I5p8R21Qe0fCMLSj
	 2/bwyP6opRGwPTIgChMHAXr/cRNLKWrGAsBn7b9L1FQpvfj9bHFk6K+Gd7iFwOUNEclxk
	 g0is+NYDoRpXvQ2vTUj+Ixs5D7mbG6r6AwHeksKPT5CJezCeGu8GqKmHXmzjsSWwpWocB
	 Ts9UHTrTsC7MwgkzobcH/WIyg2028sORdXYtoRzv3aaXmiYaDBiUVRUCXBPLYpUS93g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
	b=04LxTUAZRYlSMDFQKkNUkCIfVySghE346sXQmRz03h2zYSLmaTqFCHNMIkeDBIXnGD2h
	 d/WVpaFJkbr0boCpO+nDi+CVcK9B2RXw0HDtU1v9LiBrLAv5FPUGSuG0VbnxvZ461rXC1
	 D19tmqQIBqiDMNb2JTNAgFDU2fNu1Kxb83RKsTbnL0Uh49Cf/0M/9DwwlkP3GqBIwPecJ
	 5HGAJxSfRb3WbSJmjEUcv1dw0z0aVT2s4+JX51y1aQrgNGOPf/O2yyE9u/ksJFVGEQ1d9
	 uoyV/EWj5fO1VPpTwsExSKz3asY2geF2DjkPFaTGzC0/MkF9jLjXTOX4/fSGi/NNOlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFURgAP6;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1649C606A326
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 12:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1649C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFURgAP6
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso3322670137.2
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 04:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610521; x=1796215321; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
        b=lFURgAP6kx+M7rDbMK9ylmUDToSzuvBa0JI8RMmOZY4edhQ+VIssk2mTU+naI5Xu9X
         tEdRfWGJ/ZxQ7v8qd0bAPKDBqLWy42WhvNKN/1EvkoCif9K40+HAGGEbsiqFyQOvFNV1
         Sq6/hXV74vdnKduf3FKP42zQsl/F8xpMT1D+DoJKS1kKrgAptkGJFaoH1e3XHBNn249J
         RfqpKGIjTPeKZ5daOrMwBF7+aqUqziCliWuB3axYMGg05EoUKRlk6B55h8o1xxq23Z4X
         IoP3SXZjx9uMvegwiFg82ZaiUZcJLgrrnpRIFT/gsNwGmGukEjADmPqeDGwlynw00l0n
         jsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610521; x=1796215321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
        b=c4iuhMez1hkJrGsPhK91sX0Xr+DsIANjOXfA/OgYhnePnDnuQNItE/0pPv3ys/RzIj
         LSFDV45JSj54SFy8UbBS2SZbHgJFZltUHdq6Pjqumo8X1BE2YJVaXKEhZTh4tw5e5+Kl
         I7chVNDSEF06vicuPA/sROF17diBFavAhte7BXOJCDhd80QcdZmFztBJ03tJF0TToTQt
         WtyIY411wzEaGSYpWiKki8DqTTEFP2s5+5+YhAxZe7VNs9KiR5sNoiWDPP292SQX499J
         M5E4LCokBlTV0H3VOT2+4qVTlrsZHQooO/BGBH9+JX3sqbNtPfd5Ly8OFEPzllLZoaUF
         YdcQ==
X-Forwarded-Encrypted: i=1; AL+hErHNjz0LpgqmKCUb86EGbeFfN4yx1CWeWeCq9Y73r0X9eMF7mdgh1les31fiS9qtz5NZKpNkluWh91yBOA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/nx1voiC84cNR/xQ+ActdhxgmwFjYvOLf1PsSm20hndHKQq/mB
	LBxSBjjBZVyywS5zDdYwDZuZ892eE/nCzTIFyJrEfnPIiPmPinqISH/n
X-Gm-Gg: AZFdTZc9Xz/DiefqB1/aUsVDgXnQUaztEbGqyiW4xZIdSZgJ26bHpICHXpzuBX3ijrN
	x36opJyKqCMlUc4OdYO4lVe0FkPqgRGHJkUSfupugjDpgT1jesBlHv8/78WwviKzSzmIM0fIesf
	1lz7Gv7Ound8XYUCo/DuGeY515c2ZZ9HI5KRAGMLdC1MavSqswFI1KVAoiniyQvdpqkeAVzpZ3H
	53X8lYHjD3tiEMgOSvGSHZvSDbtXkILC+DqFheqPyKzkFD2iHRI6kCkBo4xJTaSEvMxquX99VXy
	+4ssz/V44BM0Nez5KRe+O/iXh7nzkjGGyAH+2BvbdRf7Q9w35l3c5Dv5xb05R5hyXzp/UPdY0yG
	28a/Z6uh0W2T51cNsyF8o7Jhfg1cwuaY+TwNEGd/DMeVPsj/8I6PQcRpQsg3MtM0bJdK/Ltqbpb
	nCzG7qagVaEI3X0EtTFHwG5/gnwK9r6J0apBBEaowBSfx9ABIEtfwn6037CTc+jlSe40DBuDv5d
	k69s4S1guIEij9tUt9bHZCDbto6HJEgGcXy9m4ZvN+yqXoOUBOCTOl5Lwa/HQynnVW7TbaIQHh7
	Ar7SfoHT7oIl7Ai1KQn3jkMo+RB6CEYYcM8Za1hTzbIxLkM9d1MNzTw5JqeNIbF9ow/aOQ+45RM
	PgioBl+FWpnSiVFj8uqaWuH+OxIcdM4M0mdvwwYkOH1Cp44kh
X-Received: by 2002:a05:6102:951:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7d73939011emr10098810137.12.1795610520935;
        Wed, 25 Nov 2026 04:42:00 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:f600:3026:6717:b8b7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e033aafsm18213181241.7.2026.11.25.04.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:42:00 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Wed, 25 Nov 2026 09:41:39 -0300
Message-ID: <20261125124139.23869-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com> <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre, Enzo,

On 11/24/26 15:42, Andre Przywara wrote:
> could you wait with a potential v6 post until I got that one tested and
> posted? Then you could ideally also include Vinicius' A7Z patch, so that
> we have all in one series, and just need to deal with the dependencies
> once.

That works for me. The A7Z DTS is ready on top of Enzo's v5, with the
review comments so far addressed. I tested it on my v1.11 board: all
eight CPUs boot, MMC0 readback matches the reference SHA-256, and
card-detect hotplug works with GPIO_PULL_UP. I also tested PMU counting
and overflow interrupts on both the A55 and A76 cores.

The A7Z binding entry is "radxa,cubie-a7z", "allwinner,sun60i-a733".
Krzysztof already acked that addition in my v1:
https://lore.kernel.org/r/20261113-tacky-unbeatable-pronghorn-74ed4e@quoll

The v1.10 board is still untested with GPIO_PULL_UP.

I'll post the updated A7Z DTS patch to the list as a follow-up to this
thread.

Thanks,
Vinicius
